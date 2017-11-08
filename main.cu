extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5425;
typedef struct {
    struct_Buffer_5425 e0;
    struct_Buffer_5425 e1;
    int e2;
    int e3;
} struct_image_5424;
typedef struct {
    struct_Buffer_5425 e0;
    int e1;
    int e2;
} struct_filter_5428;

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
__global__ void lambda_20643(struct_image_5424, struct_filter_5428, struct_Buffer_5425);
__global__ void lambda_20775(struct_filter_5428, struct_image_5424, struct_Buffer_5425, double*, struct_Buffer_5425);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_20643(struct_image_5424 _20646_22982, struct_filter_5428 _20647_22983, struct_Buffer_5425 _20648_22984) {
    __shared__ double ds_img[134][7];
    int  _22990;
    int p_22990;
    int  _22996;
    int p_22996;
    int  _23002;
    int p_23002;
    int  _23008;
    int p_23008;
    int  _23014;
    int p_23014;
    int  _23020;
    int p_23020;
    int  _23043;
    int p_23043;
    double  sum_23045;
    double psum_23045;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _22990 = blockIdx_x();
    p_22990 = _22990;
    l22988: ;
        _22990 = p_22990;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22996 = blockDim_x();
        p_22996 = _22996;
    l22994: ;
        _22996 = p_22996;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23002 = threadIdx_x();
        p_23002 = _23002;
    l23000: ;
        _23002 = p_23002;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23008 = blockIdx_y();
        p_23008 = _23008;
    l23006: ;
        _23008 = p_23008;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23014 = blockDim_y();
        p_23014 = _23014;
    l23012: ;
        _23014 = p_23014;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23020 = threadIdx_y();
        p_23020 = _23020;
    l23018: ;
        _23020 = p_23020;
        #line 11 "main.impala"
        int _23024;
        _23024 = _20646_22982.e2;
        #line 155 "gpu_device.impala"
        int _23021;
        _23021 = _22990 * _22996;
        #line 155 "gpu_device.impala"
        int gid_x_23022;
        gid_x_23022 = _23021 + _23002;
        #line 160 "gpu_device.impala"
        bool _23025;
        _23025 = gid_x_23022 < _23024;
        #line 160 "gpu_device.impala"
        if (_23025) goto l23026; else goto l23091;
    l23091: ;
        #line 163 "gpu_device.impala"
        goto l23090;
    l23026: ;
        #line 157 "gpu_device.impala"
        int _23027;
        _23027 = _23008 * _23014;
        #line 157 "gpu_device.impala"
        int gid_y_23028;
        gid_y_23028 = _23027 + _23020;
        #line 11 "main.impala"
        int _23030;
        _23030 = _20646_22982.e3;
        #line 160 "gpu_device.impala"
        bool _23031;
        _23031 = gid_y_23028 < _23030;
        #line 160 "gpu_device.impala"
        if (_23031) goto l23032; else goto l23089;
    l23089: ;
        #line 163 "gpu_device.impala"
        goto l23090;
    l23090: ;
        return ;
    l23032: ;
        #line 45 "gpu_device.impala"
        char* _23073;
        _23073 = _20648_22984.e1;
        #line 50 "gpu_device.impala"
        int _23062;
        _23062 = gid_y_23028 * _23024;
        #line 50 "gpu_device.impala"
        struct_Buffer_5425 _23059;
        _23059 = _20646_22982.e1;
        #line 45 "gpu_device.impala"
        double* _23074;
        union { double* dst; char* src; } u_23074;
        u_23074.src = _23073;
        _23074 = u_23074.dst;
        #line 50 "gpu_device.impala"
        int _23075;
        _23075 = _23062 + gid_x_23022;
        #line 45 "gpu_device.impala"
        double* _23076;
        _23076 = _23074 + _23075;
        #line 4 "gaussian.impala"
        int _23034;
        _23034 = _20647_22983.e1;
        #line 50 "gpu_device.impala"
        char* _23060;
        _23060 = _23059.e1;
        #line 4 "gaussian.impala"
        int h_anchor_23036;
        h_anchor_23036 = _23034 / 2;
        #line 50 "gpu_device.impala"
        double* _23061;
        union { double* dst; char* src; } u_23061;
        u_23061.src = _23060;
        _23061 = u_23061.dst;
        #line 17 "gaussian.impala"
        bool _23037;
        _23037 = h_anchor_23036 <= gid_x_23022;
        #line 17 "gaussian.impala"
        if (_23037) goto l23038; else goto l23088;
    l23088: ;
        #line 27 "gaussian.impala"
        goto l23082;
    l23038: ;
        #line 17 "gaussian.impala"
        int _23039;
        _23039 = _23024 - h_anchor_23036;
        #line 17 "gaussian.impala"
        bool _23040;
        _23040 = gid_x_23022 < _23039;
        #line 17 "gaussian.impala"
        if (_23040) goto l23041; else goto l23081;
    l23081: ;
        #line 27 "gaussian.impala"
        goto l23082;
    l23082: ;
        #line 50 "gpu_device.impala"
        double* _23083;
        _23083 = _23061 + _23075;
        ds_img[_23075 + 3 - blockIdx.x * blockDim.x][_23075 + 3 - blockIdx.y * blockDim.y]
        #line 50 "gpu_device.impala"
        double _23084;
        _23084 = *_23083;
        #line 50 "gpu_device.impala"
        double _23086;
        _23086 = _23084;
        #line 45 "gpu_device.impala"
        *_23076 = _23086;
        return ;
    l23041: ;
        #line 19 "gaussian.impala"
        int _23047;
        _23047 = 1 + h_anchor_23036;
        #line 55 "gpu_device.impala"
        struct_Buffer_5425 _23052;
        _23052 = _20647_22983.e0;
        #line 19 "gaussian.impala"
        int _23079;
        _23079 = 0 - h_anchor_23036;
        #line 55 "gpu_device.impala"
        char* _23053;
        _23053 = _23052.e1;
        #line 55 "gpu_device.impala"
        double* _23054;
        union { double* dst; char* src; } u_23054;
        u_23054.src = _23053;
        _23054 = u_23054.dst;
        #line 19 "gpu_device.impala"
        p_23043 = _23079;
        psum_23045 = 0.000000e+00;
        goto l23042;
    l23042: ;
        _23043 = p_23043;
        sum_23045 = psum_23045;
        #line 19 "gpu_device.impala"
        bool _23048;
        _23048 = _23043 < _23047;
        #line 19 "gpu_device.impala"
        if (_23048) goto l23049; else goto l23072;
    l23072: ;
        #line 45 "gpu_device.impala"
        *_23076 = sum_23045;
        return ;
    l23049: ;
        #line 23 "gpu_device.impala"
        int _23050;
        _23050 = 1 + _23043;
        #line 21 "gaussian.impala"
        int _23055;
        _23055 = _23043 + h_anchor_23036;
        #line 21 "gaussian.impala"
        int _23063;
        _23063 = gid_x_23022 + _23043;
        #line 54 "gpu_device.impala"
        double* i_23056;
        i_23056 = _23054 + _23055;
        ds_img[_23055 + 3 - blockIdx.x * blockDim.x][_23055 + 3 - blockIdx.y * blockDim.y]
        #line 50 "gpu_device.impala"
        int _23064;
        _23064 = _23062 + _23063;
        #line 55 "gpu_device.impala"
        double _23057;
        _23057 = *i_23056;
        #line 50 "gpu_device.impala"
        double* _23065;
        _23065 = _23061 + _23064;
        ds_img[_23064 + 3 - blockIdx.x * blockDim.x][_23064 + 3 - blockIdx.y * blockDim.y]
        #line 55 "gpu_device.impala"
        double _23068;
        _23068 = _23057;
        #line 50 "gpu_device.impala"
        double _23066;
        _23066 = *_23065;
        #line 50 "gpu_device.impala"
        double _23069;
        _23069 = _23066;
        #line 21 "gaussian.impala"
        double _23070;
        _23070 = _23068 * _23069;
        #line 21 "gaussian.impala"
        double _23071;
        _23071 = sum_23045 + _23070;
        #line 19 "gpu_device.impala"
        p_23043 = _23050;
        psum_23045 = _23071;
        goto l23042;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_20775(struct_filter_5428 _20778_23095, struct_image_5424 _20779_23096, struct_Buffer_5425 _20780_23097, double* _20781_23098, struct_Buffer_5425 _20782_23099) {
    __shared__ double ds_img[134][7];
    int  _23102;
    int p_23102;
    int  _23105;
    int p_23105;
    int  _23108;
    int p_23108;
    int  _23111;
    int p_23111;
    int  _23114;
    int p_23114;
    int  _23117;
    int p_23117;
    int  _23136;
    int p_23136;
    double  sum_23138;
    double psum_23138;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23102 = blockIdx_x();
    p_23102 = _23102;
    l23100: ;
        _23102 = p_23102;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23105 = blockDim_x();
        p_23105 = _23105;
    l23103: ;
        _23105 = p_23105;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23108 = threadIdx_x();
        p_23108 = _23108;
    l23106: ;
        _23108 = p_23108;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23111 = blockIdx_y();
        p_23111 = _23111;
    l23109: ;
        _23111 = p_23111;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23114 = blockDim_y();
        p_23114 = _23114;
    l23112: ;
        _23114 = p_23114;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23117 = threadIdx_y();
        p_23117 = _23117;
    l23115: ;
        _23117 = p_23117;
        #line 155 "gpu_device.impala"
        int _23118;
        _23118 = _23102 * _23105;
        #line 155 "gpu_device.impala"
        int gid_x_23119;
        gid_x_23119 = _23118 + _23108;
        #line 11 "main.impala"
        int _23120;
        _23120 = _20779_23096.e2;
        #line 160 "gpu_device.impala"
        bool _23121;
        _23121 = gid_x_23119 < _23120;
        #line 160 "gpu_device.impala"
        if (_23121) goto l23122; else goto l23180;
    l23180: ;
        #line 163 "gpu_device.impala"
        goto l23179;
    l23122: ;
        #line 157 "gpu_device.impala"
        int _23123;
        _23123 = _23111 * _23114;
        #line 11 "main.impala"
        int _23125;
        _23125 = _20779_23096.e3;
        #line 157 "gpu_device.impala"
        int gid_y_23124;
        gid_y_23124 = _23123 + _23117;
        #line 160 "gpu_device.impala"
        bool _23126;
        _23126 = gid_y_23124 < _23125;
        #line 160 "gpu_device.impala"
        if (_23126) goto l23127; else goto l23178;
    l23178: ;
        #line 163 "gpu_device.impala"
        goto l23179;
    l23179: ;
        return ;
    l23127: ;
        #line 45 "gpu_device.impala"
        char* _23163;
        _23163 = _20780_23097.e1;
        #line 50 "gpu_device.impala"
        char* _23150;
        _23150 = _20782_23099.e1;
        #line 50 "gpu_device.impala"
        int _23165;
        _23165 = gid_y_23124 * _23120;
        #line 6 "gaussian.impala"
        int _23128;
        _23128 = _20778_23095.e2;
        #line 45 "gpu_device.impala"
        double* _23164;
        union { double* dst; char* src; } u_23164;
        u_23164.src = _23163;
        _23164 = u_23164.dst;
        #line 50 "gpu_device.impala"
        double* _23151;
        union { double* dst; char* src; } u_23151;
        u_23151.src = _23150;
        _23151 = u_23151.dst;
        #line 50 "gpu_device.impala"
        int _23166;
        _23166 = _23165 + gid_x_23119;
        #line 6 "gaussian.impala"
        int v_anchor_23129;
        v_anchor_23129 = _23128 / 2;
        #line 45 "gpu_device.impala"
        double* _23167;
        _23167 = _23164 + _23166;
        #line 39 "gaussian.impala"
        bool _23130;
        _23130 = v_anchor_23129 <= gid_y_23124;
        #line 39 "gaussian.impala"
        if (_23130) goto l23131; else goto l23177;
    l23177: ;
        #line 49 "gaussian.impala"
        goto l23171;
    l23131: ;
        #line 39 "gaussian.impala"
        int _23132;
        _23132 = _23125 - v_anchor_23129;
        #line 39 "gaussian.impala"
        bool _23133;
        _23133 = gid_y_23124 < _23132;
        #line 39 "gaussian.impala"
        if (_23133) goto l23134; else goto l23170;
    l23170: ;
        #line 49 "gaussian.impala"
        goto l23171;
    l23171: ;
        #line 50 "gpu_device.impala"
        double* _23172;
        _23172 = _23151 + _23166;
        ds_img[_23166 + 3 - blockIdx.x * blockDim.x][_23166 + 3 - blockIdx.y * blockDim.y]
        #line 50 "gpu_device.impala"
        double _23173;
        _23173 = *_23172;
        #line 50 "gpu_device.impala"
        double _23175;
        _23175 = _23173;
        #line 45 "gpu_device.impala"
        *_23167 = _23175;
        return ;
    l23134: ;
        #line 41 "gaussian.impala"
        int _23139;
        _23139 = 1 + v_anchor_23129;
        #line 55 "gpu_device.impala"
        struct_Buffer_5425 _23143;
        _23143 = _20778_23095.e0;
        #line 41 "gaussian.impala"
        int _23169;
        _23169 = 0 - v_anchor_23129;
        #line 55 "gpu_device.impala"
        char* _23144;
        _23144 = _23143.e1;
        #line 55 "gpu_device.impala"
        double* _23145;
        union { double* dst; char* src; } u_23145;
        u_23145.src = _23144;
        _23145 = u_23145.dst;
        #line 19 "gpu_device.impala"
        p_23136 = _23169;
        psum_23138 = 0.000000e+00;
        goto l23135;
    l23135: ;
        _23136 = p_23136;
        sum_23138 = psum_23138;
        #line 19 "gpu_device.impala"
        bool _23140;
        _23140 = _23136 < _23139;
        #line 19 "gpu_device.impala"
        if (_23140) goto l23141; else goto l23162;
    l23162: ;
        #line 45 "gpu_device.impala"
        *_23167 = sum_23138;
        return ;
    l23141: ;
        #line 43 "gaussian.impala"
        int _23146;
        _23146 = _23136 + v_anchor_23129;
        #line 43 "gaussian.impala"
        int _23152;
        _23152 = gid_y_23124 + _23136;
        #line 50 "gpu_device.impala"
        int _23153;
        _23153 = _23152 * _23120;
        #line 23 "gpu_device.impala"
        int _23142;
        _23142 = 1 + _23136;
        #line 54 "gpu_device.impala"
        double* i_23147;
        i_23147 = _23145 + _23146;
        ds_img[_23146 + 3 - blockIdx.x * blockDim.x][_23146 + 3 - blockIdx.y * blockDim.y]
        #line 55 "gpu_device.impala"
        double _23148;
        _23148 = *i_23147;
        #line 50 "gpu_device.impala"
        int _23154;
        _23154 = _23153 + gid_x_23119;
        #line 55 "gpu_device.impala"
        double _23158;
        _23158 = _23148;
        #line 50 "gpu_device.impala"
        double* _23155;
        _23155 = _23151 + _23154;
        ds_img[_23154 + 3 - blockIdx.x * blockDim.x][_23154 + 3 - blockIdx.y * blockDim.y]
        #line 50 "gpu_device.impala"
        double _23156;
        _23156 = *_23155;
        #line 50 "gpu_device.impala"
        double _23159;
        _23159 = _23156;
        #line 43 "gaussian.impala"
        double _23160;
        _23160 = _23158 * _23159;
        #line 43 "gaussian.impala"
        double _23161;
        _23161 = sum_23138 + _23160;
        #line 19 "gpu_device.impala"
        p_23136 = _23142;
        psum_23138 = _23161;
        goto l23135;
}

}