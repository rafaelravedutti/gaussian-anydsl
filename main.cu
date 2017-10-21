extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5489;
typedef struct {
    struct_Buffer_5489 e0;
    struct_Buffer_5489 e1;
    int e2;
    int e3;
} struct_image_5488;
typedef struct {
    struct_Buffer_5489 e0;
    int e1;
} struct_filter_5492;

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
__global__ void lambda_20698(struct_image_5488, struct_Buffer_5489, struct_filter_5492);
__global__ void lambda_20830(struct_image_5488, struct_Buffer_5489, double*, struct_Buffer_5489, struct_filter_5492);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_20698(struct_image_5488 _20701_23037, struct_Buffer_5489 _20702_23038, struct_filter_5492 _20703_23039) {
    int  _23045;
    int p_23045;
    int  _23051;
    int p_23051;
    int  _23057;
    int p_23057;
    int  _23063;
    int p_23063;
    int  _23069;
    int p_23069;
    int  _23075;
    int p_23075;
    int  _23098;
    int p_23098;
    double  sum_23100;
    double psum_23100;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23045 = blockIdx_x();
    p_23045 = _23045;
    l23043: ;
        _23045 = p_23045;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23051 = blockDim_x();
        p_23051 = _23051;
    l23049: ;
        _23051 = p_23051;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23057 = threadIdx_x();
        p_23057 = _23057;
    l23055: ;
        _23057 = p_23057;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23063 = blockIdx_y();
        p_23063 = _23063;
    l23061: ;
        _23063 = p_23063;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23069 = blockDim_y();
        p_23069 = _23069;
    l23067: ;
        _23069 = p_23069;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23075 = threadIdx_y();
        p_23075 = _23075;
    l23073: ;
        _23075 = p_23075;
        #line 87 "gpu_device.impala"
        int _23076;
        _23076 = _23045 * _23051;
        #line 6 "main.impala"
        int _23079;
        _23079 = _20701_23037.e2;
        #line 87 "gpu_device.impala"
        int gid_x_23077;
        gid_x_23077 = _23076 + _23057;
        #line 90 "gpu_device.impala"
        bool _23080;
        _23080 = gid_x_23077 < _23079;
        #line 90 "gpu_device.impala"
        if (_23080) goto l23081; else goto l23146;
    l23146: ;
        #line 92 "gpu_device.impala"
        goto l23145;
    l23081: ;
        #line 88 "gpu_device.impala"
        int _23082;
        _23082 = _23063 * _23069;
        #line 6 "main.impala"
        int _23085;
        _23085 = _20701_23037.e3;
        #line 88 "gpu_device.impala"
        int gid_y_23083;
        gid_y_23083 = _23082 + _23075;
        #line 90 "gpu_device.impala"
        bool _23086;
        _23086 = gid_y_23083 < _23085;
        #line 90 "gpu_device.impala"
        if (_23086) goto l23087; else goto l23144;
    l23144: ;
        #line 92 "gpu_device.impala"
        goto l23145;
    l23145: ;
        return ;
    l23087: ;
        #line 18 "gaussian.impala"
        int _23117;
        _23117 = gid_y_23083 * _23079;
        #line 3 "gaussian.impala"
        int _23089;
        _23089 = _20703_23039.e1;
        #line 39 "gpu_device.impala"
        struct_Buffer_5489 _23114;
        _23114 = _20701_23037.e1;
        #line 25 "gpu_device.impala"
        char* _23128;
        _23128 = _20702_23038.e1;
        #line 3 "gaussian.impala"
        int h_anchor_23091;
        h_anchor_23091 = _23089 / 2;
        #line 18 "gaussian.impala"
        int _23130;
        _23130 = _23117 + gid_x_23077;
        #line 39 "gpu_device.impala"
        char* _23115;
        _23115 = _23114.e1;
        #line 25 "gpu_device.impala"
        double* _23129;
        union { double* dst; char* src; } u_23129;
        u_23129.src = _23128;
        _23129 = u_23129.dst;
        #line 13 "gaussian.impala"
        bool _23092;
        _23092 = h_anchor_23091 <= gid_x_23077;
        #line 24 "gpu_device.impala"
        double* index_23131;
        index_23131 = _23129 + _23130;
        #line 39 "gpu_device.impala"
        double* _23116;
        union { double* dst; char* src; } u_23116;
        u_23116.src = _23115;
        _23116 = u_23116.dst;
        #line 13 "gaussian.impala"
        if (_23092) goto l23093; else goto l23143;
    l23143: ;
        #line 19 "gaussian.impala"
        goto l23137;
    l23093: ;
        #line 13 "gaussian.impala"
        int _23094;
        _23094 = _23079 - h_anchor_23091;
        #line 13 "gaussian.impala"
        bool _23095;
        _23095 = gid_x_23077 < _23094;
        #line 13 "gaussian.impala"
        if (_23095) goto l23096; else goto l23136;
    l23136: ;
        #line 19 "gaussian.impala"
        goto l23137;
    l23137: ;
        #line 39 "gpu_device.impala"
        double* _23138;
        _23138 = _23116 + _23130;
        #line 39 "gpu_device.impala"
        double _23139;
        _23139 = *_23138;
        #line 39 "gpu_device.impala"
        double _23141;
        _23141 = _23139;
        #line 25 "gpu_device.impala"
        *index_23131 = _23141;
        return ;
    l23096: ;
        #line 14 "gaussian.impala"
        int _23134;
        _23134 = 0 - h_anchor_23091;
        #line 14 "gaussian.impala"
        int _23102;
        _23102 = 1 + h_anchor_23091;
        #line 44 "gpu_device.impala"
        struct_Buffer_5489 _23107;
        _23107 = _20703_23039.e0;
        #line 44 "gpu_device.impala"
        char* _23108;
        _23108 = _23107.e1;
        #line 44 "gpu_device.impala"
        double* _23109;
        union { double* dst; char* src; } u_23109;
        u_23109.src = _23108;
        _23109 = u_23109.dst;
        #line 14 "gpu_device.impala"
        p_23098 = _23134;
        psum_23100 = 0.000000e+00;
        goto l23097;
    l23097: ;
        _23098 = p_23098;
        sum_23100 = psum_23100;
        #line 14 "gpu_device.impala"
        bool _23103;
        _23103 = _23098 < _23102;
        #line 14 "gpu_device.impala"
        if (_23103) goto l23104; else goto l23127;
    l23127: ;
        #line 25 "gpu_device.impala"
        *index_23131 = sum_23100;
        return ;
    l23104: ;
        #line 15 "gaussian.impala"
        int _23118;
        _23118 = gid_x_23077 + _23098;
        #line 16 "gpu_device.impala"
        int _23105;
        _23105 = 1 + _23098;
        #line 15 "gaussian.impala"
        int _23110;
        _23110 = _23098 + h_anchor_23091;
        #line 39 "gpu_device.impala"
        int _23119;
        _23119 = _23117 + _23118;
        #line 39 "gpu_device.impala"
        double* _23120;
        _23120 = _23116 + _23119;
        #line 43 "gpu_device.impala"
        double* i_23111;
        i_23111 = _23109 + _23110;
        #line 44 "gpu_device.impala"
        double _23112;
        _23112 = *i_23111;
        #line 44 "gpu_device.impala"
        double _23123;
        _23123 = _23112;
        #line 39 "gpu_device.impala"
        double _23121;
        _23121 = *_23120;
        #line 39 "gpu_device.impala"
        double _23124;
        _23124 = _23121;
        #line 15 "gaussian.impala"
        double _23125;
        _23125 = _23123 * _23124;
        #line 15 "gaussian.impala"
        double _23126;
        _23126 = sum_23100 + _23125;
        #line 14 "gpu_device.impala"
        p_23098 = _23105;
        psum_23100 = _23126;
        goto l23097;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_20830(struct_image_5488 _20833_23150, struct_Buffer_5489 _20834_23151, double* _20835_23152, struct_Buffer_5489 _20836_23153, struct_filter_5492 _20837_23154) {
    int  _23157;
    int p_23157;
    int  _23160;
    int p_23160;
    int  _23163;
    int p_23163;
    int  _23166;
    int p_23166;
    int  _23169;
    int p_23169;
    int  _23172;
    int p_23172;
    int  _23191;
    int p_23191;
    double  sum_23193;
    double psum_23193;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23157 = blockIdx_x();
    p_23157 = _23157;
    l23155: ;
        _23157 = p_23157;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23160 = blockDim_x();
        p_23160 = _23160;
    l23158: ;
        _23160 = p_23160;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23163 = threadIdx_x();
        p_23163 = _23163;
    l23161: ;
        _23163 = p_23163;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23166 = blockIdx_y();
        p_23166 = _23166;
    l23164: ;
        _23166 = p_23166;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23169 = blockDim_y();
        p_23169 = _23169;
    l23167: ;
        _23169 = p_23169;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23172 = threadIdx_y();
        p_23172 = _23172;
    l23170: ;
        _23172 = p_23172;
        #line 6 "main.impala"
        int _23175;
        _23175 = _20833_23150.e2;
        #line 87 "gpu_device.impala"
        int _23173;
        _23173 = _23157 * _23160;
        #line 87 "gpu_device.impala"
        int gid_x_23174;
        gid_x_23174 = _23173 + _23163;
        #line 90 "gpu_device.impala"
        bool _23176;
        _23176 = gid_x_23174 < _23175;
        #line 90 "gpu_device.impala"
        if (_23176) goto l23177; else goto l23235;
    l23235: ;
        #line 92 "gpu_device.impala"
        goto l23234;
    l23177: ;
        #line 6 "main.impala"
        int _23180;
        _23180 = _20833_23150.e3;
        #line 88 "gpu_device.impala"
        int _23178;
        _23178 = _23166 * _23169;
        #line 88 "gpu_device.impala"
        int gid_y_23179;
        gid_y_23179 = _23178 + _23172;
        #line 90 "gpu_device.impala"
        bool _23181;
        _23181 = gid_y_23179 < _23180;
        #line 90 "gpu_device.impala"
        if (_23181) goto l23182; else goto l23233;
    l23233: ;
        #line 92 "gpu_device.impala"
        goto l23234;
    l23234: ;
        return ;
    l23182: ;
        #line 34 "gpu_device.impala"
        char* _23218;
        _23218 = _20836_23153.e1;
        #line 4 "gaussian.impala"
        int _23183;
        _23183 = _20837_23154.e1;
        #line 34 "gpu_device.impala"
        double* _23219;
        union { double* dst; char* src; } u_23219;
        u_23219.src = _23218;
        _23219 = u_23219.dst;
        #line 4 "gaussian.impala"
        int v_anchor_23184;
        v_anchor_23184 = _23183 / 2;
        #line 29 "gpu_device.impala"
        char* _23205;
        _23205 = _20834_23151.e1;
        #line 36 "gaussian.impala"
        int _23220;
        _23220 = gid_y_23179 * _23175;
        #line 29 "gaussian.impala"
        bool _23185;
        _23185 = v_anchor_23184 <= gid_y_23179;
        #line 29 "gpu_device.impala"
        double* _23206;
        union { double* dst; char* src; } u_23206;
        u_23206.src = _23205;
        _23206 = u_23206.dst;
        #line 36 "gaussian.impala"
        int _23221;
        _23221 = _23220 + gid_x_23174;
        #line 34 "gpu_device.impala"
        double* _23222;
        _23222 = _23219 + _23221;
        #line 29 "gaussian.impala"
        if (_23185) goto l23186; else goto l23232;
    l23232: ;
        #line 35 "gaussian.impala"
        goto l23226;
    l23186: ;
        #line 29 "gaussian.impala"
        int _23187;
        _23187 = _23180 - v_anchor_23184;
        #line 29 "gaussian.impala"
        bool _23188;
        _23188 = gid_y_23179 < _23187;
        #line 29 "gaussian.impala"
        if (_23188) goto l23189; else goto l23225;
    l23225: ;
        #line 35 "gaussian.impala"
        goto l23226;
    l23226: ;
        #line 28 "gpu_device.impala"
        double* index_23227;
        index_23227 = _23206 + _23221;
        #line 29 "gpu_device.impala"
        double _23228;
        _23228 = *index_23227;
        #line 29 "gpu_device.impala"
        double _23230;
        _23230 = _23228;
        #line 34 "gpu_device.impala"
        *_23222 = _23230;
        return ;
    l23189: ;
        #line 44 "gpu_device.impala"
        struct_Buffer_5489 _23198;
        _23198 = _20837_23154.e0;
        #line 30 "gaussian.impala"
        int _23224;
        _23224 = 0 - v_anchor_23184;
        #line 44 "gpu_device.impala"
        char* _23199;
        _23199 = _23198.e1;
        #line 30 "gaussian.impala"
        int _23194;
        _23194 = 1 + v_anchor_23184;
        #line 44 "gpu_device.impala"
        double* _23200;
        union { double* dst; char* src; } u_23200;
        u_23200.src = _23199;
        _23200 = u_23200.dst;
        #line 14 "gpu_device.impala"
        p_23191 = _23224;
        psum_23193 = 0.000000e+00;
        goto l23190;
    l23190: ;
        _23191 = p_23191;
        sum_23193 = psum_23193;
        #line 14 "gpu_device.impala"
        bool _23195;
        _23195 = _23191 < _23194;
        #line 14 "gpu_device.impala"
        if (_23195) goto l23196; else goto l23217;
    l23217: ;
        #line 34 "gpu_device.impala"
        *_23222 = sum_23193;
        return ;
    l23196: ;
        #line 31 "gaussian.impala"
        int _23201;
        _23201 = _23191 + v_anchor_23184;
        #line 43 "gpu_device.impala"
        double* i_23202;
        i_23202 = _23200 + _23201;
        #line 31 "gaussian.impala"
        int _23207;
        _23207 = gid_y_23179 + _23191;
        #line 16 "gpu_device.impala"
        int _23197;
        _23197 = 1 + _23191;
        #line 44 "gpu_device.impala"
        double _23203;
        _23203 = *i_23202;
        #line 31 "gaussian.impala"
        int _23208;
        _23208 = _23207 * _23175;
        #line 44 "gpu_device.impala"
        double _23213;
        _23213 = _23203;
        #line 31 "gaussian.impala"
        int _23209;
        _23209 = _23208 + gid_x_23174;
        #line 28 "gpu_device.impala"
        double* index_23210;
        index_23210 = _23206 + _23209;
        #line 29 "gpu_device.impala"
        double _23211;
        _23211 = *index_23210;
        #line 29 "gpu_device.impala"
        double _23214;
        _23214 = _23211;
        #line 31 "gaussian.impala"
        double _23215;
        _23215 = _23213 * _23214;
        #line 31 "gaussian.impala"
        double _23216;
        _23216 = sum_23193 + _23215;
        #line 14 "gpu_device.impala"
        p_23191 = _23197;
        psum_23193 = _23216;
        goto l23190;
}

}