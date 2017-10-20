extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5307;
typedef struct {
    struct_Buffer_5307 e0;
    int e1;
} struct_filter_5306;
typedef struct {
    struct_Buffer_5307 e0;
    struct_Buffer_5307 e1;
    int e2;
    int e3;
} struct_image_5312;

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
__global__ void lambda_19830(struct_filter_5306, struct_Buffer_5307, double*, struct_image_5312);
__global__ void lambda_19967(struct_Buffer_5307, double*, struct_image_5312, struct_filter_5306);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_19830(struct_filter_5306 _19833_22179, struct_Buffer_5307 _19834_22180, double* _19835_22181, struct_image_5312 _19836_22182) {
    int  _22188;
    int p_22188;
    int  _22194;
    int p_22194;
    int  _22200;
    int p_22200;
    int  _22206;
    int p_22206;
    int  _22212;
    int p_22212;
    int  _22218;
    int p_22218;
    int  _22241;
    int p_22241;
    double  sum_22243;
    double psum_22243;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _22188 = blockIdx_x();
    p_22188 = _22188;
    l22186: ;
        _22188 = p_22188;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22194 = blockDim_x();
        p_22194 = _22194;
    l22192: ;
        _22194 = p_22194;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22200 = threadIdx_x();
        p_22200 = _22200;
    l22198: ;
        _22200 = p_22200;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22206 = blockIdx_y();
        p_22206 = _22206;
    l22204: ;
        _22206 = p_22206;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22212 = blockDim_y();
        p_22212 = _22212;
    l22210: ;
        _22212 = p_22212;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22218 = threadIdx_y();
        p_22218 = _22218;
    l22216: ;
        _22218 = p_22218;
        #line 6 "main.impala"
        int _22222;
        _22222 = _19836_22182.e2;
        #line 66 "gpu_device.impala"
        int _22219;
        _22219 = _22188 * _22194;
        #line 66 "gpu_device.impala"
        int gid_x_22220;
        gid_x_22220 = _22219 + _22200;
        #line 69 "gpu_device.impala"
        bool _22223;
        _22223 = gid_x_22220 < _22222;
        #line 69 "gpu_device.impala"
        if (_22223) goto l22224; else goto l22289;
    l22289: ;
        #line 71 "gpu_device.impala"
        goto l22288;
    l22224: ;
        #line 67 "gpu_device.impala"
        int _22225;
        _22225 = _22206 * _22212;
        #line 67 "gpu_device.impala"
        int gid_y_22226;
        gid_y_22226 = _22225 + _22218;
        #line 6 "main.impala"
        int _22228;
        _22228 = _19836_22182.e3;
        #line 69 "gpu_device.impala"
        bool _22229;
        _22229 = gid_y_22226 < _22228;
        #line 69 "gpu_device.impala"
        if (_22229) goto l22230; else goto l22287;
    l22287: ;
        #line 71 "gpu_device.impala"
        goto l22288;
    l22288: ;
        return ;
    l22230: ;
        #line 31 "gpu_device.impala"
        struct_Buffer_5307 _22257;
        _22257 = _19836_22182.e1;
        #line 26 "gpu_device.impala"
        char* _22271;
        _22271 = _19834_22180.e1;
        #line 31 "gpu_device.impala"
        int _22260;
        _22260 = gid_y_22226 * _22222;
        #line 31 "gpu_device.impala"
        char* _22258;
        _22258 = _22257.e1;
        #line 3 "gaussian.impala"
        int _22232;
        _22232 = _19833_22179.e1;
        #line 31 "gpu_device.impala"
        double* _22259;
        union { double* dst; char* src; } u_22259;
        u_22259.src = _22258;
        _22259 = u_22259.dst;
        #line 3 "gaussian.impala"
        int anchor_22234;
        anchor_22234 = _22232 / 2;
        #line 26 "gpu_device.impala"
        double* _22272;
        union { double* dst; char* src; } u_22272;
        u_22272.src = _22271;
        _22272 = u_22272.dst;
        #line 31 "gpu_device.impala"
        int _22273;
        _22273 = _22260 + gid_x_22220;
        #line 10 "gaussian.impala"
        bool _22235;
        _22235 = anchor_22234 <= gid_x_22220;
        #line 26 "gpu_device.impala"
        double* _22274;
        _22274 = _22272 + _22273;
        #line 10 "gaussian.impala"
        if (_22235) goto l22236; else goto l22286;
    l22286: ;
        #line 16 "gaussian.impala"
        goto l22280;
    l22236: ;
        #line 10 "gaussian.impala"
        int _22237;
        _22237 = _22222 - anchor_22234;
        #line 10 "gaussian.impala"
        bool _22238;
        _22238 = gid_x_22220 < _22237;
        #line 10 "gaussian.impala"
        if (_22238) goto l22239; else goto l22279;
    l22279: ;
        #line 16 "gaussian.impala"
        goto l22280;
    l22280: ;
        #line 31 "gpu_device.impala"
        double* _22281;
        _22281 = _22259 + _22273;
        #line 31 "gpu_device.impala"
        double _22282;
        _22282 = *_22281;
        #line 31 "gpu_device.impala"
        double _22284;
        _22284 = _22282;
        #line 26 "gpu_device.impala"
        *_22274 = _22284;
        return ;
    l22239: ;
        #line 11 "gaussian.impala"
        int _22245;
        _22245 = 1 + anchor_22234;
        #line 36 "gpu_device.impala"
        struct_Buffer_5307 _22250;
        _22250 = _19833_22179.e0;
        #line 11 "gaussian.impala"
        int _22277;
        _22277 = 0 - anchor_22234;
        #line 36 "gpu_device.impala"
        char* _22251;
        _22251 = _22250.e1;
        #line 36 "gpu_device.impala"
        double* _22252;
        union { double* dst; char* src; } u_22252;
        u_22252.src = _22251;
        _22252 = u_22252.dst;
        #line 14 "gpu_device.impala"
        p_22241 = _22277;
        psum_22243 = 0.000000e+00;
        goto l22240;
    l22240: ;
        _22241 = p_22241;
        sum_22243 = psum_22243;
        #line 14 "gpu_device.impala"
        bool _22246;
        _22246 = _22241 < _22245;
        #line 14 "gpu_device.impala"
        if (_22246) goto l22247; else goto l22270;
    l22270: ;
        #line 26 "gpu_device.impala"
        *_22274 = sum_22243;
        return ;
    l22247: ;
        #line 12 "gaussian.impala"
        int _22253;
        _22253 = _22241 + anchor_22234;
        #line 35 "gpu_device.impala"
        double* i_22254;
        i_22254 = _22252 + _22253;
        #line 36 "gpu_device.impala"
        double _22255;
        _22255 = *i_22254;
        #line 12 "gaussian.impala"
        int _22261;
        _22261 = gid_x_22220 + _22241;
        #line 36 "gpu_device.impala"
        double _22266;
        _22266 = _22255;
        #line 16 "gpu_device.impala"
        int _22248;
        _22248 = 1 + _22241;
        #line 31 "gpu_device.impala"
        int _22262;
        _22262 = _22260 + _22261;
        #line 31 "gpu_device.impala"
        double* _22263;
        _22263 = _22259 + _22262;
        #line 31 "gpu_device.impala"
        double _22264;
        _22264 = *_22263;
        #line 31 "gpu_device.impala"
        double _22267;
        _22267 = _22264;
        #line 12 "gaussian.impala"
        double _22268;
        _22268 = _22266 * _22267;
        #line 12 "gaussian.impala"
        double _22269;
        _22269 = sum_22243 + _22268;
        #line 14 "gpu_device.impala"
        p_22241 = _22248;
        psum_22243 = _22269;
        goto l22240;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_19967(struct_Buffer_5307 _19970_22293, double* _19971_22294, struct_image_5312 _19972_22295, struct_filter_5306 _19973_22296) {
    int  _22299;
    int p_22299;
    int  _22302;
    int p_22302;
    int  _22305;
    int p_22305;
    int  _22308;
    int p_22308;
    int  _22311;
    int p_22311;
    int  _22314;
    int p_22314;
    int  _22333;
    int p_22333;
    double  sum_22335;
    double psum_22335;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _22299 = blockIdx_x();
    p_22299 = _22299;
    l22297: ;
        _22299 = p_22299;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22302 = blockDim_x();
        p_22302 = _22302;
    l22300: ;
        _22302 = p_22302;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22305 = threadIdx_x();
        p_22305 = _22305;
    l22303: ;
        _22305 = p_22305;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22308 = blockIdx_y();
        p_22308 = _22308;
    l22306: ;
        _22308 = p_22308;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22311 = blockDim_y();
        p_22311 = _22311;
    l22309: ;
        _22311 = p_22311;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22314 = threadIdx_y();
        p_22314 = _22314;
    l22312: ;
        _22314 = p_22314;
        #line 66 "gpu_device.impala"
        int _22315;
        _22315 = _22299 * _22302;
        #line 6 "main.impala"
        int _22317;
        _22317 = _19972_22295.e2;
        #line 66 "gpu_device.impala"
        int gid_x_22316;
        gid_x_22316 = _22315 + _22305;
        #line 69 "gpu_device.impala"
        bool _22318;
        _22318 = gid_x_22316 < _22317;
        #line 69 "gpu_device.impala"
        if (_22318) goto l22319; else goto l22378;
    l22378: ;
        #line 71 "gpu_device.impala"
        goto l22377;
    l22319: ;
        #line 6 "main.impala"
        int _22322;
        _22322 = _19972_22295.e3;
        #line 67 "gpu_device.impala"
        int _22320;
        _22320 = _22308 * _22311;
        #line 67 "gpu_device.impala"
        int gid_y_22321;
        gid_y_22321 = _22320 + _22314;
        #line 69 "gpu_device.impala"
        bool _22323;
        _22323 = gid_y_22321 < _22322;
        #line 69 "gpu_device.impala"
        if (_22323) goto l22324; else goto l22376;
    l22376: ;
        #line 71 "gpu_device.impala"
        goto l22377;
    l22377: ;
        return ;
    l22324: ;
        #line 31 "gpu_device.impala"
        struct_Buffer_5307 _22347;
        _22347 = _19972_22295.e1;
        #line 26 "gpu_device.impala"
        char* _22361;
        _22361 = _19970_22293.e1;
        #line 31 "gpu_device.impala"
        char* _22348;
        _22348 = _22347.e1;
        #line 24 "gaussian.impala"
        int _22325;
        _22325 = _19973_22296.e1;
        #line 31 "gpu_device.impala"
        double* _22349;
        union { double* dst; char* src; } u_22349;
        u_22349.src = _22348;
        _22349 = u_22349.dst;
        #line 31 "gpu_device.impala"
        int _22363;
        _22363 = gid_y_22321 * _22317;
        #line 26 "gpu_device.impala"
        double* _22362;
        union { double* dst; char* src; } u_22362;
        u_22362.src = _22361;
        _22362 = u_22362.dst;
        #line 24 "gaussian.impala"
        int anchor_22326;
        anchor_22326 = _22325 / 2;
        #line 31 "gpu_device.impala"
        int _22364;
        _22364 = _22363 + gid_x_22316;
        #line 26 "gpu_device.impala"
        double* _22365;
        _22365 = _22362 + _22364;
        #line 31 "gaussian.impala"
        bool _22327;
        _22327 = anchor_22326 <= gid_y_22321;
        #line 31 "gaussian.impala"
        if (_22327) goto l22328; else goto l22375;
    l22375: ;
        #line 37 "gaussian.impala"
        goto l22369;
    l22328: ;
        #line 31 "gaussian.impala"
        int _22329;
        _22329 = _22322 - anchor_22326;
        #line 31 "gaussian.impala"
        bool _22330;
        _22330 = gid_y_22321 < _22329;
        #line 31 "gaussian.impala"
        if (_22330) goto l22331; else goto l22368;
    l22368: ;
        #line 37 "gaussian.impala"
        goto l22369;
    l22369: ;
        #line 31 "gpu_device.impala"
        double* _22370;
        _22370 = _22349 + _22364;
        #line 31 "gpu_device.impala"
        double _22371;
        _22371 = *_22370;
        #line 31 "gpu_device.impala"
        double _22373;
        _22373 = _22371;
        #line 26 "gpu_device.impala"
        *_22365 = _22373;
        return ;
    l22331: ;
        #line 36 "gpu_device.impala"
        struct_Buffer_5307 _22340;
        _22340 = _19973_22296.e0;
        #line 32 "gaussian.impala"
        int _22367;
        _22367 = 0 - anchor_22326;
        #line 32 "gaussian.impala"
        int _22336;
        _22336 = 1 + anchor_22326;
        #line 36 "gpu_device.impala"
        char* _22341;
        _22341 = _22340.e1;
        #line 36 "gpu_device.impala"
        double* _22342;
        union { double* dst; char* src; } u_22342;
        u_22342.src = _22341;
        _22342 = u_22342.dst;
        #line 14 "gpu_device.impala"
        p_22333 = _22367;
        psum_22335 = 0.000000e+00;
        goto l22332;
    l22332: ;
        _22333 = p_22333;
        sum_22335 = psum_22335;
        #line 14 "gpu_device.impala"
        bool _22337;
        _22337 = _22333 < _22336;
        #line 14 "gpu_device.impala"
        if (_22337) goto l22338; else goto l22360;
    l22360: ;
        #line 26 "gpu_device.impala"
        *_22365 = sum_22335;
        return ;
    l22338: ;
        #line 33 "gaussian.impala"
        int _22350;
        _22350 = gid_y_22321 + _22333;
        #line 16 "gpu_device.impala"
        int _22339;
        _22339 = 1 + _22333;
        #line 31 "gpu_device.impala"
        int _22351;
        _22351 = _22350 * _22317;
        #line 33 "gaussian.impala"
        int _22343;
        _22343 = _22333 + anchor_22326;
        #line 31 "gpu_device.impala"
        int _22352;
        _22352 = _22351 + gid_x_22316;
        #line 35 "gpu_device.impala"
        double* i_22344;
        i_22344 = _22342 + _22343;
        #line 31 "gpu_device.impala"
        double* _22353;
        _22353 = _22349 + _22352;
        #line 36 "gpu_device.impala"
        double _22345;
        _22345 = *i_22344;
        #line 36 "gpu_device.impala"
        double _22356;
        _22356 = _22345;
        #line 31 "gpu_device.impala"
        double _22354;
        _22354 = *_22353;
        #line 31 "gpu_device.impala"
        double _22357;
        _22357 = _22354;
        #line 33 "gaussian.impala"
        double _22358;
        _22358 = _22356 * _22357;
        #line 33 "gaussian.impala"
        double _22359;
        _22359 = sum_22335 + _22358;
        #line 14 "gpu_device.impala"
        p_22333 = _22339;
        psum_22335 = _22359;
        goto l22332;
}

}