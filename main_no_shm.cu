extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5426;
typedef struct {
    struct_Buffer_5426 e0;
    struct_Buffer_5426 e1;
    int e2;
    int e3;
} struct_image_5425;
typedef struct {
    struct_Buffer_5426 e0;
    int e1;
    int e2;
} struct_filter_5429;

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
__global__ void lambda_20630(struct_image_5425, struct_filter_5429, struct_Buffer_5426);
__global__ void lambda_20762(struct_filter_5429, struct_image_5425, struct_Buffer_5426, double*, struct_Buffer_5426);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_20630(struct_image_5425 _20633_22969, struct_filter_5429 _20634_22970, struct_Buffer_5426 _20635_22971) {
    int  _22977;
    int p_22977;
    int  _22983;
    int p_22983;
    int  _22989;
    int p_22989;
    int  _22995;
    int p_22995;
    int  _23001;
    int p_23001;
    int  _23007;
    int p_23007;
    int  _23030;
    int p_23030;
    double  sum_23032;
    double psum_23032;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _22977 = blockIdx_x();
    p_22977 = _22977;
    l22975: ;
        _22977 = p_22977;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22983 = blockDim_x();
        p_22983 = _22983;
    l22981: ;
        _22983 = p_22983;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22989 = threadIdx_x();
        p_22989 = _22989;
    l22987: ;
        _22989 = p_22989;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22995 = blockIdx_y();
        p_22995 = _22995;
    l22993: ;
        _22995 = p_22995;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23001 = blockDim_y();
        p_23001 = _23001;
    l22999: ;
        _23001 = p_23001;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23007 = threadIdx_y();
        p_23007 = _23007;
    l23005: ;
        _23007 = p_23007;
        #line 155 "gpu_device.impala"
        int _23008;
        _23008 = _22977 * _22983;
        #line 11 "main.impala"
        int _23011;
        _23011 = _20633_22969.e2;
        #line 155 "gpu_device.impala"
        int gid_x_23009;
        gid_x_23009 = _23008 + _22989;
        #line 160 "gpu_device.impala"
        bool _23012;
        _23012 = gid_x_23009 < _23011;
        #line 160 "gpu_device.impala"
        if (_23012) goto l23013; else goto l23078;
    l23078: ;
        #line 163 "gpu_device.impala"
        goto l23077;
    l23013: ;
        #line 11 "main.impala"
        int _23017;
        _23017 = _20633_22969.e3;
        #line 157 "gpu_device.impala"
        int _23014;
        _23014 = _22995 * _23001;
        #line 157 "gpu_device.impala"
        int gid_y_23015;
        gid_y_23015 = _23014 + _23007;
        #line 160 "gpu_device.impala"
        bool _23018;
        _23018 = gid_y_23015 < _23017;
        #line 160 "gpu_device.impala"
        if (_23018) goto l23019; else goto l23076;
    l23076: ;
        #line 163 "gpu_device.impala"
        goto l23077;
    l23077: ;
        return ;
    l23019: ;
        #line 45 "gpu_device.impala"
        char* _23060;
        _23060 = _20635_22971.e1;
        #line 50 "gpu_device.impala"
        int _23049;
        _23049 = gid_y_23015 * _23011;
        #line 50 "gpu_device.impala"
        int _23062;
        _23062 = _23049 + gid_x_23009;
        #line 4 "gaussian.impala"
        int _23021;
        _23021 = _20634_22970.e1;
        #line 50 "gpu_device.impala"
        struct_Buffer_5426 _23046;
        _23046 = _20633_22969.e1;
        #line 45 "gpu_device.impala"
        double* _23061;
        union { double* dst; char* src; } u_23061;
        u_23061.src = _23060;
        _23061 = u_23061.dst;
        #line 45 "gpu_device.impala"
        double* _23063;
        _23063 = _23061 + _23062;
        #line 4 "gaussian.impala"
        int h_anchor_23023;
        h_anchor_23023 = _23021 / 2;
        #line 50 "gpu_device.impala"
        char* _23047;
        _23047 = _23046.e1;
        #line 17 "gaussian.impala"
        bool _23024;
        _23024 = h_anchor_23023 <= gid_x_23009;
        #line 50 "gpu_device.impala"
        double* _23048;
        union { double* dst; char* src; } u_23048;
        u_23048.src = _23047;
        _23048 = u_23048.dst;
        #line 17 "gaussian.impala"
        if (_23024) goto l23025; else goto l23075;
    l23075: ;
        #line 27 "gaussian.impala"
        goto l23069;
    l23025: ;
        #line 17 "gaussian.impala"
        int _23026;
        _23026 = _23011 - h_anchor_23023;
        #line 17 "gaussian.impala"
        bool _23027;
        _23027 = gid_x_23009 < _23026;
        #line 17 "gaussian.impala"
        if (_23027) goto l23028; else goto l23068;
    l23068: ;
        #line 27 "gaussian.impala"
        goto l23069;
    l23069: ;
        #line 50 "gpu_device.impala"
        double* _23070;
        _23070 = _23048 + _23062;
        #line 50 "gpu_device.impala"
        double _23071;
        _23071 = *_23070;
        #line 50 "gpu_device.impala"
        double _23073;
        _23073 = _23071;
        #line 45 "gpu_device.impala"
        *_23063 = _23073;
        return ;
    l23028: ;
        #line 55 "gpu_device.impala"
        struct_Buffer_5426 _23039;
        _23039 = _20634_22970.e0;
        #line 19 "gaussian.impala"
        int _23066;
        _23066 = 0 - h_anchor_23023;
        #line 19 "gaussian.impala"
        int _23034;
        _23034 = 1 + h_anchor_23023;
        #line 55 "gpu_device.impala"
        char* _23040;
        _23040 = _23039.e1;
        #line 55 "gpu_device.impala"
        double* _23041;
        union { double* dst; char* src; } u_23041;
        u_23041.src = _23040;
        _23041 = u_23041.dst;
        #line 19 "gpu_device.impala"
        p_23030 = _23066;
        psum_23032 = 0.000000e+00;
        goto l23029;
    l23029: ;
        _23030 = p_23030;
        sum_23032 = psum_23032;
        #line 19 "gpu_device.impala"
        bool _23035;
        _23035 = _23030 < _23034;
        #line 19 "gpu_device.impala"
        if (_23035) goto l23036; else goto l23059;
    l23059: ;
        #line 45 "gpu_device.impala"
        *_23063 = sum_23032;
        return ;
    l23036: ;
        #line 23 "gpu_device.impala"
        int _23037;
        _23037 = 1 + _23030;
        #line 21 "gaussian.impala"
        int _23042;
        _23042 = _23030 + h_anchor_23023;
        #line 21 "gaussian.impala"
        int _23050;
        _23050 = gid_x_23009 + _23030;
        #line 54 "gpu_device.impala"
        double* i_23043;
        i_23043 = _23041 + _23042;
        #line 50 "gpu_device.impala"
        int _23051;
        _23051 = _23049 + _23050;
        #line 55 "gpu_device.impala"
        double _23044;
        _23044 = *i_23043;
        #line 50 "gpu_device.impala"
        double* _23052;
        _23052 = _23048 + _23051;
        #line 55 "gpu_device.impala"
        double _23055;
        _23055 = _23044;
        #line 50 "gpu_device.impala"
        double _23053;
        _23053 = *_23052;
        #line 50 "gpu_device.impala"
        double _23056;
        _23056 = _23053;
        #line 21 "gaussian.impala"
        double _23057;
        _23057 = _23055 * _23056;
        #line 21 "gaussian.impala"
        double _23058;
        _23058 = sum_23032 + _23057;
        #line 19 "gpu_device.impala"
        p_23030 = _23037;
        psum_23032 = _23058;
        goto l23029;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_20762(struct_filter_5429 _20765_23082, struct_image_5425 _20766_23083, struct_Buffer_5426 _20767_23084, double* _20768_23085, struct_Buffer_5426 _20769_23086) {
    int  _23089;
    int p_23089;
    int  _23092;
    int p_23092;
    int  _23095;
    int p_23095;
    int  _23098;
    int p_23098;
    int  _23101;
    int p_23101;
    int  _23104;
    int p_23104;
    int  _23123;
    int p_23123;
    double  sum_23125;
    double psum_23125;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23089 = blockIdx_x();
    p_23089 = _23089;
    l23087: ;
        _23089 = p_23089;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23092 = blockDim_x();
        p_23092 = _23092;
    l23090: ;
        _23092 = p_23092;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23095 = threadIdx_x();
        p_23095 = _23095;
    l23093: ;
        _23095 = p_23095;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23098 = blockIdx_y();
        p_23098 = _23098;
    l23096: ;
        _23098 = p_23098;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23101 = blockDim_y();
        p_23101 = _23101;
    l23099: ;
        _23101 = p_23101;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23104 = threadIdx_y();
        p_23104 = _23104;
    l23102: ;
        _23104 = p_23104;
        #line 155 "gpu_device.impala"
        int _23105;
        _23105 = _23089 * _23092;
        #line 11 "main.impala"
        int _23107;
        _23107 = _20766_23083.e2;
        #line 155 "gpu_device.impala"
        int gid_x_23106;
        gid_x_23106 = _23105 + _23095;
        #line 160 "gpu_device.impala"
        bool _23108;
        _23108 = gid_x_23106 < _23107;
        #line 160 "gpu_device.impala"
        if (_23108) goto l23109; else goto l23167;
    l23167: ;
        #line 163 "gpu_device.impala"
        goto l23166;
    l23109: ;
        #line 157 "gpu_device.impala"
        int _23110;
        _23110 = _23098 * _23101;
        #line 157 "gpu_device.impala"
        int gid_y_23111;
        gid_y_23111 = _23110 + _23104;
        #line 11 "main.impala"
        int _23112;
        _23112 = _20766_23083.e3;
        #line 160 "gpu_device.impala"
        bool _23113;
        _23113 = gid_y_23111 < _23112;
        #line 160 "gpu_device.impala"
        if (_23113) goto l23114; else goto l23165;
    l23165: ;
        #line 163 "gpu_device.impala"
        goto l23166;
    l23166: ;
        return ;
    l23114: ;
        #line 6 "gaussian.impala"
        int _23115;
        _23115 = _20765_23082.e2;
        #line 50 "gpu_device.impala"
        char* _23137;
        _23137 = _20769_23086.e1;
        #line 45 "gpu_device.impala"
        char* _23150;
        _23150 = _20767_23084.e1;
        #line 50 "gpu_device.impala"
        int _23152;
        _23152 = gid_y_23111 * _23107;
        #line 50 "gpu_device.impala"
        double* _23138;
        union { double* dst; char* src; } u_23138;
        u_23138.src = _23137;
        _23138 = u_23138.dst;
        #line 6 "gaussian.impala"
        int v_anchor_23116;
        v_anchor_23116 = _23115 / 2;
        #line 50 "gpu_device.impala"
        int _23153;
        _23153 = _23152 + gid_x_23106;
        #line 45 "gpu_device.impala"
        double* _23151;
        union { double* dst; char* src; } u_23151;
        u_23151.src = _23150;
        _23151 = u_23151.dst;
        #line 39 "gaussian.impala"
        bool _23117;
        _23117 = v_anchor_23116 <= gid_y_23111;
        #line 45 "gpu_device.impala"
        double* _23154;
        _23154 = _23151 + _23153;
        #line 39 "gaussian.impala"
        if (_23117) goto l23118; else goto l23164;
    l23164: ;
        #line 49 "gaussian.impala"
        goto l23158;
    l23118: ;
        #line 39 "gaussian.impala"
        int _23119;
        _23119 = _23112 - v_anchor_23116;
        #line 39 "gaussian.impala"
        bool _23120;
        _23120 = gid_y_23111 < _23119;
        #line 39 "gaussian.impala"
        if (_23120) goto l23121; else goto l23157;
    l23157: ;
        #line 49 "gaussian.impala"
        goto l23158;
    l23158: ;
        #line 50 "gpu_device.impala"
        double* _23159;
        _23159 = _23138 + _23153;
        #line 50 "gpu_device.impala"
        double _23160;
        _23160 = *_23159;
        #line 50 "gpu_device.impala"
        double _23162;
        _23162 = _23160;
        #line 45 "gpu_device.impala"
        *_23154 = _23162;
        return ;
    l23121: ;
        #line 41 "gaussian.impala"
        int _23156;
        _23156 = 0 - v_anchor_23116;
        #line 55 "gpu_device.impala"
        struct_Buffer_5426 _23130;
        _23130 = _20765_23082.e0;
        #line 41 "gaussian.impala"
        int _23126;
        _23126 = 1 + v_anchor_23116;
        #line 55 "gpu_device.impala"
        char* _23131;
        _23131 = _23130.e1;
        #line 55 "gpu_device.impala"
        double* _23132;
        union { double* dst; char* src; } u_23132;
        u_23132.src = _23131;
        _23132 = u_23132.dst;
        #line 19 "gpu_device.impala"
        p_23123 = _23156;
        psum_23125 = 0.000000e+00;
        goto l23122;
    l23122: ;
        _23123 = p_23123;
        sum_23125 = psum_23125;
        #line 19 "gpu_device.impala"
        bool _23127;
        _23127 = _23123 < _23126;
        #line 19 "gpu_device.impala"
        if (_23127) goto l23128; else goto l23149;
    l23149: ;
        #line 45 "gpu_device.impala"
        *_23154 = sum_23125;
        return ;
    l23128: ;
        #line 43 "gaussian.impala"
        int _23133;
        _23133 = _23123 + v_anchor_23116;
        #line 43 "gaussian.impala"
        int _23139;
        _23139 = gid_y_23111 + _23123;
        #line 54 "gpu_device.impala"
        double* i_23134;
        i_23134 = _23132 + _23133;
        #line 50 "gpu_device.impala"
        int _23140;
        _23140 = _23139 * _23107;
        #line 23 "gpu_device.impala"
        int _23129;
        _23129 = 1 + _23123;
        #line 55 "gpu_device.impala"
        double _23135;
        _23135 = *i_23134;
        #line 50 "gpu_device.impala"
        int _23141;
        _23141 = _23140 + gid_x_23106;
        #line 55 "gpu_device.impala"
        double _23145;
        _23145 = _23135;
        #line 50 "gpu_device.impala"
        double* _23142;
        _23142 = _23138 + _23141;
        #line 50 "gpu_device.impala"
        double _23143;
        _23143 = *_23142;
        #line 50 "gpu_device.impala"
        double _23146;
        _23146 = _23143;
        #line 43 "gaussian.impala"
        double _23147;
        _23147 = _23145 * _23146;
        #line 43 "gaussian.impala"
        double _23148;
        _23148 = sum_23125 + _23147;
        #line 19 "gpu_device.impala"
        p_23123 = _23129;
        psum_23125 = _23148;
        goto l23122;
}

}