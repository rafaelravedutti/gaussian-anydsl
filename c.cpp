#include "thorin/continuation.h"
#include "thorin/primop.h"
#include "thorin/type.h"
#include "thorin/world.h"
#include "thorin/analyses/cfg.h"
#include "thorin/analyses/domtree.h"
#include "thorin/analyses/schedule.h"
#include "thorin/analyses/scope.h"
#include "thorin/util/log.h"
#include "thorin/util/stream.h"
#include "thorin/be/c.h"

#include <sstream>
#include <map>

#define FILTER_WIDTH        7
#define FILTER_HEIGHT       7

#ifndef list_contains
#  define list_contains(a,b)  (std::find(a.begin(), a.end(), b) != a.end())
#endif

#ifndef print_list
#  define print_list(h,a)     std::cout << h << std::endl;                                              \
                              for(std::list<std::string>::iterator i = a.begin(); i != a.end(); i++) {  \
                                std::cout << *i << std::endl;                                           \
                              }
#endif


namespace thorin {

static std::list<std::string> shm_buffers;
static std::list<std::string> shm_blacklist;
static std::list<std::string> kernel_images;
static std::list<std::string> kernel_filters;
static std::list<std::string> kernel_pointers;
static std::map<std::string, std::string> conv_map;
static std::string image_width_name;
static std::string image_height_name;

class CCodeGen {
public:
    CCodeGen(World& world, const Cont2Config& kernel_config, std::ostream& stream, Lang lang, bool debug)
        : world_(world)
        , kernel_config_(kernel_config)
        , lang_(lang)
        , fn_mem_(world.fn_type({world.mem_type()}))
        , debug_(debug)
        , os_(stream)
    {}

    void emit();
    World& world() const { return world_; }

private:
    std::ostream& emit_aggop_defs(const Def*);
    std::ostream& emit_aggop_decl(const Type*);
    std::ostream& emit_debug_info(const Def*);
    std::ostream& emit_addr_space(std::ostream&, const Type*);
    std::ostream& emit_type(std::ostream&, const Type*);
    std::ostream& emit(const Def*);
    std::ostream& emit_shm_copy(const std::string shm_name, const std::string src_buffer, const std::string width, const std::string height);
    std::ostream& emit_shm_access(const std::string shm_name, std::string x, std::string y);
    bool lookup(const Type*);
    bool lookup(const Def*);
    void insert(const Type*, std::string);
    void insert(const Def*, std::string);
    std::string& get_name(const Type*);
    std::string& get_name(const Def*);
    const std::string var_name(const Def*);
    const std::string get_lang() const;
    bool is_texture_type(const Type*);

