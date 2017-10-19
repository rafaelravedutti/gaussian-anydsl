extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5292;
typedef struct {
    struct_Buffer_5292 e0;
    struct_Buffer_5292 e1;
    int e2;
    int e3;
} struct_image_5291;
typedef struct {
    struct_Buffer_5292 e0;
    int e1;
} struct_filter_5295;

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
__global__ void lambda_19779(double*, struct_image_5291, struct_filter_5295, struct_Buffer_5292);
__global__ void lambda_19916(double*, struct_image_5291, struct_Buffer_5292, struct_filter_5295);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_19779(double* _19782_22128, struct_image_5291 _19783_22129, struct_filter_5295 _19784_22130, struct_Buffer_5292 _19785_22131) {
    int  _22137;
    int p_22137;
    int  _22143;
    int p_22143;
    int  _22149;
    int p_22149;
    int  _22155;
    int p_22155;
    int  _22161;
    int p_22161;
    int  _22167;
    int p_22167;
    int  _22190;
    int p_22190;
    double  sum_22192;
    double psum_22192;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _22137 = blockIdx_x();
    p_22137 = _22137;
    l22135: ;
        _22137 = p_22137;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22143 = blockDim_x();
        p_22143 = _22143;
    l22141: ;
        _22143 = p_22143;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22149 = threadIdx_x();
        p_22149 = _22149;
    l22147: ;
        _22149 = p_22149;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22155 = blockIdx_y();
        p_22155 = _22155;
    l22153: ;
        _22155 = p_22155;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22161 = blockDim_y();
        p_22161 = _22161;
    l22159: ;
        _22161 = p_22161;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22167 = threadIdx_y();
        p_22167 = _22167;
    l22165: ;
        _22167 = p_22167;
        #line 66 "gpu_device.impala"
        int _22168;
        _22168 = _22137 * _22143;
        #line 66 "gpu_device.impala"
        int gid_x_22169;
        gid_x_22169 = _22168 + _22149;
        #line 6 "main.impala"
        int _22171;
        _22171 = _19783_22129.e2;
        #line 69 "gpu_device.impala"
        bool _22172;
        _22172 = gid_x_22169 < _22171;
        #line 69 "gpu_device.impala"
        if (_22172) goto l22173; else goto l22238;
    l22238: ;
        #line 71 "gpu_device.impala"
        goto l22237;
    l22173: ;
        #line 6 "main.impala"
        int _22177;
        _22177 = _19783_22129.e3;
        #line 67 "gpu_device.impala"
        int _22174;
        _22174 = _22155 * _22161;
        #line 67 "gpu_device.impala"
        int gid_y_22175;
        gid_y_22175 = _22174 + _22167;
        #line 69 "gpu_device.impala"
        bool _22178;
        _22178 = gid_y_22175 < _22177;
        #line 69 "gpu_device.impala"
        if (_22178) goto l22179; else goto l22236;
    l22236: ;
        #line 71 "gpu_device.impala"
        goto l22237;
    l22237: ;
        return ;
    l22179: ;
        #line 3 "gaussian.impala"
        int _22181;
        _22181 = _19784_22130.e1;
        #line 26 "gpu_device.impala"
        char* _22220;
        _22220 = _19785_22131.e1;
        #line 31 "gpu_device.impala"
        struct_Buffer_5292 _22206;
        _22206 = _19783_22129.e1;
        #line 31 "gpu_device.impala"
        char* _22207;
        _22207 = _22206.e1;
        #line 31 "gpu_device.impala"
        int _22209;
        _22209 = gid_y_22175 * _22171;
        #line 3 "gaussian.impala"
        int anchor_22183;
        anchor_22183 = _22181 / 2;
        #line 26 "gpu_device.impala"
        double* _22221;
        union { double* dst; char* src; } u_22221;
        u_22221.src = _22220;
        _22221 = u_22221.dst;
        #line 31 "gpu_device.impala"
        double* _22208;
        union { double* dst; char* src; } u_22208;
        u_22208.src = _22207;
        _22208 = u_22208.dst;
        #line 31 "gpu_device.impala"
        int _22222;
        _22222 = _22209 + gid_x_22169;
        #line 10 "gaussian.impala"
        bool _22184;
        _22184 = anchor_22183 <= gid_x_22169;
        #line 26 "gpu_device.impala"
        double* _22223;
        _22223 = _22221 + _22222;
        #line 10 "gaussian.impala"
        if (_22184) goto l22185; else goto l22235;
    l22235: ;
        #line 16 "gaussian.impala"
        goto l22229;
    l22185: ;
        #line 10 "gaussian.impala"
        int _22186;
        _22186 = _22171 - anchor_22183;
        #line 10 "gaussian.impala"
        bool _22187;
        _22187 = gid_x_22169 < _22186;
        #line 10 "gaussian.impala"
        if (_22187) goto l22188; else goto l22228;
    l22228: ;
        #line 16 "gaussian.impala"
        goto l22229;
    l22229: ;
        #line 31 "gpu_device.impala"
        double* _22230;
        _22230 = _22208 + _22222;
        #line 31 "gpu_device.impala"
        double _22231;
        _22231 = *_22230;
        #line 31 "gpu_device.impala"
        double _22233;
        _22233 = _22231;
        #line 26 "gpu_device.impala"
        *_22223 = _22233;
        return ;
    l22188: ;
        #line 11 "gaussian.impala"
        int _22194;
        _22194 = 1 + anchor_22183;
        #line 36 "gpu_device.impala"
        struct_Buffer_5292 _22199;
        _22199 = _19784_22130.e0;
        #line 11 "gaussian.impala"
        int _22226;
        _22226 = 0 - anchor_22183;
        #line 36 "gpu_device.impala"
        char* _22200;
        _22200 = _22199.e1;
        #line 36 "gpu_device.impala"
        double* _22201;
        union { double* dst; char* src; } u_22201;
        u_22201.src = _22200;
        _22201 = u_22201.dst;
        #line 14 "gpu_device.impala"
        p_22190 = _22226;
        psum_22192 = 0.000000e+00;
        goto l22189;
    l22189: ;
        _22190 = p_22190;
        sum_22192 = psum_22192;
        #line 14 "gpu_device.impala"
        bool _22195;
        _22195 = _22190 < _22194;
        #line 14 "gpu_device.impala"
        if (_22195) goto l22196; else goto l22219;
    l22219: ;
        #line 26 "gpu_device.impala"
        *_22223 = sum_22192;
        return ;
    l22196: ;
        #line 12 "gaussian.impala"
        int _22202;
        _22202 = _22190 + anchor_22183;
        #line 16 "gpu_device.impala"
        int _22197;
        _22197 = 1 + _22190;
        #line 35 "gpu_device.impala"
        double* i_22203;
        i_22203 = _22201 + _22202;
        #line 12 "gaussian.impala"
        int _22210;
        _22210 = gid_x_22169 + _22190;
        #line 36 "gpu_device.impala"
        double _22204;
        _22204 = *i_22203;
        #line 31 "gpu_device.impala"
        int _22211;
        _22211 = _22209 + _22210;
        #line 36 "gpu_device.impala"
        double _22215;
        _22215 = _22204;
        #line 31 "gpu_device.impala"
        double* _22212;
        _22212 = _22208 + _22211;
        #line 31 "gpu_device.impala"
        double _22213;
        _22213 = *_22212;
        #line 31 "gpu_device.impala"
        double _22216;
        _22216 = _22213;
        #line 12 "gaussian.impala"
        double _22217;
        _22217 = _22215 * _22216;
        #line 12 "gaussian.impala"
        double _22218;
        _22218 = sum_22192 + _22217;
        #line 14 "gpu_device.impala"
        p_22190 = _22197;
        psum_22192 = _22218;
        goto l22189;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_19916(double* _19919_22242, struct_image_5291 _19920_22243, struct_Buffer_5292 _19921_22244, struct_filter_5295 _19922_22245) {
    int  _22248;
    int p_22248;
    int  _22251;
    int p_22251;
    int  _22254;
    int p_22254;
    int  _22257;
    int p_22257;
    int  _22260;
    int p_22260;
    int  _22263;
    int p_22263;
    int  _22282;
    int p_22282;
    double  sum_22284;
    double psum_22284;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _22248 = blockIdx_x();
    p_22248 = _22248;
    l22246: ;
        _22248 = p_22248;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22251 = blockDim_x();
        p_22251 = _22251;
    l22249: ;
        _22251 = p_22251;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22254 = threadIdx_x();
        p_22254 = _22254;
    l22252: ;
        _22254 = p_22254;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22257 = blockIdx_y();
        p_22257 = _22257;
    l22255: ;
        _22257 = p_22257;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22260 = blockDim_y();
        p_22260 = _22260;
    l22258: ;
        _22260 = p_22260;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22263 = threadIdx_y();
        p_22263 = _22263;
    l22261: ;
        _22263 = p_22263;
        #line 66 "gpu_device.impala"
        int _22264;
        _22264 = _22248 * _22251;
        #line 66 "gpu_device.impala"
        int gid_x_22265;
        gid_x_22265 = _22264 + _22254;
        #line 6 "main.impala"
        int _22266;
        _22266 = _19920_22243.e2;
        #line 69 "gpu_device.impala"
        bool _22267;
        _22267 = gid_x_22265 < _22266;
        #line 69 "gpu_device.impala"
        if (_22267) goto l22268; else goto l22327;
    l22327: ;
        #line 71 "gpu_device.impala"
        goto l22326;
    l22268: ;
        #line 6 "main.impala"
        int _22271;
        _22271 = _19920_22243.e3;
        #line 67 "gpu_device.impala"
        int _22269;
        _22269 = _22257 * _22260;
        #line 67 "gpu_device.impala"
        int gid_y_22270;
        gid_y_22270 = _22269 + _22263;
        #line 69 "gpu_device.impala"
        bool _22272;
        _22272 = gid_y_22270 < _22271;
        #line 69 "gpu_device.impala"
        if (_22272) goto l22273; else goto l22325;
    l22325: ;
        #line 71 "gpu_device.impala"
        goto l22326;
    l22326: ;
        return ;
    l22273: ;
        #line 26 "gpu_device.impala"
        char* _22310;
        _22310 = _19921_22244.e1;
        #line 24 "gaussian.impala"
        int _22274;
        _22274 = _19922_22245.e1;
        #line 31 "gpu_device.impala"
        struct_Buffer_5292 _22296;
        _22296 = _19920_22243.e1;
        #line 31 "gpu_device.impala"
        int _22312;
        _22312 = gid_y_22270 * _22266;
        #line 26 "gpu_device.impala"
        double* _22311;
        union { double* dst; char* src; } u_22311;
        u_22311.src = _22310;
        _22311 = u_22311.dst;
        #line 24 "gaussian.impala"
        int anchor_22275;
        anchor_22275 = _22274 / 2;
        #line 31 "gpu_device.impala"
        char* _22297;
        _22297 = _22296.e1;
        #line 31 "gpu_device.impala"
        int _22313;
        _22313 = _22312 + gid_x_22265;
        #line 26 "gpu_device.impala"
        double* _22314;
        _22314 = _22311 + _22313;
        #line 31 "gaussian.impala"
        bool _22276;
        _22276 = anchor_22275 <= gid_y_22270;
        #line 31 "gpu_device.impala"
        double* _22298;
        union { double* dst; char* src; } u_22298;
        u_22298.src = _22297;
        _22298 = u_22298.dst;
        #line 31 "gaussian.impala"
        if (_22276) goto l22277; else goto l22324;
    l22324: ;
        #line 37 "gaussian.impala"
        goto l22318;
    l22277: ;
        #line 31 "gaussian.impala"
        int _22278;
        _22278 = _22271 - anchor_22275;
        #line 31 "gaussian.impala"
        bool _22279;
        _22279 = gid_y_22270 < _22278;
        #line 31 "gaussian.impala"
        if (_22279) goto l22280; else goto l22317;
    l22317: ;
        #line 37 "gaussian.impala"
        goto l22318;
    l22318: ;
        #line 31 "gpu_device.impala"
        double* _22319;
        _22319 = _22298 + _22313;
        #line 31 "gpu_device.impala"
        double _22320;
        _22320 = *_22319;
        #line 31 "gpu_device.impala"
        double _22322;
        _22322 = _22320;
        #line 26 "gpu_device.impala"
        *_22314 = _22322;
        return ;
    l22280: ;
        #line 36 "gpu_device.impala"
        struct_Buffer_5292 _22289;
        _22289 = _19922_22245.e0;
        #line 36 "gpu_device.impala"
        char* _22290;
        _22290 = _22289.e1;
        #line 36 "gpu_device.impala"
        double* _22291;
        union { double* dst; char* src; } u_22291;
        u_22291.src = _22290;
        _22291 = u_22291.dst;
        #line 32 "gaussian.impala"
        int _22285;
        _22285 = 1 + anchor_22275;
        #line 32 "gaussian.impala"
        int _22316;
        _22316 = 0 - anchor_22275;
        #line 14 "gpu_device.impala"
        p_22282 = _22316;
        psum_22284 = 0.000000e+00;
        goto l22281;
    l22281: ;
        _22282 = p_22282;
        sum_22284 = psum_22284;
        #line 14 "gpu_device.impala"
        bool _22286;
        _22286 = _22282 < _22285;
        #line 14 "gpu_device.impala"
        if (_22286) goto l22287; else goto l22309;
    l22309: ;
        #line 26 "gpu_device.impala"
        *_22314 = sum_22284;
        return ;
    l22287: ;
        #line 16 "gpu_device.impala"
        int _22288;
        _22288 = 1 + _22282;
        #line 33 "gaussian.impala"
        int _22292;
        _22292 = _22282 + anchor_22275;
        #line 33 "gaussian.impala"
        int _22299;
        _22299 = gid_y_22270 + _22282;
        #line 35 "gpu_device.impala"
        double* i_22293;
        i_22293 = _22291 + _22292;
        #line 31 "gpu_device.impala"
        int _22300;
        _22300 = _22299 * _22266;
        #line 36 "gpu_device.impala"
        double _22294;
        _22294 = *i_22293;
        #line 31 "gpu_device.impala"
        int _22301;
        _22301 = _22300 + gid_x_22265;
        #line 36 "gpu_device.impala"
        double _22305;
        _22305 = _22294;
        #line 31 "gpu_device.impala"
        double* _22302;
        _22302 = _22298 + _22301;
        #line 31 "gpu_device.impala"
        double _22303;
        _22303 = *_22302;
        #line 31 "gpu_device.impala"
        double _22306;
        _22306 = _22303;
        #line 33 "gaussian.impala"
        double _22307;
        _22307 = _22305 * _22306;
        #line 33 "gaussian.impala"
        double _22308;
        _22308 = sum_22284 + _22307;
        #line 14 "gpu_device.impala"
        p_22282 = _22288;
        psum_22284 = _22308;
        goto l22281;
}

}