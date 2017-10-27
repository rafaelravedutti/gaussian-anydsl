extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5426;
typedef struct {
    struct_Buffer_5426 e0;
    int e1;
    int e2;
} struct_filter_5425;
typedef struct {
    struct_Buffer_5426 e0;
    struct_Buffer_5426 e1;
    int e2;
    int e3;
} struct_image_5429;

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
__global__ void lambda_20628(struct_filter_5425, struct_image_5429, struct_Buffer_5426);
__global__ void lambda_20760(struct_image_5429, struct_filter_5425, double*, struct_Buffer_5426, struct_Buffer_5426);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_20628(struct_filter_5425 _20631_22967, struct_image_5429 _20632_22968, struct_Buffer_5426 _20633_22969) {
    int  _22975;
    int p_22975;
    int  _22981;
    int p_22981;
    int  _22987;
    int p_22987;
    int  _22993;
    int p_22993;
    int  _22999;
    int p_22999;
    int  _23005;
    int p_23005;
    int  _23028;
    int p_23028;
    double  sum_23030;
    double psum_23030;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _22975 = blockIdx_x();
    p_22975 = _22975;
    l22973: ;
        _22975 = p_22975;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22981 = blockDim_x();
        p_22981 = _22981;
    l22979: ;
        _22981 = p_22981;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22987 = threadIdx_x();
        p_22987 = _22987;
    l22985: ;
        _22987 = p_22987;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22993 = blockIdx_y();
        p_22993 = _22993;
    l22991: ;
        _22993 = p_22993;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22999 = blockDim_y();
        p_22999 = _22999;
    l22997: ;
        _22999 = p_22999;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23005 = threadIdx_y();
        p_23005 = _23005;
    l23003: ;
        _23005 = p_23005;
        #line 11 "main.impala"
        int _23009;
        _23009 = _20632_22968.e2;
        #line 155 "gpu_device.impala"
        int _23006;
        _23006 = _22975 * _22981;
        #line 155 "gpu_device.impala"
        int gid_x_23007;
        gid_x_23007 = _23006 + _22987;
        #line 160 "gpu_device.impala"
        bool _23010;
        _23010 = gid_x_23007 < _23009;
        #line 160 "gpu_device.impala"
        if (_23010) goto l23011; else goto l23076;
    l23076: ;
        #line 163 "gpu_device.impala"
        goto l23075;
    l23011: ;
        #line 11 "main.impala"
        int _23015;
        _23015 = _20632_22968.e3;
        #line 157 "gpu_device.impala"
        int _23012;
        _23012 = _22993 * _22999;
        #line 157 "gpu_device.impala"
        int gid_y_23013;
        gid_y_23013 = _23012 + _23005;
        #line 160 "gpu_device.impala"
        bool _23016;
        _23016 = gid_y_23013 < _23015;
        #line 160 "gpu_device.impala"
        if (_23016) goto l23017; else goto l23074;
    l23074: ;
        #line 163 "gpu_device.impala"
        goto l23075;
    l23075: ;
        return ;
    l23017: ;
        #line 50 "gpu_device.impala"
        int _23047;
        _23047 = gid_y_23013 * _23009;
        #line 45 "gpu_device.impala"
        char* _23058;
        _23058 = _20633_22969.e1;
        #line 4 "gaussian.impala"
        int _23019;
        _23019 = _20631_22967.e1;
        #line 45 "gpu_device.impala"
        double* _23059;
        union { double* dst; char* src; } u_23059;
        u_23059.src = _23058;
        _23059 = u_23059.dst;
        #line 50 "gpu_device.impala"
        struct_Buffer_5426 _23044;
        _23044 = _20632_22968.e1;
        #line 4 "gaussian.impala"
        int h_anchor_23021;
        h_anchor_23021 = _23019 / 2;
        #line 17 "gaussian.impala"
        bool _23022;
        _23022 = h_anchor_23021 <= gid_x_23007;
        #line 50 "gpu_device.impala"
        int _23060;
        _23060 = _23047 + gid_x_23007;
        #line 45 "gpu_device.impala"
        double* _23061;
        _23061 = _23059 + _23060;
        #line 50 "gpu_device.impala"
        char* _23045;
        _23045 = _23044.e1;
        #line 50 "gpu_device.impala"
        double* _23046;
        union { double* dst; char* src; } u_23046;
        u_23046.src = _23045;
        _23046 = u_23046.dst;
        #line 17 "gaussian.impala"
        if (_23022) goto l23023; else goto l23073;
    l23073: ;
        #line 27 "gaussian.impala"
        goto l23067;
    l23023: ;
        #line 17 "gaussian.impala"
        int _23024;
        _23024 = _23009 - h_anchor_23021;
        #line 17 "gaussian.impala"
        bool _23025;
        _23025 = gid_x_23007 < _23024;
        #line 17 "gaussian.impala"
        if (_23025) goto l23026; else goto l23066;
    l23066: ;
        #line 27 "gaussian.impala"
        goto l23067;
    l23067: ;
        #line 50 "gpu_device.impala"
        double* _23068;
        _23068 = _23046 + _23060;
        #line 50 "gpu_device.impala"
        double _23069;
        _23069 = *_23068;
        #line 50 "gpu_device.impala"
        double _23071;
        _23071 = _23069;
        #line 45 "gpu_device.impala"
        *_23061 = _23071;
        return ;
    l23026: ;
        #line 55 "gpu_device.impala"
        struct_Buffer_5426 _23037;
        _23037 = _20631_22967.e0;
        #line 19 "gaussian.impala"
        int _23032;
        _23032 = 1 + h_anchor_23021;
        #line 19 "gaussian.impala"
        int _23064;
        _23064 = 0 - h_anchor_23021;
        #line 55 "gpu_device.impala"
        char* _23038;
        _23038 = _23037.e1;
        #line 55 "gpu_device.impala"
        double* _23039;
        union { double* dst; char* src; } u_23039;
        u_23039.src = _23038;
        _23039 = u_23039.dst;
        #line 19 "gpu_device.impala"
        p_23028 = _23064;
        psum_23030 = 0.000000e+00;
        goto l23027;
    l23027: ;
        _23028 = p_23028;
        sum_23030 = psum_23030;
        #line 19 "gpu_device.impala"
        bool _23033;
        _23033 = _23028 < _23032;
        #line 19 "gpu_device.impala"
        if (_23033) goto l23034; else goto l23057;
    l23057: ;
        #line 45 "gpu_device.impala"
        *_23061 = sum_23030;
        return ;
    l23034: ;
        #line 23 "gpu_device.impala"
        int _23035;
        _23035 = 1 + _23028;
        #line 21 "gaussian.impala"
        int _23048;
        _23048 = gid_x_23007 + _23028;
        #line 21 "gaussian.impala"
        int _23040;
        _23040 = _23028 + h_anchor_23021;
        #line 50 "gpu_device.impala"
        int _23049;
        _23049 = _23047 + _23048;
        #line 54 "gpu_device.impala"
        double* i_23041;
        i_23041 = _23039 + _23040;
        #line 50 "gpu_device.impala"
        double* _23050;
        _23050 = _23046 + _23049;
        #line 55 "gpu_device.impala"
        double _23042;
        _23042 = *i_23041;
        #line 55 "gpu_device.impala"
        double _23053;
        _23053 = _23042;
        #line 50 "gpu_device.impala"
        double _23051;
        _23051 = *_23050;
        #line 50 "gpu_device.impala"
        double _23054;
        _23054 = _23051;
        #line 21 "gaussian.impala"
        double _23055;
        _23055 = _23053 * _23054;
        #line 21 "gaussian.impala"
        double _23056;
        _23056 = sum_23030 + _23055;
        #line 19 "gpu_device.impala"
        p_23028 = _23035;
        psum_23030 = _23056;
        goto l23027;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_20760(struct_image_5429 _20763_23080, struct_filter_5425 _20764_23081, double* _20765_23082, struct_Buffer_5426 _20766_23083, struct_Buffer_5426 _20767_23084) {
    int  _23087;
    int p_23087;
    int  _23090;
    int p_23090;
    int  _23093;
    int p_23093;
    int  _23096;
    int p_23096;
    int  _23099;
    int p_23099;
    int  _23102;
    int p_23102;
    int  _23121;
    int p_23121;
    double  sum_23123;
    double psum_23123;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23087 = blockIdx_x();
    p_23087 = _23087;
    l23085: ;
        _23087 = p_23087;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23090 = blockDim_x();
        p_23090 = _23090;
    l23088: ;
        _23090 = p_23090;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23093 = threadIdx_x();
        p_23093 = _23093;
    l23091: ;
        _23093 = p_23093;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23096 = blockIdx_y();
        p_23096 = _23096;
    l23094: ;
        _23096 = p_23096;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23099 = blockDim_y();
        p_23099 = _23099;
    l23097: ;
        _23099 = p_23099;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23102 = threadIdx_y();
        p_23102 = _23102;
    l23100: ;
        _23102 = p_23102;
        #line 155 "gpu_device.impala"
        int _23103;
        _23103 = _23087 * _23090;
        #line 11 "main.impala"
        int _23105;
        _23105 = _20763_23080.e2;
        #line 155 "gpu_device.impala"
        int gid_x_23104;
        gid_x_23104 = _23103 + _23093;
        #line 160 "gpu_device.impala"
        bool _23106;
        _23106 = gid_x_23104 < _23105;
        #line 160 "gpu_device.impala"
        if (_23106) goto l23107; else goto l23165;
    l23165: ;
        #line 163 "gpu_device.impala"
        goto l23164;
    l23107: ;
        #line 11 "main.impala"
        int _23110;
        _23110 = _20763_23080.e3;
        #line 157 "gpu_device.impala"
        int _23108;
        _23108 = _23096 * _23099;
        #line 157 "gpu_device.impala"
        int gid_y_23109;
        gid_y_23109 = _23108 + _23102;
        #line 160 "gpu_device.impala"
        bool _23111;
        _23111 = gid_y_23109 < _23110;
        #line 160 "gpu_device.impala"
        if (_23111) goto l23112; else goto l23163;
    l23163: ;
        #line 163 "gpu_device.impala"
        goto l23164;
    l23164: ;
        return ;
    l23112: ;
        #line 50 "gpu_device.impala"
        int _23150;
        _23150 = gid_y_23109 * _23105;
        #line 6 "gaussian.impala"
        int _23113;
        _23113 = _20764_23081.e2;
        #line 45 "gpu_device.impala"
        char* _23148;
        _23148 = _20766_23083.e1;
        #line 6 "gaussian.impala"
        int v_anchor_23114;
        v_anchor_23114 = _23113 / 2;
        #line 45 "gpu_device.impala"
        double* _23149;
        union { double* dst; char* src; } u_23149;
        u_23149.src = _23148;
        _23149 = u_23149.dst;
        #line 50 "gpu_device.impala"
        char* _23135;
        _23135 = _20767_23084.e1;
        #line 50 "gpu_device.impala"
        int _23151;
        _23151 = _23150 + gid_x_23104;
        #line 39 "gaussian.impala"
        bool _23115;
        _23115 = v_anchor_23114 <= gid_y_23109;
        #line 45 "gpu_device.impala"
        double* _23152;
        _23152 = _23149 + _23151;
        #line 50 "gpu_device.impala"
        double* _23136;
        union { double* dst; char* src; } u_23136;
        u_23136.src = _23135;
        _23136 = u_23136.dst;
        #line 39 "gaussian.impala"
        if (_23115) goto l23116; else goto l23162;
    l23162: ;
        #line 49 "gaussian.impala"
        goto l23156;
    l23116: ;
        #line 39 "gaussian.impala"
        int _23117;
        _23117 = _23110 - v_anchor_23114;
        #line 39 "gaussian.impala"
        bool _23118;
        _23118 = gid_y_23109 < _23117;
        #line 39 "gaussian.impala"
        if (_23118) goto l23119; else goto l23155;
    l23155: ;
        #line 49 "gaussian.impala"
        goto l23156;
    l23156: ;
        #line 50 "gpu_device.impala"
        double* _23157;
        _23157 = _23136 + _23151;
        #line 50 "gpu_device.impala"
        double _23158;
        _23158 = *_23157;
        #line 50 "gpu_device.impala"
        double _23160;
        _23160 = _23158;
        #line 45 "gpu_device.impala"
        *_23152 = _23160;
        return ;
    l23119: ;
        #line 41 "gaussian.impala"
        int _23124;
        _23124 = 1 + v_anchor_23114;
        #line 41 "gaussian.impala"
        int _23154;
        _23154 = 0 - v_anchor_23114;
        #line 55 "gpu_device.impala"
        struct_Buffer_5426 _23128;
        _23128 = _20764_23081.e0;
        #line 55 "gpu_device.impala"
        char* _23129;
        _23129 = _23128.e1;
        #line 55 "gpu_device.impala"
        double* _23130;
        union { double* dst; char* src; } u_23130;
        u_23130.src = _23129;
        _23130 = u_23130.dst;
        #line 19 "gpu_device.impala"
        p_23121 = _23154;
        psum_23123 = 0.000000e+00;
        goto l23120;
    l23120: ;
        _23121 = p_23121;
        sum_23123 = psum_23123;
        #line 19 "gpu_device.impala"
        bool _23125;
        _23125 = _23121 < _23124;
        #line 19 "gpu_device.impala"
        if (_23125) goto l23126; else goto l23147;
    l23147: ;
        #line 45 "gpu_device.impala"
        *_23152 = sum_23123;
        return ;
    l23126: ;
        #line 43 "gaussian.impala"
        int _23137;
        _23137 = gid_y_23109 + _23121;
        #line 50 "gpu_device.impala"
        int _23138;
        _23138 = _23137 * _23105;
        #line 23 "gpu_device.impala"
        int _23127;
        _23127 = 1 + _23121;
        #line 43 "gaussian.impala"
        int _23131;
        _23131 = _23121 + v_anchor_23114;
        #line 50 "gpu_device.impala"
        int _23139;
        _23139 = _23138 + gid_x_23104;
        #line 54 "gpu_device.impala"
        double* i_23132;
        i_23132 = _23130 + _23131;
        #line 50 "gpu_device.impala"
        double* _23140;
        _23140 = _23136 + _23139;
        #line 55 "gpu_device.impala"
        double _23133;
        _23133 = *i_23132;
        #line 55 "gpu_device.impala"
        double _23143;
        _23143 = _23133;
        #line 50 "gpu_device.impala"
        double _23141;
        _23141 = *_23140;
        #line 50 "gpu_device.impala"
        double _23144;
        _23144 = _23141;
        #line 43 "gaussian.impala"
        double _23145;
        _23145 = _23143 * _23144;
        #line 43 "gaussian.impala"
        double _23146;
        _23146 = sum_23123 + _23145;
        #line 19 "gpu_device.impala"
        p_23121 = _23127;
        psum_23123 = _23146;
        goto l23120;
}

}