    World& world_;
    const Cont2Config& kernel_config_;
    Lang lang_;
    const FnType* fn_mem_;
    TypeMap<std::string> type2str_;
    DefMap<std::string> def2str_;
    DefMap<std::string> global2str_;
    DefMap<std::string> primop2str_;
    bool use_64_ = false;
    bool use_16_ = false;
    bool debug_;
    int primop_counter = 0;
    std::ostream& os_;
    std::ostringstream func_impl_;
    std::ostringstream func_decls_;
    std::ostringstream type_decls_;
};


std::ostream& CCodeGen::emit_debug_info(const Def* def) {
    if (debug_)
        return streamf(func_impl_, "#line {} \"{}\"", def->location().front_line(), def->location().filename()) << endl;
    return func_impl_;
}


std::ostream& CCodeGen::emit_addr_space(std::ostream& os, const Type* type) {
    if (auto ptr = type->isa<PtrType>()) {
        if (lang_==Lang::OPENCL) {
            switch (ptr->addr_space()) {
                default:
                case AddrSpace::Generic:                   break;
                case AddrSpace::Global: os << "__global "; break;
                case AddrSpace::Shared: os << "__local ";  break;
            }
        }
    }

    return os;
}

std::ostream& CCodeGen::emit_type(std::ostream& os, const Type* type) {
    if (lookup(type))
        return os << get_name(type);

    if (type == nullptr) {
        return os << "NULL";
    } else if (type->isa<FrameType>()) {
        return os;
    } else if (type->isa<MemType>() || type == world().unit()) {
        return os << "void";
    } else if (type->isa<FnType>()) {
        THORIN_UNREACHABLE;
    } else if (auto tuple = type->isa<TupleType>()) {
        os << "typedef struct {" << up;
        for (size_t i = 0, e = tuple->ops().size(); i != e; ++i) {
            os << endl;
            emit_type(os, tuple->op(i)) << " e" << i << ";";
        }
        os << down << endl << "} tuple_" << tuple->gid() << ";";
        return os;
    } else if (auto variant = type->isa<VariantType>()) {
        os << "union variant_" << variant->gid() << " {" << up;
        for (size_t i = 0, e = variant->ops().size(); i != e; ++i) {
            os << endl;
            emit_type(os, variant->op(i)) << " " << variant->op(i) << ";";
        }
        os << down << endl << "};";
        return os;
    } else if (auto struct_type = type->isa<StructType>()) {
        os << "typedef struct {" << up;
        for (size_t i = 0, e = struct_type->num_ops(); i != e; ++i) {
            os << endl;
            emit_type(os, struct_type->op(i)) << " e" << i << ";";
        }
        os << down << endl << "} struct_" << struct_type->name() << "_" << struct_type->gid() << ";";
        return os;
    } else if (type->isa<Var>()) {
        THORIN_UNREACHABLE;
    } else if (auto array = type->isa<IndefiniteArrayType>()) {
        emit_type(os, array->elem_type());
        return os;
    } else if (auto array = type->isa<DefiniteArrayType>()) { // DefArray is mapped to a struct
        os << "typedef struct {" << up << endl;
        emit_type(os, array->elem_type()) << " e[" << array->dim() << "];";
        os << down << endl << "} array_" << array->gid() << ";";
        return os;
    } else if (auto ptr = type->isa<PtrType>()) {
        emit_type(os, ptr->pointee());
        os << '*';
        if (ptr->is_vector())
            os << vector_length(ptr->pointee());
        return os;
    } else if (auto primtype = type->isa<PrimType>()) {
        switch (primtype->primtype_tag()) {
            case PrimType_bool:                     os << "bool";                   break;
            case PrimType_ps8:  case PrimType_qs8:  os << "char";                   break;
            case PrimType_pu8:  case PrimType_qu8:  os << "unsigned char";          break;
            case PrimType_ps16: case PrimType_qs16: os << "short";                  break;
            case PrimType_pu16: case PrimType_qu16: os << "unsigned short";         break;
            case PrimType_ps32: case PrimType_qs32: os << "int";                    break;
            case PrimType_pu32: case PrimType_qu32: os << "unsigned int";           break;
            case PrimType_ps64: case PrimType_qs64: os << "long";                   break;
            case PrimType_pu64: case PrimType_qu64: os << "unsigned long";          break;
            case PrimType_pf16: case PrimType_qf16: os << "half";   use_16_ = true; break;
            case PrimType_pf32: case PrimType_qf32: os << "float";                  break;
            case PrimType_pf64: case PrimType_qf64: os << "double"; use_64_ = true; break;
        }
        if (primtype->is_vector())
            os << primtype->length();
        return os;
    }
    THORIN_UNREACHABLE;
}


std::ostream& CCodeGen::emit_aggop_defs(const Def* def) {
    if (lookup(def) || is_unit(def))
        return func_impl_;

    // look for nested array
    if (auto array = def->isa<DefiniteArray>()) {
        for (auto op : array->ops())
            emit_aggop_defs(op);
        if (lookup(def))
            return func_impl_;
        emit(array) << endl;
    }

    // look for nested struct
    if (auto agg = def->isa<Aggregate>()) {
        for (auto op : agg->ops())
            emit_aggop_defs(op);
        if (lookup(def))
            return func_impl_;
        emit(agg) << endl;
    }

    // look for nested variants
    if (auto variant = def->isa<Variant>()) {
        for (auto op : variant->ops())
            emit_aggop_defs(op);
        if (lookup(def))
            return func_impl_;
        emit(variant) << endl;
    }

    // argument is a cast or bitcast
    if (auto conv = def->isa<ConvOp>())
        emit(conv) << endl;

    return func_impl_;
}


std::ostream& CCodeGen::emit_aggop_decl(const Type* type) {
    if (lookup(type) || type == world().unit())
        return type_decls_;

    // set indent to zero
    auto indent = detail::get_indent();
    while (detail::get_indent() != 0)
        type_decls_ << down;

    if (auto ptr = type->isa<PtrType>())
        emit_aggop_decl(ptr->pointee());

    if (auto array = type->isa<IndefiniteArrayType>())
        emit_aggop_decl(array->elem_type());

    if (auto fn = type->isa<FnType>())
        for (auto type : fn->ops())
            emit_aggop_decl(type);

    // look for nested array
    if (auto array = type->isa<DefiniteArrayType>()) {
        emit_aggop_decl(array->elem_type());
        emit_type(type_decls_, array) << endl;
        insert(type, "array_" + std::to_string(type->gid()));
    }

    // look for nested tuple
    if (auto tuple = type->isa<TupleType>()) {
        for (auto op : tuple->ops())
            emit_aggop_decl(op);
        emit_type(type_decls_, tuple) << endl;
        insert(type, "tuple_" + std::to_string(type->gid()));
    }

    // look for nested struct
    if (auto struct_type = type->isa<StructType>()) {
        for (auto op : struct_type->ops())
            emit_aggop_decl(op);
        emit_type(type_decls_, struct_type) << endl;
        insert(type, "struct_" + std::string(struct_type->name()) + "_" + std::to_string(type->gid()));
    }

    // look for nested variants
    if (auto variant = type->isa<VariantType>()) {
        for (auto op : variant->ops())
            emit_aggop_decl(op);
        emit_type(type_decls_, variant) << endl;
        insert(type, "union variant_" + std::to_string(type->gid()));
    }

    // restore indent
    while (detail::get_indent() != indent)
        type_decls_ << up;

    return type_decls_;
}

std::ostream& CCodeGen::emit_shm_copy(const std::string shm_name, const std::string src_buffer, const std::string width, const std::string height) {
  int extend_width = FILTER_WIDTH / 2;
  int extend_height = FILTER_HEIGHT / 2;

  std::string idxx_string = "((blockIdx.x * blockDim.x + threadIdx.x) - " + std::to_string(extend_width) + " + i)";
  std::string idxy_string = "((blockIdx.y * blockDim.y + threadIdx.y) - " + std::to_string(extend_height) + " + j)";

  func_impl_ << endl;

  func_impl_ << "#line 100 \"shared_memory_copy\"" << endl;
  func_impl_ << "for(int i = 0; i < blockDim.x + " << extend_width * 2 << "; i += blockDim.x) {" << up << endl;
  func_impl_ << "for(int j = 0; j < blockDim.y + " << extend_height * 2 << "; j += blockDim.y) {" << up << endl;
  func_impl_ << "if(threadIdx.x + i < blockDim.x + " << extend_width * 2 << " && " << endl << \
                "   threadIdx.y + j < blockDim.y + " << extend_height * 2 << " && " << endl << \
                // "   " << idxx_string << " >= 0 && " << endl <<
                "   " << idxx_string << " < " << width << " && " << endl << \
                // "   " << idxy_string << " >= 0 && " << endl <<
                "   " << idxy_string << " < " << height << ") {" << up << endl;

  func_impl_ << shm_name << "[threadIdx.x + i][threadIdx.y + j] = \\" << endl << \
                "  " << src_buffer << "[" << idxy_string << " * " << width << " + " << idxx_string << "];" << down << endl;

  func_impl_ << "}" << down << endl;
  func_impl_ << "}" << down << endl;
  func_impl_ << "}" << endl;

  func_impl_ << endl << "__syncthreads();" << endl;

  return func_impl_;
}

std::ostream& CCodeGen::emit_shm_access(const std::string shm_name, std::string x, std::string y) {
  int extend_width = FILTER_WIDTH / 2;
  int extend_height = FILTER_HEIGHT / 2;

  func_impl_ << "&" << shm_name << "[" << x << " + " << extend_width << " - blockIdx.x * blockDim.x][" \
                                       << y << " + " << extend_height << " - blockIdx.y * blockDim.y]";

  return func_impl_;
}

std::ostream& CCodeGen::emit_shm_filter_copy(const std::string shm_name, const std::string src_buffer, const std::string width, const std::string height) {
  int extend_width = FILTER_WIDTH / 2;
  int extend_height = FILTER_HEIGHT / 2;

  std::string idx_string = "(threadIdx.y + j) * " << FILTER_WIDTH << " + threadIdx.x + i";

  func_impl_ << endl;

  func_impl_ << "#line 100 \"shared_memory_filter_copy\"" << endl;
  func_impl_ << "for(int i = 0; i < " << FILTER_HEIGHT << "; i += blockDim.x) {" << up << endl;
  func_impl_ << "for(int j = 0; j < " << FILTER_WIDTH << "; j += blockDim.y) {" << up << endl;
  func_impl_ << "if(threadIdx.x + i < " << FILTER_WIDTH << " && " << endl << \
                "   threadIdx.y + j < " << FILTER_HEIGHT << ") {" up << endl;

  func_impl_ << shm_name << "[" << idx_string << "] = \\" << endl << \
                "  " << src_buffer << "[" << idx_string << "];" << down << endl;

  func_impl_ << "}" << down << endl;
  func_impl_ << "}" << down << endl;
  func_impl_ << "}" << endl;

  func_impl_ << endl << "__syncthreads();" << endl;

  return func_impl_;
}

std::ostream& CCodeGen::emit_shm_filter_access(const std::string shm_name, std::string index) {
  int extend_width = FILTER_WIDTH / 2;
  int extend_height = FILTER_HEIGHT / 2;

  func_impl_ << "&" << shm_name << "[" << index << "]";

  return func_impl_;
}

void CCodeGen::emit() {
    if (lang_==Lang::CUDA) {
        func_decls_ << "__device__ inline int threadIdx_x() { return threadIdx.x; }" << endl;
        func_decls_ << "__device__ inline int threadIdx_y() { return threadIdx.y; }" << endl;
        func_decls_ << "__device__ inline int threadIdx_z() { return threadIdx.z; }" << endl;
        func_decls_ << "__device__ inline int blockIdx_x() { return blockIdx.x; }" << endl;
        func_decls_ << "__device__ inline int blockIdx_y() { return blockIdx.y; }" << endl;
        func_decls_ << "__device__ inline int blockIdx_z() { return blockIdx.z; }" << endl;
        func_decls_ << "__device__ inline int blockDim_x() { return blockDim.x; }" << endl;
        func_decls_ << "__device__ inline int blockDim_y() { return blockDim.y; }" << endl;
        func_decls_ << "__device__ inline int blockDim_z() { return blockDim.z; }" << endl;
        func_decls_ << "__device__ inline int gridDim_x() { return gridDim.x; }" << endl;
        func_decls_ << "__device__ inline int gridDim_y() { return gridDim.y; }" << endl;
        func_decls_ << "__device__ inline int gridDim_z() { return gridDim.z; }" << endl;
    }

    // emit all globals: do we have globals for CUDA/OpenCL ?
    for (auto primop : world().primops()) {
        if (auto global = primop->isa<Global>()) {
            emit_aggop_decl(global->type());
            emit(global) << endl;
        }
    }

    Scope::for_each(world(), [&] (const Scope& scope) {
        int bdimx = 0, bdimy = 0, bdimz = 0;

        if (scope.entry() == world().branch())
            return;

        // continuation declarations
        auto continuation = scope.entry();
        if (continuation->is_intrinsic())
            return;

        assert(continuation->is_returning());

        // retrieve return param
        const Param* ret_param = nullptr;
        for (auto param : continuation->params()) {
            if (param->order() != 0) {
                assert(!ret_param);
                ret_param = param;
            }
        }
        assert(ret_param);

        // emit function & its declaration
        auto ret_param_fn_type = ret_param->type()->as<FnType>();
        auto ret_type = ret_param_fn_type->num_ops() > 2 ? world_.tuple_type(ret_param_fn_type->ops().skip_front()) : ret_param_fn_type->ops().back();
        auto name = (continuation->is_external() || continuation->empty()) ? continuation->name() : continuation->unique_name();
        if (continuation->is_external()) {
            auto config = kernel_config_.find(continuation);
            switch (lang_) {
                case Lang::C99:    break;
                case Lang::CUDA:   func_decls_ << "__global__ ";
                                   func_impl_  << "__global__ ";

                                   bdimx = std::get<0>(config->second);
                                   bdimy = std::get<1>(config->second);
                                   bdimz = std::get<2>(config->second);

                                   if (config != kernel_config_.end())
                                       func_impl_ << "__launch_bounds__ (" << bdimx << " * " << bdimy << " * " << bdimz << ") ";
                                   break;
                case Lang::OPENCL: func_decls_ << "__kernel ";
                                   func_impl_  << "__kernel ";
                                   if (config != kernel_config_.end())
                                       func_impl_ << "__attribute__((reqd_work_group_size(" << std::get<0>(config->second) << ", " << std::get<1>(config->second) << ", " << std::get<2>(config->second) << "))) ";
                                   break;
            }
        } else {
            if (lang_==Lang::CUDA) {
                func_decls_ << "__device__ ";
                func_impl_  << "__device__ ";
            }
        }
        emit_aggop_decl(ret_type);
        emit_addr_space(func_decls_, ret_type);
        emit_addr_space(func_impl_,  ret_type);
        emit_type(func_decls_, ret_type) << " " << name << "(";
        emit_type(func_impl_,  ret_type) << " " << name << "(";
        size_t i = 0;
        // emit and store all first-order params
        for (auto param : continuation->params()) {
            if (is_mem(param) || is_unit(param))
                continue;
            if (param->order() == 0) {
                emit_aggop_decl(param->type());
                if (is_texture_type(param->type())) {
                    // emit texture declaration for CUDA
                    type_decls_ << "texture<";
                    emit_type(type_decls_, param->type()->as<PtrType>()->pointee());
                    type_decls_ << ", cudaTextureType1D, cudaReadModeElementType> ";
                    type_decls_ << param->name() << ";" << endl;
                    insert(param, param->name());
                    // skip arrays bound to texture memory
                    continue;
                }
                if (i++ > 0) {
                    func_decls_ << ", ";
                    func_impl_  << ", ";
                }

                if (lang_==Lang::OPENCL && continuation->is_external() &&
                    (param->type()->isa<DefiniteArrayType>() ||
                     param->type()->isa<StructType>() ||
                     param->type()->isa<TupleType>())) {
                    // structs are passed via buffer; the parameter is a pointer to this buffer
                    func_decls_ << "__global ";
                    func_impl_  << "__global ";
                    emit_type(func_decls_, param->type()) << " *";
                    emit_type(func_impl_,  param->type()) << " *" << param->unique_name() << "_";
                } else {
                    std::stringstream type_stream;

                    type_stream << param->type();

                    if(type_stream.str().compare("filter") == 0 && !list_contains(kernel_filters, param->unique_name())) {
                      kernel_filters.push_back(param->unique_name());
                    }

                    if(type_stream.str().compare("image") == 0 && !list_contains(kernel_images, param->unique_name())) {
                      image_width_name = param->unique_name() + ".e2";
                      image_height_name = param->unique_name() + ".e3";
                      kernel_images.push_back(param->unique_name());
                    }

                    if(type_stream.str().compare("Buffer") == 0 && !list_contains(kernel_images, param->unique_name())) {
                      kernel_images.push_back(param->unique_name());
                    }

                    if(param->type()->isa<PtrType>() && !list_contains(kernel_pointers, param->unique_name())) {
                      kernel_pointers.push_back(param->unique_name());
                    }

                    emit_addr_space(func_decls_, param->type());
                    emit_addr_space(func_impl_,  param->type());
                    emit_type(func_decls_, param->type());
                    emit_type(func_impl_,  param->type()) << " " << param->unique_name();
                }

                insert(param, param->unique_name());
            }
        }
        func_decls_ << ");" << endl;
        func_impl_  << ") {" << up;

        if(bdimx != 0 && bdimy != 0 && bdimz != 0) {
          func_impl_ << endl << "__shared__ double ds_img[" << (bdimx + (FILTER_WIDTH / 2) * 2) << "][" << (bdimy + (FILTER_HEIGHT / 2) * 2) << "];";
        }

        // OpenCL: load struct from buffer
        for (auto param : continuation->params()) {
            if (is_mem(param) || is_unit(param))
                continue;
            if (param->order() == 0) {
                if (lang_==Lang::OPENCL && continuation->is_external() &&
                    (param->type()->isa<DefiniteArrayType>() ||
                     param->type()->isa<StructType>() ||
                     param->type()->isa<TupleType>())) {
                    func_impl_ << endl;
                    emit_type(func_impl_, param->type()) << " " << param->unique_name() << " = *" << param->unique_name() << "_;";
                }
            }
        }

        Schedule schedule(scope);

        for(const auto& block : schedule) {
          auto continuation = block.continuation();
          if(continuation->empty()) {
            continue;
          }

          assert(continuation == scope.entry() || continuation->is_basicblock());

          for(auto primop : block) {
            auto primop_name = var_name(primop);

            if(auto aggop = primop->isa<AggOp>()) {
              if(aggop->isa<Extract>()) {
                if(list_contains(kernel_images, aggop->agg()->unique_name())) {
                  if(aggop->type()->isa<StructType>() && !list_contains(kernel_images, primop_name)) {
                    kernel_images.push_back(primop_name);
                  } else if(aggop->type()->isa<PtrType>() && !list_contains(kernel_pointers, primop_name)) {
                    kernel_pointers.push_back(primop_name);
                  }
                }

                if(list_contains(kernel_filters, aggop->agg()->unique_name())) {
                  if(aggop->type()->isa<StructType>() && !list_contains(kernel_filters, primop_name)) {
                    kernel_filters.push_back(primop_name);
                  } else if(aggop->type()->isa<PtrType>() && !list_contains(kernel_pointers, primop_name)) {
                    //kernel_pointers.push_back(primop_name);
                  }
                }
              }
            } else if(auto conv = primop->isa<ConvOp>()) {
              if(conv->isa<Bitcast>()) {
                if(list_contains(kernel_pointers, conv->from()->unique_name())) {
                  kernel_pointers.push_back(primop_name);
                }
              }
            } else if(auto lea = primop->isa<LEA>()) {
              if(list_contains(kernel_pointers, lea->ptr()->unique_name())) {
                conv_map.insert(std::pair<std::string, std::string>(lea->ptr()->unique_name(), primop_name));
                kernel_pointers.push_back(primop_name);
              }
            } else if(auto load = primop->isa<Load>()) {
              auto ptr_name = load->ptr()->unique_name();
              auto blacklisted = list_contains(shm_blacklist, ptr_name);

              if(!blacklisted && list_contains(kernel_pointers, ptr_name)) {
                shm_buffers.push_back(ptr_name);
              }
            } else if(auto store = primop->isa<Store>()) {
              auto ptr_name = store->ptr()->unique_name();

              if(list_contains(shm_buffers, ptr_name)) {
                shm_buffers.remove(ptr_name);
              }

              shm_blacklist.push_back(ptr_name);
            }
          }
        }

        // emit function arguments and phi nodes
        for (const auto& block : schedule) {
            for (auto param : block.continuation()->params()) {
                if (is_mem(param) || is_unit(param))
                    continue;
                emit_aggop_decl(param->type());
                insert(param, param->unique_name());
            }

            auto continuation = block.continuation();
            if (scope.entry() != continuation) {
                for (auto param : continuation->params()) {
                    if (is_mem(param) || is_unit(param))
                        continue;
                    func_impl_ << endl;
                    emit_addr_space(func_impl_, param->type());
                    emit_type(func_impl_, param->type()) << "  " << param->unique_name() << ";" << endl;
                    emit_addr_space(func_impl_, param->type());
                    emit_type(func_impl_, param->type()) << " p" << param->unique_name() << ";";
                }
            }
        }

        for (const auto& block : schedule) {
            auto continuation = block.continuation();
            if (continuation->empty())
                continue;
            assert(continuation == scope.entry() || continuation->is_basicblock());
            func_impl_ << endl;

            // print label for the current basic block
            if (continuation != scope.entry()) {
                func_impl_ << "l" << continuation->gid() << ": ;" << up << endl;
                // load params from phi node
                for (auto param : continuation->params())
                    if (!is_mem(param) && !is_unit(param))
                        func_impl_ << param->unique_name() << " = p" << param->unique_name() << ";" << endl;
            }

            for (auto primop : block) {
                if (primop->type()->order() >= 1) {
                    // ignore higher-order primops which come from a match intrinsic
                    if (is_from_match(primop))
                        continue;
                    THORIN_UNREACHABLE;
                }

                // struct/tuple/array declarations
                if (!primop->isa<MemOp>()) {
                    emit_aggop_decl(primop->type());
                    // search for inlined tuples/arrays
                    if (auto aggop = primop->isa<AggOp>()) {
                        if (!aggop->agg()->isa<MemOp>())
                            emit_aggop_decl(aggop->agg()->type());
                    }
                }

                // skip higher-order primops, stuff dealing with frames and all memory related stuff except stores
                if (primop->type()->isa<FnType>() || primop->type()->isa<FrameType>() || ((is_mem(primop) || is_unit(primop)) && !primop->isa<Store>()))
                    continue;

                emit_debug_info(primop);
                emit(primop) << endl;
            }

            for (auto arg : continuation->args()) {
                // emit definitions of inlined elements
                emit_aggop_defs(arg);

                // emit temporaries for arguments
                if (arg->order() >= 1 || is_mem(arg) || is_unit(arg) || lookup(arg) || arg->isa<PrimLit>())
                    continue;

                emit(arg) << endl;
            }

            // terminate bb
            if (continuation->callee() == ret_param) { // return
                size_t num_args = continuation->num_args();
                if (num_args == 0) func_impl_ << "return ;";
                else {
                    Array<const Def*> values(num_args);
                    Array<const Type*> types(num_args);

                    size_t n = 0;
                    for (auto arg : continuation->args()) {
                        if (!is_mem(arg) && !is_unit(arg)) {
                            values[n] = arg;
                            types[n] = arg->type();
                            n++;
                        }
                    }

                    if (n == 0) func_impl_ << "return ;";
                    else if (n == 1) {
                        func_impl_ << "return ";
                        emit(values[0]) << ";";
                    } else {
                        types.shrink(n);
                        auto ret_type = world_.tuple_type(types);
                        auto ret_tuple_name = "ret_tuple" + std::to_string(continuation->gid());
                        emit_aggop_decl(ret_type);
                        emit_type(func_impl_, ret_type) << " " << ret_tuple_name << ";";

                        for (size_t i = 0; i != n; ++i) {
                            func_impl_ << endl << ret_tuple_name << ".e" << i << " = ";
                            emit(values[i]) << ";";
                        }

                        func_impl_ << endl << "return " << ret_tuple_name << ";";
                    }
                }
            } else if (continuation->callee() == world().branch()) {
                emit_debug_info(continuation->arg(0)); // TODO correct?
                func_impl_ << "if (";
                emit(continuation->arg(0));
                func_impl_ << ") ";
                emit(continuation->arg(1));
                func_impl_ << " else ";
                emit(continuation->arg(2));
            } else if (continuation->callee()->isa<Continuation>() &&
                       continuation->callee()->as<Continuation>()->intrinsic() == Intrinsic::Match) {
                func_impl_ << "switch (";
                emit(continuation->arg(0)) << ") {" << up << endl;
                for (size_t i = 2; i < continuation->num_args(); i++) {
                    auto arg = continuation->arg(i)->as<Tuple>();
                    func_impl_ << "case ";
                    emit(arg->op(0)) << ": ";
                    emit(arg->op(1)) << endl;
                }
                func_impl_ << "default: ";
                emit(continuation->arg(1));
                func_impl_ << down << endl << "}";
            } else if (continuation->callee()->isa<Bottom>()) {
                func_impl_ << "return ; // bottom: unreachable";
            } else {
                auto store_phi = [&] (const Def* param, const Def* arg) {
                    if (arg->isa<Bottom>())
                        func_impl_ << "// bottom: ";
                    func_impl_ << "p" << param->unique_name() << " = ";
                    emit(arg) << ";";
                };

                auto callee = continuation->callee()->as_continuation();
                emit_debug_info(callee);

                if (callee->is_basicblock()) {   // ordinary jump
                    assert(callee->num_params()==continuation->num_args());
                    for (size_t i = 0, size = callee->num_params(); i != size; ++i)
                        if (!is_mem(callee->param(i)) && !is_unit(callee->param(i))) {
                            store_phi(callee->param(i), continuation->arg(i));
                            func_impl_ << endl;
                        }
                    emit(callee);
                } else {
                    if (callee->is_intrinsic()) {
                        if (callee->intrinsic() == Intrinsic::Reserve) {
                            if (!continuation->arg(1)->isa<PrimLit>())
                                ELOG(continuation->arg(1), "reserve_shared: couldn't extract memory size");

                            switch (lang_) {
                                case Lang::C99:                                 break;
                                case Lang::CUDA:   func_impl_ << "__shared__ "; break;
                                case Lang::OPENCL: func_impl_ << "__local ";    break;
                            }

                            auto cont = continuation->arg(2)->as_continuation();
                            auto elem_type = cont->param(1)->type()->as<PtrType>()->pointee()->as<ArrayType>()->elem_type();
                            auto name = "reserver_" + cont->param(1)->unique_name();
                            emit_type(func_impl_, elem_type) << " " << name << "[";
                            emit(continuation->arg(1)) << "];" << endl;
                            // store_phi:
                            func_impl_ << "p" << cont->param(1)->unique_name() << " = " << name << ";";
                        } else {
                            THORIN_UNREACHABLE;
                        }
                    } else {
                        auto emit_call = [&] (const Param* param = nullptr) {
                            auto name = (callee->is_external() || callee->empty()) ? callee->name() : callee->unique_name();
                            if (param)
                                emit(param) << " = ";
                            func_impl_ << name << "(";
                            // emit all first-order args
                            size_t i = 0;
                            for (auto arg : continuation->args()) {
                                if (arg->order() == 0 && !(is_mem(arg) || is_unit(arg))) {
                                    if (i++ > 0)
                                        func_impl_ << ", ";
                                    emit(arg);
                                }
                            }
                            func_impl_ << ");";
                            if (param) {
                                func_impl_ << endl;
                                store_phi(param, param);
                            }
                        };

                        const Def* ret_arg = 0;
                        for (auto arg : continuation->args()) {
                            if (arg->order() != 0) {
                                assert(!ret_arg);
                                ret_arg = arg;
                            }
                        }

                        // must be call + continuation --- call + return has been removed by codegen_prepare
                        auto succ = ret_arg->as_continuation();
                        size_t num_params = succ->num_params();

                        size_t n = 0;
                        Array<const Param*> values(num_params);
                        Array<const Type*> types(num_params);
                        for (auto param : succ->params()) {
                            if (!is_mem(param) && !is_unit(param)) {
                                values[n] = param;
                                types[n] = param->type();
                                n++;
                            }
                        }

                        if (n == 0)
                            emit_call();
                        else if (n == 1)
                            emit_call(values[0]);
                        else {
                            types.shrink(n);
                            auto ret_type = world_.tuple_type(types);
                            auto ret_tuple_name = "ret_tuple" + std::to_string(continuation->gid());
                            emit_aggop_decl(ret_type);
                            emit_type(func_impl_, ret_type) << " " << ret_tuple_name << ";" << endl << ret_tuple_name << " = ";
                            emit_call();

                            // store arguments to phi node
                            for (size_t i = 0; i != n; ++i)
                                func_impl_ << endl << "p" << values[i]->unique_name() << " = " << ret_tuple_name << ".e" << i << ";";
                        }
                    }
                }
            }
            if (continuation != scope.entry())
                func_impl_ << down;
            primop2str_.clear();
        }
        func_impl_ << down << endl << "}" << endl << endl;
        def2str_.clear();
    });

    type2str_.clear();
    global2str_.clear();

    if (lang_==Lang::OPENCL) {
        if (use_16_)
            os_ << "#pragma OPENCL EXTENSION cl_khr_fp16 : enable" << endl;
        if (use_64_)
            os_ << "#pragma OPENCL EXTENSION cl_khr_fp64 : enable" << endl;
        if (use_16_ || use_64_)
            os_ << endl;
    }

    if (lang_==Lang::CUDA) {
        if (use_16_)
            os_ << "#include <cuda_fp16.h>" << endl << endl;
        os_ << "extern \"C\" {" << endl;
    }

    if (!type_decls_.str().empty())
        os_ << type_decls_.str() << endl;
    if (!func_decls_.str().empty())
        os_ << func_decls_.str() << endl;
    os_ << func_impl_.str();

    if (lang_==Lang::CUDA)
        os_ << "}"; // extern "C"
}


std::ostream& CCodeGen::emit(const Def* def) {
    if (auto continuation = def->isa<Continuation>())
        return func_impl_ << "goto l" << continuation->gid() << ";";

    if (lookup(def))
        return func_impl_ << get_name(def);

    auto def_name = var_name(def);

    if (auto bin = def->isa<BinOp>()) {
        // emit definitions of inlined elements
        emit_aggop_defs(bin->lhs());
        emit_aggop_defs(bin->rhs());
        emit_type(func_impl_, bin->type()) << " " << def_name << ";" << endl;
        func_impl_ << def_name << " = ";
        emit(bin->lhs());
        if (auto cmp = bin->isa<Cmp>()) {
            switch (cmp->cmp_tag()) {
                case Cmp_eq: func_impl_ << " == "; break;
                case Cmp_ne: func_impl_ << " != "; break;
                case Cmp_gt: func_impl_ << " > ";  break;
                case Cmp_ge: func_impl_ << " >= "; break;
                case Cmp_lt: func_impl_ << " < ";  break;
                case Cmp_le: func_impl_ << " <= "; break;
            }
        }

        if (auto arithop = bin->isa<ArithOp>()) {
            switch (arithop->arithop_tag()) {
                case ArithOp_add: func_impl_ << " + ";  break;
                case ArithOp_sub: func_impl_ << " - ";  break;
                case ArithOp_mul: func_impl_ << " * ";  break;
                case ArithOp_div: func_impl_ << " / ";  break;
                case ArithOp_rem: func_impl_ << " % ";  break;
                case ArithOp_and: func_impl_ << " & ";  break;
                case ArithOp_or:  func_impl_ << " | ";  break;
                case ArithOp_xor: func_impl_ << " ^ ";  break;
                case ArithOp_shl: func_impl_ << " << "; break;
                case ArithOp_shr: func_impl_ << " >> "; break;
            }
        }
        emit(bin->rhs()) << ";";
        insert(def, def_name);
        return func_impl_;
    }

    if (auto conv = def->isa<ConvOp>()) {
        auto src_type = conv->from()->type();
        auto dst_type = conv->type();

        if (src_type == dst_type) {
            insert(def, var_name(conv->from()));
            return func_impl_;
        }

        emit_addr_space(func_impl_, dst_type);
        emit_type(func_impl_, dst_type) << " " << def_name << ";" << endl;

        if (conv->isa<Cast>()) {
            func_impl_ << def_name << " = ";

            if (src_type->isa<VariantType>()) {
                emit(conv->from()) << "." << dst_type << ";";
            } else {
                auto from = src_type->as<PrimType>();
                auto to   = dst_type->as<PrimType>();

                if (lang_==Lang::CUDA && from && (from->primtype_tag() == PrimType_pf16 || from->primtype_tag() == PrimType_qf16)) {
                    func_impl_ << "(";
                    emit_type(func_impl_, dst_type) << ") __half2float(";
                    emit(conv->from()) << ");";
                } else if (lang_==Lang::CUDA && to && (to->primtype_tag() == PrimType_pf16 || to->primtype_tag() == PrimType_qf16)) {
                    func_impl_ << "__float2half((float)";
                    emit(conv->from()) << ");";
                } else {
                    func_impl_ << "(";
                    emit_addr_space(func_impl_, dst_type);
                    emit_type(func_impl_, dst_type) << ")";
                    emit(conv->from()) << ";";
                }
            }
        }

        if (conv->isa<Bitcast>()) {
            func_impl_ << "union { ";
            emit_addr_space(func_impl_, dst_type);
            emit_type(func_impl_, dst_type) << " dst; ";
            emit_addr_space(func_impl_, src_type);
            emit_type(func_impl_, src_type) << " src; ";
            func_impl_ << "} u" << def_name << ";" << endl;
            func_impl_ << "u" << def_name << ".src = ";
            emit(conv->from()) << ";" << endl;
            func_impl_ << def_name << " = u" << def_name << ".dst;";

            if(list_contains(kernel_pointers, def_name)) {
              std::map<std::string, std::string>::iterator i;

              if((i = conv_map.find(def_name)) != conv_map.end()) {
                if( list_contains(shm_buffers, i->second)) {
                  emit_shm_copy("ds_img", def_name, image_width_name, image_height_name);
                  // func_impl_ << def_name << " = ds_img;";
                }
              }
            }

        }

        insert(def, def_name);
        return func_impl_;
    }

    if (auto size_of = def->isa<SizeOf>()) {
        func_impl_ << "sizeof(";
        emit_type(func_impl_, size_of->of()) << ")";
        return func_impl_;
    }

    if (auto array = def->isa<DefiniteArray>()) { // DefArray is mapped to a struct
        // emit definitions of inlined elements
        for (auto op : array->ops())
            emit_aggop_defs(op);

        emit_type(func_impl_, array->type()) << " " << def_name << ";";
        for (size_t i = 0, e = array->num_ops(); i != e; ++i) {
            func_impl_ << endl;
            if (array->op(i)->isa<Bottom>())
                func_impl_ << "// bottom: ";
            func_impl_ << def_name << ".e[" << i << "] = ";
            emit(array->op(i)) << ";";
        }
        insert(def, def_name);
        return func_impl_;
    }

    // aggregate operations
    {
        auto emit_access = [&] (const Def* def, const Def* index) -> std::ostream& {
            if (def->type()->isa<ArrayType>()) {
                func_impl_ << ".e[";
                emit(index) << "]";
            } else if (def->type()->isa<TupleType>() || def->type()->isa<StructType>()) {
                func_impl_ << ".e";
                emit(index);
            } else if (def->type()->isa<VectorType>()) {
                if (is_primlit(index, 0))
                    func_impl_ << ".x";
                else if (is_primlit(index, 1))
                    func_impl_ << ".y";
                else if (is_primlit(index, 2))
                    func_impl_ << ".z";
                else if (is_primlit(index, 3))
                    func_impl_ << ".w";
                else {
                    func_impl_ << ".s";
                    emit(index);
                }
            } else {
                THORIN_UNREACHABLE;
            }
            return func_impl_;
        };

        if (auto agg = def->isa<Aggregate>()) {
            assert(def->isa<Tuple>() || def->isa<StructAgg>() || def->isa<Vector>());
            // emit definitions of inlined elements
            for (auto op : agg->ops())
                emit_aggop_defs(op);

            emit_type(func_impl_, agg->type()) << " " << def_name << ";";
            for (size_t i = 0, e = agg->ops().size(); i != e; ++i) {
                func_impl_ << endl;
                if (agg->op(i)->isa<Bottom>())
                    func_impl_ << "// bottom: ";
                func_impl_ << def_name;
                emit_access(def, world_.literal_qs32(i, def->location())) << " = ";
                emit(agg->op(i)) << ";";
            }
            insert(def, def_name);
            return func_impl_;
        }

        if (auto aggop = def->isa<AggOp>()) {
            emit_aggop_defs(aggop->agg());

            if (auto extract = aggop->isa<Extract>()) {
                if (is_mem(extract) || extract->type()->isa<FrameType>())
                    return func_impl_;
                if (!extract->agg()->isa<Assembly>()) { // extract is a nop for inline assembly
                    emit_type(func_impl_, aggop->type()) << " " << def_name << ";" << endl;
                    func_impl_ << def_name << " = ";
                    if (auto memop = extract->agg()->isa<MemOp>())
                        emit(memop) << ";";
                    else {
                        emit(aggop->agg());
                        emit_access(aggop->agg(), aggop->index()) << ";";
                    }
                }
                insert(def, def_name);
                return func_impl_;
            }

            auto ins = def->as<Insert>();
            emit_type(func_impl_, aggop->type()) << " " << def_name << ";" << endl;
            func_impl_ << def_name << " = ";
            emit(ins->agg()) << ";" << endl;
            func_impl_ << def_name;
            emit_access(def, ins->index()) << " = ";
            emit(ins->value()) << ";";
            insert(def, def_name);
            return func_impl_;
        }
    }

    if (auto primlit = def->isa<PrimLit>()) {
        auto float_mode = lang_ == Lang::CUDA ? std::scientific : std::hexfloat;
        auto fs = lang_ == Lang::CUDA ? "f" : "";
        auto hp = lang_ == Lang::CUDA ? "__float2half(" : "";
        auto hs = lang_ == Lang::CUDA ? ")" : "h";

        switch (primlit->primtype_tag()) {
            case PrimType_bool:                     func_impl_ << (primlit->bool_value() ? "true" : "false");      break;
            case PrimType_ps8:  case PrimType_qs8:  func_impl_ << (int) primlit->ps8_value();                      break;
            case PrimType_pu8:  case PrimType_qu8:  func_impl_ << (unsigned) primlit->pu8_value();                 break;
            case PrimType_ps16: case PrimType_qs16: func_impl_ << primlit->ps16_value();                           break;
            case PrimType_pu16: case PrimType_qu16: func_impl_ << primlit->pu16_value();                           break;
            case PrimType_ps32: case PrimType_qs32: func_impl_ << primlit->ps32_value();                           break;
            case PrimType_pu32: case PrimType_qu32: func_impl_ << primlit->pu32_value();                           break;
            case PrimType_ps64: case PrimType_qs64: func_impl_ << primlit->ps64_value();                           break;
            case PrimType_pu64: case PrimType_qu64: func_impl_ << primlit->pu64_value();                           break;
            case PrimType_pf16: case PrimType_qf16: func_impl_ << float_mode << hp << primlit->pf16_value() << hs; break;
            case PrimType_pf32: case PrimType_qf32: func_impl_ << float_mode << primlit->pf32_value() << fs;       break;
            case PrimType_pf64: case PrimType_qf64: func_impl_ << float_mode << primlit->pf64_value();             break;
        }
        return func_impl_;
    }

    if (auto variant = def->isa<Variant>()) {
        emit_type(func_impl_, variant->type()) << " " << def_name << ";" << endl;
        func_impl_ << def_name << "." << variant->op(0)->type() << " = ";
        emit(variant->op(0)) << ";";
        insert(def, def_name);
        return func_impl_;
    }

    if (auto bottom = def->isa<Bottom>()) {
        func_impl_ << "// bottom: ";
        emit_type(func_impl_, bottom->type()) << " " << def_name << ";";
        insert(def, def_name);
        return func_impl_;
    }

    if (auto load = def->isa<Load>()) {
        emit_type(func_impl_, load->out_val()->type()) << " " << def_name << ";" << endl;
        func_impl_ << def_name << " = ";
        // handle texture fetches
        if (!is_texture_type(load->ptr()->type()))
            func_impl_ << "*";
        emit(load->ptr()) << ";";

        insert(def, def_name);
        return func_impl_;
    }

    if (auto store = def->isa<Store>()) {
        emit_aggop_defs(store->val()) << "*";
        emit(store->ptr()) << " = ";
        emit(store->val()) << ";";

        insert(def, def_name);
        return func_impl_;
    }

    if (auto slot = def->isa<Slot>()) {
        emit_type(func_impl_, slot->alloced_type()) << " " << def_name << "_slot;" << endl;
        emit_type(func_impl_, slot->alloced_type()) << "* " << def_name << ";" << endl;
        func_impl_ << def_name << " = &" << def_name << "_slot;";
        insert(def, def_name);
        return func_impl_;
    }

    if (def->isa<Enter>())
        return func_impl_;

    if (def->isa<Vector>()) {
        THORIN_UNREACHABLE;
    }

    if (auto lea = def->isa<LEA>()) {
        if (is_texture_type(lea->type())) { // handle texture fetches
            emit_type(func_impl_, lea->ptr_pointee()) << " " << def_name << ";" << endl;
            func_impl_ << def_name << " = tex1Dfetch(";
            emit(lea->ptr()) << ", ";
            emit(lea->index()) << ");";
        } else {
            if (lea->ptr_pointee()->isa<TupleType>() || lea->ptr_pointee()->isa<StructType>()) {
                emit_type(func_impl_, lea->type()) << " " << def_name << ";" << endl;
                func_impl_ << def_name << " = &";
                emit(lea->ptr()) << "->e";
                emit(lea->index()) << ";";
            } else if (lea->ptr_pointee()->isa<DefiniteArrayType>()) {
                emit_type(func_impl_, lea->type()) << " " << def_name << ";" << endl;
                func_impl_ << def_name << " = &";
                emit(lea->ptr()) << "->e[";
                emit(lea->index()) << "];";
            } else {
                if(list_contains(shm_buffers, def_name)) {
                  func_impl_ << "#line 100 \"shared_memory_access\"" << endl;
                }

                emit_addr_space(func_impl_, lea->ptr()->type());
                emit_type(func_impl_, lea->type()) << " " << def_name << ";" << endl;
                func_impl_ << def_name << " = ";

                if(list_contains(shm_buffers, def_name)) {
                    emit_shm_access(
                      "ds_img",
                      lea->index()->unique_name() + " % " + image_width_name,
                      lea->index()->unique_name() + " / " + image_width_name
                    );
                    func_impl_ << ";";
                } else { 
                    emit(lea->ptr()) << " + ";
                    emit(lea->index()) << ";";
                }
            }
        }

        insert(def, def_name);
        return func_impl_;
    }

    if (auto assembly = def->isa<Assembly>()) {
        size_t out_size = assembly->type()->num_ops() - 1;
        Array<std::string> outputs(out_size, std::string(""));
        for (auto use : assembly->uses()) {
            auto extract = use->as<Extract>();
            size_t index = primlit_value<unsigned>(extract->index());
            if (index == 0)
                continue;   // skip the mem

            assert(outputs[index - 1] == "" && "Each use must belong to a unique index.");
            auto name = var_name(extract);
            outputs[index - 1] = name;
            emit_type(func_impl_, assembly->type()->op(index)) << " " << name << ";" << endl;
        }
        // some outputs that were originally there might have been pruned because
        // they are not used but we still need them as operands for the asm
        // statement so we need to generate them here
        for (size_t i = 0; i < out_size; ++i) {
            if (outputs[i] == "") {
                auto name = var_name(assembly) + "_" + std::to_string(i + 1);
                emit_type(func_impl_, assembly->type()->op(i + 1)) << " " << name << ";" << endl;
                outputs[i] = name;
            }
        }

        func_impl_ << "asm ";
        if (assembly->has_sideeffects())
            func_impl_ << "volatile ";
        if (assembly->is_alignstack() || assembly->is_inteldialect())
            WLOG(assembly, "stack alignment and inteldialect flags unsupported for C output");
        func_impl_ << "(\"" << assembly->asm_template() << "\"";

        // emit the outputs
        const char* separator = " : ";
        const auto& output_constraints = assembly->output_constraints();
        for (size_t i = 0; i < output_constraints.size(); ++i) {
            func_impl_ << separator << "\"" << output_constraints[i] << "\"("
                << outputs[i] << ")";
            separator = ", ";
        }

        // emit the inputs
        separator = output_constraints.empty() ? " :: " : " : ";
        auto input_constraints = assembly->input_constraints();
        for (size_t i = 0; i < input_constraints.size(); ++i) {
            func_impl_ << separator << "\"" << input_constraints[i] << "\"(";
            emit(assembly->op(i + 1)) << ")";
            separator = ", ";
        }

        // emit the clobbers
        separator = input_constraints.empty() ? output_constraints.empty() ? " ::: " : " :: " : " : ";
        for (auto clob : assembly->clobbers()) {
            func_impl_ << separator << "\"" << clob << "\"";
            separator = ", ";
        }
        return func_impl_ << ");";
    }

    if (auto global = def->isa<Global>()) {
        WLOG(global, "{}: Global variable '{}' will not be synced with host.", get_lang(), global);
        assert(!global->init()->isa_continuation() && "no global init continuation supported");
        switch (lang_) {
            case Lang::C99:                                 break;
            case Lang::CUDA:   func_impl_ << "__device__ "; break;
            case Lang::OPENCL: func_impl_ << "__constant "; break;
        }
        emit_type(func_impl_, global->alloced_type()) << " " << def_name << "_slot";
        if (global->init()->isa<Bottom>()) {
            func_impl_ << "; // bottom";
        } else {
            func_impl_ << " = ";
            emit(global->init()) << ";";
        }
        func_impl_ << endl;

        switch (lang_) {
            case Lang::C99:                                 break;
            case Lang::CUDA:   func_impl_ << "__device__ "; break;
            case Lang::OPENCL: func_impl_ << "__constant "; break;
        }
        emit_type(func_impl_, global->alloced_type()) << " *" << def_name << " = &" << def_name << "_slot;";

        insert(def, def_name);
        return func_impl_;
    }

    if (auto select = def->isa<Select>()) {
        emit_aggop_defs(select->cond());
        emit_aggop_defs(select->tval());
        emit_aggop_defs(select->fval());
        emit_type(func_impl_, select->type()) << " " << def_name << ";" << endl;
        func_impl_ << def_name << " = ";
        emit(select->cond()) << " ? ";
        emit(select->tval()) << " : ";
        emit(select->fval()) << ";";
        insert(def, def_name);
        return func_impl_;
    }

    THORIN_UNREACHABLE;
}

bool CCodeGen::lookup(const Type* type) {
    return type2str_.contains(type);
}

bool CCodeGen::lookup(const Def* def) {
    if (def->isa<Global>())
        return global2str_.contains(def);
    else if (def->isa<PrimOp>() && is_const(def))
        return primop2str_.contains(def);
    else
        return def2str_.contains(def);
}

std::string& CCodeGen::get_name(const Type* type) {
    return type2str_[type];
}

std::string& CCodeGen::get_name(const Def* def) {
    if (def->isa<Global>())
        return global2str_[def];
    else if (def->isa<PrimOp>() && is_const(def))
        return primop2str_[def];
    else
        return def2str_[def];
}

const std::string CCodeGen::var_name(const Def* def) {
    if (def->isa<PrimOp>() && is_const(def))
            return def->unique_name() + "_" + std::to_string(primop_counter++);
    else
        return def->unique_name();
}
const std::string CCodeGen::get_lang() const {
    switch (lang_) {
        default:
        case Lang::C99:    return "C99";
        case Lang::CUDA:   return "CUDA";
        case Lang::OPENCL: return "OpenCL";
    }
}

void CCodeGen::insert(const Type* type, std::string str) {
    type2str_[type] = str;
}

void CCodeGen::insert(const Def* def, std::string str) {
    if (def->isa<Global>())
        global2str_[def] = str;
    else if (def->isa<PrimOp>() && is_const(def))
        primop2str_[def] = str;
    else
        def2str_[def] = str;
}

bool CCodeGen::is_texture_type(const Type* type) {
    if (auto ptr = type->isa<PtrType>()) {
        if (ptr->addr_space()==AddrSpace::Texture) {
            assert(lang_==Lang::CUDA && "Textures currently only supported in CUDA");
            return true;
        }
    }
    return false;
}

//------------------------------------------------------------------------------

void emit_c(World& world, const Cont2Config& kernel_config, std::ostream& stream, Lang lang, bool debug) { CCodeGen(world, kernel_config, stream, lang, debug).emit(); }

//------------------------------------------------------------------------------

}

#undef print_list
#undef list_contains

