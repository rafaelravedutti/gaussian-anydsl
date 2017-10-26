extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_4844;
typedef struct {
    struct_Buffer_4844 e0;
    struct_Buffer_4844 e1;
    int e2;
    int e3;
} struct_image_4847;

__device__ inline int threadIdx_x() { return threadIdx.x; }
__device__ inline int threadIdx_y() { return threadIdx.y; }
__device__ inline int threadIdx_z() { return threadIdx.z; }
__device__ inline int blockIdx_x() { return blockIdx.x; }
__device__ inline int blockIdx_y() { return blockIdx.y; }
__device__ inline int blockIdx_z() { return blockIdx.z; }
__device__ inline int blockDim_x() { return blockDim.x; }
__device__ inline int blockDim_y() { return blockDim.y; }
__device__ inline int blockDim_z() { return blockDim.z; }
__device__ inline int gridDim_x() { return gridDim.x; }
__device__ inline int gridDim_y() { return gridDim.y; }
__device__ inline int gridDim_z() { return gridDim.z; }
__global__ void lambda_17870(double*, struct_Buffer_4844, struct_image_4847, double*);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_17870(double* _17873_19351, struct_Buffer_4844 _17874_19352, struct_image_4847 _17875_19353, double* _17876_19354) {
    int  _19360;
    int p_19360;
    int  _19366;
    int p_19366;
    int  _19372;
    int p_19372;
    int  _19378;
    int p_19378;
    int  _19384;
    int p_19384;
    int  _19390;
    int p_19390;
    int  _19415;
    int p_19415;
    double  sum_19417;
    double psum_19417;
    int  _19422;
    int p_19422;
    double  sum_19424;
    double psum_19424;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _19360 = blockIdx_x();
    p_19360 = _19360;
    l19358: ;
        _19360 = p_19360;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19366 = blockDim_x();
        p_19366 = _19366;
    l19364: ;
        _19366 = p_19366;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19372 = threadIdx_x();
        p_19372 = _19372;
    l19370: ;
        _19372 = p_19372;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19378 = blockIdx_y();
        p_19378 = _19378;
    l19376: ;
        _19378 = p_19378;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19384 = blockDim_y();
        p_19384 = _19384;
    l19382: ;
        _19384 = p_19384;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19390 = threadIdx_y();
        p_19390 = _19390;
    l19388: ;
        _19390 = p_19390;
        #line 11 "main.impala"
        int _19394;
        _19394 = _17875_19353.e2;
        #line 119 "gpu_device.impala"
        int _19391;
        _19391 = _19360 * _19366;
        #line 119 "gpu_device.impala"
        int gid_x_19392;
        gid_x_19392 = _19391 + _19372;
        #line 124 "gpu_device.impala"
        bool _19395;
        _19395 = gid_x_19392 < _19394;
        #line 124 "gpu_device.impala"
        if (_19395) goto l19396; else goto l19476;
    l19476: ;
        #line 127 "gpu_device.impala"
        goto l19475;
    l19396: ;
        #line 121 "gpu_device.impala"
        int _19397;
        _19397 = _19378 * _19384;
        #line 121 "gpu_device.impala"
        int gid_y_19398;
        gid_y_19398 = _19397 + _19390;
        #line 11 "main.impala"
        int _19400;
        _19400 = _17875_19353.e3;
        #line 124 "gpu_device.impala"
        bool _19401;
        _19401 = gid_y_19398 < _19400;
        #line 124 "gpu_device.impala"
        if (_19401) goto l19402; else goto l19474;
    l19474: ;
        #line 127 "gpu_device.impala"
        goto l19475;
    l19475: ;
        return ;
    l19402: ;
        #line 68 "gaussian.impala"
        bool _19404;
        _19404 = 3 <= gid_x_19392;
        #line 49 "gpu_device.impala"
        int _19459;
        _19459 = gid_y_19398 * _19394;
        #line 49 "gpu_device.impala"
        int _19460;
        _19460 = _19459 + gid_x_19392;
        #line 44 "gpu_device.impala"
        char* _19457;
        _19457 = _17874_19352.e1;
        #line 49 "gpu_device.impala"
        struct_Buffer_4844 _19439;
        _19439 = _17875_19353.e1;
        #line 44 "gpu_device.impala"
        double* _19458;
        union { double* dst; char* src; } u_19458;
        u_19458.src = _19457;
        _19458 = u_19458.dst;
        #line 44 "gpu_device.impala"
        double* _19461;
        _19461 = _19458 + _19460;
        #line 49 "gpu_device.impala"
        char* _19440;
        _19440 = _19439.e1;
        #line 49 "gpu_device.impala"
        double* _19441;
        union { double* dst; char* src; } u_19441;
        u_19441.src = _19440;
        _19441 = u_19441.dst;
        #line 68 "gaussian.impala"
        if (_19404) goto l19405; else goto l19473;
    l19473: ;
        #line 80 "gaussian.impala"
        goto l19465;
    l19405: ;
        #line 68 "gaussian.impala"
        int _19406;
        _19406 = _19394 - 3;
        #line 68 "gaussian.impala"
        bool _19407;
        _19407 = gid_x_19392 < _19406;
        #line 68 "gaussian.impala"
        if (_19407) goto l19408; else goto l19472;
    l19472: ;
        #line 80 "gaussian.impala"
        goto l19465;
    l19408: ;
        #line 68 "gaussian.impala"
        bool _19409;
        _19409 = 3 <= gid_y_19398;
        #line 68 "gaussian.impala"
        if (_19409) goto l19410; else goto l19471;
    l19471: ;
        #line 80 "gaussian.impala"
        goto l19465;
    l19410: ;
        #line 68 "gaussian.impala"
        int _19411;
        _19411 = _19400 - 3;
        #line 68 "gaussian.impala"
        bool _19412;
        _19412 = gid_y_19398 < _19411;
        #line 68 "gaussian.impala"
        if (_19412) goto l19413; else goto l19464;
    l19464: ;
        #line 80 "gaussian.impala"
        goto l19465;
    l19465: ;
        #line 49 "gpu_device.impala"
        double* _19466;
        _19466 = _19441 + _19460;
        #line 49 "gpu_device.impala"
        double _19467;
        _19467 = *_19466;
        #line 49 "gpu_device.impala"
        double _19469;
        _19469 = _19467;
        #line 44 "gpu_device.impala"
        *_19461 = _19469;
        return ;
    l19413: ;
        #line 18 "gpu_device.impala"
        p_19415 = -3;
        psum_19417 = 0.000000e+00;
        goto l19414;
    l19414: ;
        _19415 = p_19415;
        sum_19417 = psum_19417;
        #line 18 "gpu_device.impala"
        bool _19419;
        _19419 = _19415 < 4;
        #line 18 "gpu_device.impala"
        if (_19419) goto l19420; else goto l19456;
    l19456: ;
        #line 44 "gpu_device.impala"
        *_19461 = sum_19417;
        return ;
    l19420: ;
        #line 73 "gaussian.impala"
        int _19444;
        _19444 = gid_x_19392 + _19415;
        #line 18 "gpu_device.impala"
        p_19422 = -3;
        psum_19424 = sum_19417;
        goto l19421;
    l19421: ;
        _19422 = p_19422;
        sum_19424 = psum_19424;
        #line 18 "gpu_device.impala"
        bool _19425;
        _19425 = _19422 < 4;
        #line 18 "gpu_device.impala"
        if (_19425) goto l19426; else goto l19453;
    l19453: ;
        #line 22 "gpu_device.impala"
        int _19454;
        _19454 = 1 + _19415;
        #line 18 "gpu_device.impala"
        p_19415 = _19454;
        psum_19417 = sum_19424;
        goto l19414;
    l19426: ;
        #line 73 "gaussian.impala"
        int _19442;
        _19442 = gid_y_19398 + _19422;
        #line 73 "gaussian.impala"
        int _19430;
        _19430 = 3 + _19422;
        #line 22 "gpu_device.impala"
        int _19428;
        _19428 = 1 + _19422;
        #line 59 "gpu_device.impala"
        int _19431;
        _19431 = 7 * _19430;
        #line 49 "gpu_device.impala"
        int _19443;
        _19443 = _19442 * _19394;
        #line 59 "gpu_device.impala"
        int _19432;
        _19432 = _19431 + _19415;
        #line 49 "gpu_device.impala"
        int _19445;
        _19445 = _19443 + _19444;
        #line 59 "gpu_device.impala"
        int _19433;
        _19433 = 3 + _19432;
        #line 49 "gpu_device.impala"
        double* _19446;
        _19446 = _19441 + _19445;
        #line 59 "gpu_device.impala"
        double* _19434;
        _19434 = _17876_19354 + _19433;
        #line 59 "gpu_device.impala"
        double _19435;
        _19435 = *_19434;
        #line 59 "gpu_device.impala"
        double _19449;
        _19449 = _19435;
        #line 49 "gpu_device.impala"
        double _19447;
        _19447 = *_19446;
        #line 49 "gpu_device.impala"
        double _19450;
        _19450 = _19447;
        #line 73 "gaussian.impala"
        double _19451;
        _19451 = _19449 * _19450;
        #line 73 "gaussian.impala"
        double _19452;
        _19452 = sum_19424 + _19451;
        #line 18 "gpu_device.impala"
        p_19422 = _19428;
        psum_19424 = _19452;
        goto l19421;
}

}