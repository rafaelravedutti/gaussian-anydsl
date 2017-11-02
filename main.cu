extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_6327;
typedef struct {
    struct_Buffer_6327 e0;
    struct_Buffer_6327 e1;
    int e2;
    int e3;
} struct_image_6326;
typedef struct {
    struct_Buffer_6327 e0;
    int e1;
    int e2;
} struct_filter_6332;

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
__global__ void lambda_25292(struct_image_6326, struct_Buffer_6327, double*, struct_filter_6332);
__global__ void lambda_25546(struct_image_6326, struct_filter_6332, double*, double*, struct_Buffer_6327);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_25292(struct_image_6326 _25295_30003, struct_Buffer_6327 _25296_30004, double* _25297_30005, struct_filter_6332 _25298_30006) {
    int  bdimx_30012;
    int pbdimx_30012;
    int  bdimy_30018;
    int pbdimy_30018;
    int  bidx_30024;
    int pbidx_30024;
    int  bidy_30030;
    int pbidy_30030;
    int  tidx_30036;
    int ptidx_30036;
    int  tidy_30042;
    int ptidy_30042;
    double*  reserve_shared_30050;
    double* preserve_shared_30050;
    int  _30061;
    int p_30061;
    int  _30117;
    int p_30117;
    int  _30183;
    int p_30183;
    double  sum_30185;
    double psum_30185;
    int  _30122;
    int p_30122;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    bdimx_30012 = blockDim_x();
    pbdimx_30012 = bdimx_30012;
    l30010: ;
        bdimx_30012 = pbdimx_30012;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bdimy_30018 = blockDim_y();
        pbdimy_30018 = bdimy_30018;
    l30016: ;
        bdimy_30018 = pbdimy_30018;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidx_30024 = blockIdx_x();
        pbidx_30024 = bidx_30024;
    l30022: ;
        bidx_30024 = pbidx_30024;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidy_30030 = blockIdx_y();
        pbidy_30030 = bidy_30030;
    l30028: ;
        bidy_30030 = pbidy_30030;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidx_30036 = threadIdx_x();
        ptidx_30036 = tidx_30036;
    l30034: ;
        tidx_30036 = ptidx_30036;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidy_30042 = threadIdx_y();
        ptidy_30042 = tidy_30042;
    l30040: ;
        tidy_30042 = ptidy_30042;
        #line 201 "gpu_device_shm.impala"
        __shared__ double reserver_reserve_shared_30050[938];
        preserve_shared_30050 = reserver_reserve_shared_30050;
    l30048: ;
        reserve_shared_30050 = preserve_shared_30050;
        #line 193 "gpu_device_shm.impala"
        int _30054;
        _30054 = _25298_30006.e2;
        #line 189 "gpu_device_shm.impala"
        int _30084;
        _30084 = bidy_30030 * bdimy_30018;
        #line 11 "main.impala"
        int _30081;
        _30081 = _25295_30003.e2;
        #line 187 "gpu_device_shm.impala"
        int _30075;
        _30075 = bidx_30024 * bdimx_30012;
        #line 11 "main.impala"
        int _30090;
        _30090 = _25295_30003.e3;
        #line 4 "gaussian.impala"
        int _30064;
        _30064 = _25298_30006.e1;
        #line 193 "gpu_device_shm.impala"
        int extend_height_30055;
        extend_height_30055 = _30054 / 2;
        #line 189 "gpu_device_shm.impala"
        int gid_y_30085;
        gid_y_30085 = _30084 + tidy_30042;
        #line 187 "gpu_device_shm.impala"
        int gid_x_30076;
        gid_x_30076 = _30075 + tidx_30036;
        #line 4 "gaussian.impala"
        int h_anchor_30065;
        h_anchor_30065 = _30064 / 2;
        #line 197 "gpu_device_shm.impala"
        int _30056;
        _30056 = 2 * extend_height_30055;
        #line 195 "gpu_device_shm.impala"
        int _30066;
        _30066 = 2 * h_anchor_30065;
        #line 197 "gpu_device_shm.impala"
        int shm_dimy_30057;
        shm_dimy_30057 = bdimy_30018 + _30056;
        #line 195 "gpu_device_shm.impala"
        int shm_dimx_30067;
        shm_dimx_30067 = bdimx_30012 + _30066;
        #line 38 "gpu_device_shm.impala"
        bool _30058;
        _30058 = 0 < shm_dimy_30057;
        #line 38 "gpu_device_shm.impala"
        if (_30058) goto l30059; else goto l30234;
    l30234: ;
        #line 231 "gpu_device_shm.impala"
        goto l30166;
    l30059: ;
        #line 226 "gpu_device_shm.impala"
        int _30102;
        _30102 = tidy_30042 * shm_dimx_30067;
        #line 221 "gpu_device_shm.impala"
        int _30086;
        _30086 = gid_y_30085 - extend_height_30055;
        #line 219 "gpu_device_shm.impala"
        int _30077;
        _30077 = gid_x_30076 - h_anchor_30065;
        #line 217 "gpu_device_shm.impala"
        bool _30073;
        _30073 = tidy_30042 < shm_dimy_30057;
        #line 224 "gpu_device_shm.impala"
        bool _30087;
        _30087 = 0 <= _30086;
        #line 224 "gpu_device_shm.impala"
        bool _30091;
        _30091 = _30086 < _30090;
        #line 227 "gpu_device_shm.impala"
        int _30096;
        _30096 = _30086 * _30081;
        #line 38 "gpu_device_shm.impala"
        p_30061 = 0;
        goto l30060;
    l30060: ;
        _30061 = p_30061;
        #line 38 "gpu_device_shm.impala"
        bool _30068;
        _30068 = _30061 < shm_dimx_30067;
        #line 38 "gpu_device_shm.impala"
        if (_30068) goto l30069; else goto l30115;
    l30115: ;
        #line 38 "gpu_device_shm.impala"
        p_30117 = bdimy_30018;
        goto l30116;
    l30116: ;
        _30117 = p_30117;
        #line 38 "gpu_device_shm.impala"
        bool _30119;
        _30119 = _30117 < shm_dimy_30057;
        #line 38 "gpu_device_shm.impala"
        if (_30119) goto l30120; else goto l30165;
    l30165: ;
        #line 231 "gpu_device_shm.impala"
        goto l30166;
    l30166: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        __syncthreads();
    l30171: ;
        #line 237 "gpu_device_shm.impala"
        bool _30173;
        _30173 = gid_x_30076 < _30081;
        #line 237 "gpu_device_shm.impala"
        if (_30173) goto l30174; else goto l30233;
    l30233: ;
        #line 240 "gpu_device_shm.impala"
        goto l30232;
    l30174: ;
        #line 237 "gpu_device_shm.impala"
        bool _30175;
        _30175 = gid_y_30085 < _30090;
        #line 237 "gpu_device_shm.impala"
        if (_30175) goto l30176; else goto l30231;
    l30231: ;
        #line 240 "gpu_device_shm.impala"
        goto l30232;
    l30232: ;
        return ;
    l30176: ;
        #line 64 "gpu_device_shm.impala"
        char* _30213;
        _30213 = _25296_30004.e1;
        #line 204 "gpu_device_shm.impala"
        int _30198;
        _30198 = extend_height_30055 - _30084;
        #line 64 "gpu_device_shm.impala"
        double* _30214;
        union { double* dst; char* src; } u_30214;
        u_30214.src = _30213;
        _30214 = u_30214.dst;
        #line 203 "gpu_device_shm.impala"
        int _30203;
        _30203 = h_anchor_30065 - _30075;
        #line 64 "gpu_device_shm.impala"
        int _30215;
        _30215 = gid_y_30085 * _30081;
        #line 17 "gaussian.impala"
        bool _30177;
        _30177 = h_anchor_30065 <= gid_x_30076;
        #line 64 "gpu_device_shm.impala"
        int _30216;
        _30216 = _30215 + gid_x_30076;
        #line 72 "gpu_device_shm.impala"
        int _30199;
        _30199 = gid_y_30085 + _30198;
        #line 64 "gpu_device_shm.impala"
        double* _30217;
        _30217 = _30214 + _30216;
        #line 72 "gpu_device_shm.impala"
        int _30200;
        _30200 = _30199 * shm_dimx_30067;
        #line 17 "gaussian.impala"
        if (_30177) goto l30178; else goto l30230;
    l30230: ;
        #line 27 "gaussian.impala"
        goto l30222;
    l30178: ;
        #line 17 "gaussian.impala"
        int _30179;
        _30179 = _30081 - h_anchor_30065;
        #line 17 "gaussian.impala"
        bool _30180;
        _30180 = gid_x_30076 < _30179;
        #line 17 "gaussian.impala"
        if (_30180) goto l30181; else goto l30221;
    l30221: ;
        #line 27 "gaussian.impala"
        goto l30222;
    l30222: ;
        #line 72 "gpu_device_shm.impala"
        int _30223;
        _30223 = _30200 + gid_x_30076;
        #line 72 "gpu_device_shm.impala"
        int _30224;
        _30224 = _30223 + _30203;
        #line 72 "gpu_device_shm.impala"
        double* _30225;
        _30225 = reserve_shared_30050 + _30224;
        #line 72 "gpu_device_shm.impala"
        double _30226;
        _30226 = *_30225;
        #line 72 "gpu_device_shm.impala"
        double _30228;
        _30228 = _30226;
        #line 64 "gpu_device_shm.impala"
        *_30217 = _30228;
        return ;
    l30181: ;
        #line 77 "gpu_device_shm.impala"
        struct_Buffer_6327 _30191;
        _30191 = _25298_30006.e0;
        #line 19 "gaussian.impala"
        int _30219;
        _30219 = 0 - h_anchor_30065;
        #line 77 "gpu_device_shm.impala"
        char* _30192;
        _30192 = _30191.e1;
        #line 19 "gaussian.impala"
        int _30187;
        _30187 = 1 + h_anchor_30065;
        #line 77 "gpu_device_shm.impala"
        double* _30193;
        union { double* dst; char* src; } u_30193;
        u_30193.src = _30192;
        _30193 = u_30193.dst;
        #line 27 "gpu_device_shm.impala"
        p_30183 = _30219;
        psum_30185 = 0.000000e+00;
        goto l30182;
    l30182: ;
        _30183 = p_30183;
        sum_30185 = psum_30185;
        #line 27 "gpu_device_shm.impala"
        bool _30188;
        _30188 = _30183 < _30187;
        #line 27 "gpu_device_shm.impala"
        if (_30188) goto l30189; else goto l30212;
    l30212: ;
        #line 64 "gpu_device_shm.impala"
        *_30217 = sum_30185;
        return ;
    l30189: ;
        #line 31 "gpu_device_shm.impala"
        int _30190;
        _30190 = 1 + _30183;
        #line 21 "gaussian.impala"
        int _30201;
        _30201 = gid_x_30076 + _30183;
        #line 72 "gpu_device_shm.impala"
        int _30202;
        _30202 = _30200 + _30201;
        #line 21 "gaussian.impala"
        int _30194;
        _30194 = _30183 + h_anchor_30065;
        #line 72 "gpu_device_shm.impala"
        int _30204;
        _30204 = _30202 + _30203;
        #line 76 "gpu_device_shm.impala"
        double* i_30195;
        i_30195 = _30193 + _30194;
        #line 72 "gpu_device_shm.impala"
        double* _30205;
        _30205 = reserve_shared_30050 + _30204;
        #line 77 "gpu_device_shm.impala"
        double _30196;
        _30196 = *i_30195;
        #line 77 "gpu_device_shm.impala"
        double _30208;
        _30208 = _30196;
        #line 72 "gpu_device_shm.impala"
        double _30206;
        _30206 = *_30205;
        #line 72 "gpu_device_shm.impala"
        double _30209;
        _30209 = _30206;
        #line 21 "gaussian.impala"
        double _30210;
        _30210 = _30208 * _30209;
        #line 21 "gaussian.impala"
        double _30211;
        _30211 = sum_30185 + _30210;
        #line 27 "gpu_device_shm.impala"
        p_30183 = _30190;
        psum_30185 = _30211;
        goto l30182;
    l30120: ;
        #line 221 "gpu_device_shm.impala"
        int img_index_y_30137;
        img_index_y_30137 = _30086 + _30117;
        #line 214 "gpu_device_shm.impala"
        int shm_index_y_30129;
        shm_index_y_30129 = tidy_30042 + _30117;
        #line 224 "gpu_device_shm.impala"
        bool _30138;
        _30138 = 0 <= img_index_y_30137;
        #line 227 "gpu_device_shm.impala"
        int _30145;
        _30145 = img_index_y_30137 * _30081;
        #line 224 "gpu_device_shm.impala"
        bool _30140;
        _30140 = img_index_y_30137 < _30090;
        #line 217 "gpu_device_shm.impala"
        bool _30130;
        _30130 = shm_index_y_30129 < shm_dimy_30057;
        #line 226 "gpu_device_shm.impala"
        int _30150;
        _30150 = shm_index_y_30129 * shm_dimx_30067;
        #line 38 "gpu_device_shm.impala"
        p_30122 = 0;
        goto l30121;
    l30121: ;
        _30122 = p_30122;
        #line 38 "gpu_device_shm.impala"
        bool _30124;
        _30124 = _30122 < shm_dimx_30067;
        #line 38 "gpu_device_shm.impala"
        if (_30124) goto l30125; else goto l30163;
    l30163: ;
        #line 42 "gpu_device_shm.impala"
        int _30164;
        _30164 = _30117 + bdimy_30018;
        #line 38 "gpu_device_shm.impala"
        p_30117 = _30164;
        goto l30116;
    l30125: ;
        #line 212 "gpu_device_shm.impala"
        int shm_index_x_30126;
        shm_index_x_30126 = tidx_30036 + _30122;
        #line 217 "gpu_device_shm.impala"
        bool _30127;
        _30127 = shm_index_x_30126 < shm_dimx_30067;
        #line 217 "gpu_device_shm.impala"
        if (_30127) goto l30128; else goto l30162;
    l30162: ;
        #line 229 "gpu_device_shm.impala"
        goto l30161;
    l30128: ;
        #line 217 "gpu_device_shm.impala"
        if (_30130) goto l30131; else goto l30160;
    l30160: ;
        #line 229 "gpu_device_shm.impala"
        goto l30161;
    l30161: ;
        #line 40 "gpu_device_shm.impala"
        goto l30142;
    l30131: ;
        #line 219 "gpu_device_shm.impala"
        int img_index_x_30132;
        img_index_x_30132 = _30077 + _30122;
        #line 224 "gpu_device_shm.impala"
        bool _30133;
        _30133 = 0 <= img_index_x_30132;
        #line 224 "gpu_device_shm.impala"
        if (_30133) goto l30134; else goto l30159;
    l30159: ;
        #line 228 "gpu_device_shm.impala"
        goto l30156;
    l30134: ;
        #line 224 "gpu_device_shm.impala"
        bool _30135;
        _30135 = img_index_x_30132 < _30081;
        #line 224 "gpu_device_shm.impala"
        if (_30135) goto l30136; else goto l30158;
    l30158: ;
        #line 228 "gpu_device_shm.impala"
        goto l30156;
    l30136: ;
        #line 224 "gpu_device_shm.impala"
        if (_30138) goto l30139; else goto l30157;
    l30157: ;
        #line 228 "gpu_device_shm.impala"
        goto l30156;
    l30139: ;
        #line 224 "gpu_device_shm.impala"
        if (_30140) goto l30141; else goto l30155;
    l30155: ;
        #line 228 "gpu_device_shm.impala"
        goto l30156;
    l30156: ;
        #line 40 "gpu_device_shm.impala"
        goto l30142;
    l30141: ;
        #line 226 "gpu_device_shm.impala"
        int _30151;
        _30151 = _30150 + shm_index_x_30126;
        #line 226 "gpu_device_shm.impala"
        double* _30152;
        _30152 = reserve_shared_30050 + _30151;
        #line 227 "gpu_device_shm.impala"
        int _30146;
        _30146 = _30145 + img_index_x_30132;
        #line 227 "gpu_device_shm.impala"
        double* _30147;
        _30147 = _25297_30005 + _30146;
        #line 227 "gpu_device_shm.impala"
        double _30148;
        _30148 = *_30147;
        #line 227 "gpu_device_shm.impala"
        double _30153;
        _30153 = _30148;
        #line 226 "gpu_device_shm.impala"
        *_30152 = _30153;
        #line 40 "gpu_device_shm.impala"
        goto l30142;
    l30142: ;
        #line 42 "gpu_device_shm.impala"
        int _30144;
        _30144 = _30122 + bdimx_30012;
        #line 38 "gpu_device_shm.impala"
        p_30122 = _30144;
        goto l30121;
    l30069: ;
        #line 212 "gpu_device_shm.impala"
        int shm_index_x_30070;
        shm_index_x_30070 = tidx_30036 + _30061;
        #line 217 "gpu_device_shm.impala"
        bool _30071;
        _30071 = shm_index_x_30070 < shm_dimx_30067;
        #line 217 "gpu_device_shm.impala"
        if (_30071) goto l30072; else goto l30114;
    l30114: ;
        #line 229 "gpu_device_shm.impala"
        goto l30113;
    l30072: ;
        #line 217 "gpu_device_shm.impala"
        if (_30073) goto l30074; else goto l30112;
    l30112: ;
        #line 229 "gpu_device_shm.impala"
        goto l30113;
    l30113: ;
        #line 40 "gpu_device_shm.impala"
        goto l30093;
    l30074: ;
        #line 219 "gpu_device_shm.impala"
        int img_index_x_30078;
        img_index_x_30078 = _30077 + _30061;
        #line 224 "gpu_device_shm.impala"
        bool _30079;
        _30079 = 0 <= img_index_x_30078;
        #line 224 "gpu_device_shm.impala"
        if (_30079) goto l30080; else goto l30111;
    l30111: ;
        #line 228 "gpu_device_shm.impala"
        goto l30108;
    l30080: ;
        #line 224 "gpu_device_shm.impala"
        bool _30082;
        _30082 = img_index_x_30078 < _30081;
        #line 224 "gpu_device_shm.impala"
        if (_30082) goto l30083; else goto l30110;
    l30110: ;
        #line 228 "gpu_device_shm.impala"
        goto l30108;
    l30083: ;
        #line 224 "gpu_device_shm.impala"
        if (_30087) goto l30088; else goto l30109;
    l30109: ;
        #line 228 "gpu_device_shm.impala"
        goto l30108;
    l30088: ;
        #line 224 "gpu_device_shm.impala"
        if (_30091) goto l30092; else goto l30107;
    l30107: ;
        #line 228 "gpu_device_shm.impala"
        goto l30108;
    l30108: ;
        #line 40 "gpu_device_shm.impala"
        goto l30093;
    l30092: ;
        #line 226 "gpu_device_shm.impala"
        int _30103;
        _30103 = _30102 + shm_index_x_30070;
        #line 226 "gpu_device_shm.impala"
        double* _30104;
        _30104 = reserve_shared_30050 + _30103;
        #line 227 "gpu_device_shm.impala"
        int _30097;
        _30097 = _30096 + img_index_x_30078;
        #line 227 "gpu_device_shm.impala"
        double* _30098;
        _30098 = _25297_30005 + _30097;
        #line 227 "gpu_device_shm.impala"
        double _30099;
        _30099 = *_30098;
        #line 227 "gpu_device_shm.impala"
        double _30105;
        _30105 = _30099;
        #line 226 "gpu_device_shm.impala"
        *_30104 = _30105;
        #line 40 "gpu_device_shm.impala"
        goto l30093;
    l30093: ;
        #line 42 "gpu_device_shm.impala"
        int _30095;
        _30095 = _30061 + bdimx_30012;
        #line 38 "gpu_device_shm.impala"
        p_30061 = _30095;
        goto l30060;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_25546(struct_image_6326 _25549_30238, struct_filter_6332 _25550_30239, double* _25551_30240, double* _25552_30241, struct_Buffer_6327 _25553_30242) {
    int  bdimx_30245;
    int pbdimx_30245;
    int  bdimy_30248;
    int pbdimy_30248;
    int  bidx_30251;
    int pbidx_30251;
    int  bidy_30254;
    int pbidy_30254;
    int  tidx_30257;
    int ptidx_30257;
    int  tidy_30260;
    int ptidy_30260;
    double*  reserve_shared_30263;
    double* preserve_shared_30263;
    int  _30271;
    int p_30271;
    int  _30324;
    int p_30324;
    int  _30387;
    int p_30387;
    double  sum_30389;
    double psum_30389;
    int  _30329;
    int p_30329;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    bdimx_30245 = blockDim_x();
    pbdimx_30245 = bdimx_30245;
    l30243: ;
        bdimx_30245 = pbdimx_30245;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bdimy_30248 = blockDim_y();
        pbdimy_30248 = bdimy_30248;
    l30246: ;
        bdimy_30248 = pbdimy_30248;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidx_30251 = blockIdx_x();
        pbidx_30251 = bidx_30251;
    l30249: ;
        bidx_30251 = pbidx_30251;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidy_30254 = blockIdx_y();
        pbidy_30254 = bidy_30254;
    l30252: ;
        bidy_30254 = pbidy_30254;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidx_30257 = threadIdx_x();
        ptidx_30257 = tidx_30257;
    l30255: ;
        tidx_30257 = ptidx_30257;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidy_30260 = threadIdx_y();
        ptidy_30260 = tidy_30260;
    l30258: ;
        tidy_30260 = ptidy_30260;
        #line 201 "gpu_device_shm.impala"
        __shared__ double reserver_reserve_shared_30263[938];
        preserve_shared_30263 = reserver_reserve_shared_30263;
    l30261: ;
        reserve_shared_30263 = preserve_shared_30263;
        #line 187 "gpu_device_shm.impala"
        int _30284;
        _30284 = bidx_30251 * bdimx_30245;
        #line 11 "main.impala"
        int _30298;
        _30298 = _25549_30238.e3;
        #line 187 "gpu_device_shm.impala"
        int gid_x_30285;
        gid_x_30285 = _30284 + tidx_30257;
        #line 6 "gaussian.impala"
        int _30264;
        _30264 = _25550_30239.e2;
        #line 191 "gpu_device_shm.impala"
        int _30273;
        _30273 = _25550_30239.e1;
        #line 189 "gpu_device_shm.impala"
        int _30293;
        _30293 = bidy_30254 * bdimy_30248;
        #line 11 "main.impala"
        int _30290;
        _30290 = _25549_30238.e2;
        #line 189 "gpu_device_shm.impala"
        int gid_y_30294;
        gid_y_30294 = _30293 + tidy_30260;
        #line 191 "gpu_device_shm.impala"
        int extend_width_30274;
        extend_width_30274 = _30273 / 2;
        #line 6 "gaussian.impala"
        int v_anchor_30265;
        v_anchor_30265 = _30264 / 2;
        #line 195 "gpu_device_shm.impala"
        int _30275;
        _30275 = 2 * extend_width_30274;
        #line 197 "gpu_device_shm.impala"
        int _30266;
        _30266 = 2 * v_anchor_30265;
        #line 195 "gpu_device_shm.impala"
        int shm_dimx_30276;
        shm_dimx_30276 = bdimx_30245 + _30275;
        #line 197 "gpu_device_shm.impala"
        int shm_dimy_30267;
        shm_dimy_30267 = bdimy_30248 + _30266;
        #line 38 "gpu_device_shm.impala"
        bool _30268;
        _30268 = 0 < shm_dimy_30267;
        #line 38 "gpu_device_shm.impala"
        if (_30268) goto l30269; else goto l30438;
    l30438: ;
        #line 231 "gpu_device_shm.impala"
        goto l30373;
    l30269: ;
        #line 226 "gpu_device_shm.impala"
        int _30309;
        _30309 = tidy_30260 * shm_dimx_30276;
        #line 219 "gpu_device_shm.impala"
        int _30286;
        _30286 = gid_x_30285 - extend_width_30274;
        #line 221 "gpu_device_shm.impala"
        int _30295;
        _30295 = gid_y_30294 - v_anchor_30265;
        #line 217 "gpu_device_shm.impala"
        bool _30282;
        _30282 = tidy_30260 < shm_dimy_30267;
        #line 224 "gpu_device_shm.impala"
        bool _30296;
        _30296 = 0 <= _30295;
        #line 224 "gpu_device_shm.impala"
        bool _30299;
        _30299 = _30295 < _30298;
        #line 227 "gpu_device_shm.impala"
        int _30304;
        _30304 = _30295 * _30290;
        #line 38 "gpu_device_shm.impala"
        p_30271 = 0;
        goto l30270;
    l30270: ;
        _30271 = p_30271;
        #line 38 "gpu_device_shm.impala"
        bool _30277;
        _30277 = _30271 < shm_dimx_30276;
        #line 38 "gpu_device_shm.impala"
        if (_30277) goto l30278; else goto l30322;
    l30322: ;
        #line 38 "gpu_device_shm.impala"
        p_30324 = bdimy_30248;
        goto l30323;
    l30323: ;
        _30324 = p_30324;
        #line 38 "gpu_device_shm.impala"
        bool _30326;
        _30326 = _30324 < shm_dimy_30267;
        #line 38 "gpu_device_shm.impala"
        if (_30326) goto l30327; else goto l30372;
    l30372: ;
        #line 231 "gpu_device_shm.impala"
        goto l30373;
    l30373: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        __syncthreads();
    l30375: ;
        #line 237 "gpu_device_shm.impala"
        bool _30377;
        _30377 = gid_x_30285 < _30290;
        #line 237 "gpu_device_shm.impala"
        if (_30377) goto l30378; else goto l30437;
    l30437: ;
        #line 240 "gpu_device_shm.impala"
        goto l30436;
    l30378: ;
        #line 237 "gpu_device_shm.impala"
        bool _30379;
        _30379 = gid_y_30294 < _30298;
        #line 237 "gpu_device_shm.impala"
        if (_30379) goto l30380; else goto l30435;
    l30435: ;
        #line 240 "gpu_device_shm.impala"
        goto l30436;
    l30436: ;
        return ;
    l30380: ;
        #line 204 "gpu_device_shm.impala"
        int _30402;
        _30402 = v_anchor_30265 - _30293;
        #line 64 "gpu_device_shm.impala"
        char* _30416;
        _30416 = _25553_30242.e1;
        #line 203 "gpu_device_shm.impala"
        int _30406;
        _30406 = extend_width_30274 - _30284;
        #line 64 "gpu_device_shm.impala"
        int _30418;
        _30418 = gid_y_30294 * _30290;
        #line 64 "gpu_device_shm.impala"
        int _30419;
        _30419 = _30418 + gid_x_30285;
        #line 64 "gpu_device_shm.impala"
        double* _30417;
        union { double* dst; char* src; } u_30417;
        u_30417.src = _30416;
        _30417 = u_30417.dst;
        #line 39 "gaussian.impala"
        bool _30381;
        _30381 = v_anchor_30265 <= gid_y_30294;
        #line 64 "gpu_device_shm.impala"
        double* _30420;
        _30420 = _30417 + _30419;
        #line 39 "gaussian.impala"
        if (_30381) goto l30382; else goto l30434;
    l30434: ;
        #line 49 "gaussian.impala"
        goto l30424;
    l30382: ;
        #line 39 "gaussian.impala"
        int _30383;
        _30383 = _30298 - v_anchor_30265;
        #line 39 "gaussian.impala"
        bool _30384;
        _30384 = gid_y_30294 < _30383;
        #line 39 "gaussian.impala"
        if (_30384) goto l30385; else goto l30423;
    l30423: ;
        #line 49 "gaussian.impala"
        goto l30424;
    l30424: ;
        #line 72 "gpu_device_shm.impala"
        int _30425;
        _30425 = gid_y_30294 + _30402;
        #line 72 "gpu_device_shm.impala"
        int _30426;
        _30426 = _30425 * shm_dimx_30276;
        #line 72 "gpu_device_shm.impala"
        int _30427;
        _30427 = _30426 + gid_x_30285;
        #line 72 "gpu_device_shm.impala"
        int _30428;
        _30428 = _30427 + _30406;
        #line 72 "gpu_device_shm.impala"
        double* _30429;
        _30429 = reserve_shared_30263 + _30428;
        #line 72 "gpu_device_shm.impala"
        double _30430;
        _30430 = *_30429;
        #line 72 "gpu_device_shm.impala"
        double _30432;
        _30432 = _30430;
        #line 64 "gpu_device_shm.impala"
        *_30420 = _30432;
        return ;
    l30385: ;
        #line 41 "gaussian.impala"
        int _30422;
        _30422 = 0 - v_anchor_30265;
        #line 77 "gpu_device_shm.impala"
        struct_Buffer_6327 _30394;
        _30394 = _25550_30239.e0;
        #line 41 "gaussian.impala"
        int _30390;
        _30390 = 1 + v_anchor_30265;
        #line 77 "gpu_device_shm.impala"
        char* _30395;
        _30395 = _30394.e1;
        #line 77 "gpu_device_shm.impala"
        double* _30396;
        union { double* dst; char* src; } u_30396;
        u_30396.src = _30395;
        _30396 = u_30396.dst;
        #line 27 "gpu_device_shm.impala"
        p_30387 = _30422;
        psum_30389 = 0.000000e+00;
        goto l30386;
    l30386: ;
        _30387 = p_30387;
        sum_30389 = psum_30389;
        #line 27 "gpu_device_shm.impala"
        bool _30391;
        _30391 = _30387 < _30390;
        #line 27 "gpu_device_shm.impala"
        if (_30391) goto l30392; else goto l30415;
    l30415: ;
        #line 64 "gpu_device_shm.impala"
        *_30420 = sum_30389;
        return ;
    l30392: ;
        #line 43 "gaussian.impala"
        int _30401;
        _30401 = gid_y_30294 + _30387;
        #line 43 "gaussian.impala"
        int _30397;
        _30397 = _30387 + v_anchor_30265;
        #line 31 "gpu_device_shm.impala"
        int _30393;
        _30393 = 1 + _30387;
        #line 72 "gpu_device_shm.impala"
        int _30403;
        _30403 = _30401 + _30402;
        #line 76 "gpu_device_shm.impala"
        double* i_30398;
        i_30398 = _30396 + _30397;
        #line 72 "gpu_device_shm.impala"
        int _30404;
        _30404 = _30403 * shm_dimx_30276;
        #line 77 "gpu_device_shm.impala"
        double _30399;
        _30399 = *i_30398;
        #line 72 "gpu_device_shm.impala"
        int _30405;
        _30405 = _30404 + gid_x_30285;
        #line 77 "gpu_device_shm.impala"
        double _30411;
        _30411 = _30399;
        #line 72 "gpu_device_shm.impala"
        int _30407;
        _30407 = _30405 + _30406;
        #line 72 "gpu_device_shm.impala"
        double* _30408;
        _30408 = reserve_shared_30263 + _30407;
        #line 72 "gpu_device_shm.impala"
        double _30409;
        _30409 = *_30408;
        #line 72 "gpu_device_shm.impala"
        double _30412;
        _30412 = _30409;
        #line 43 "gaussian.impala"
        double _30413;
        _30413 = _30411 * _30412;
        #line 43 "gaussian.impala"
        double _30414;
        _30414 = sum_30389 + _30413;
        #line 27 "gpu_device_shm.impala"
        p_30387 = _30393;
        psum_30389 = _30414;
        goto l30386;
    l30327: ;
        #line 221 "gpu_device_shm.impala"
        int img_index_y_30344;
        img_index_y_30344 = _30295 + _30324;
        #line 224 "gpu_device_shm.impala"
        bool _30347;
        _30347 = img_index_y_30344 < _30298;
        #line 224 "gpu_device_shm.impala"
        bool _30345;
        _30345 = 0 <= img_index_y_30344;
        #line 214 "gpu_device_shm.impala"
        int shm_index_y_30336;
        shm_index_y_30336 = tidy_30260 + _30324;
        #line 227 "gpu_device_shm.impala"
        int _30352;
        _30352 = img_index_y_30344 * _30290;
        #line 217 "gpu_device_shm.impala"
        bool _30337;
        _30337 = shm_index_y_30336 < shm_dimy_30267;
        #line 226 "gpu_device_shm.impala"
        int _30357;
        _30357 = shm_index_y_30336 * shm_dimx_30276;
        #line 38 "gpu_device_shm.impala"
        p_30329 = 0;
        goto l30328;
    l30328: ;
        _30329 = p_30329;
        #line 38 "gpu_device_shm.impala"
        bool _30331;
        _30331 = _30329 < shm_dimx_30276;
        #line 38 "gpu_device_shm.impala"
        if (_30331) goto l30332; else goto l30370;
    l30370: ;
        #line 42 "gpu_device_shm.impala"
        int _30371;
        _30371 = _30324 + bdimy_30248;
        #line 38 "gpu_device_shm.impala"
        p_30324 = _30371;
        goto l30323;
    l30332: ;
        #line 212 "gpu_device_shm.impala"
        int shm_index_x_30333;
        shm_index_x_30333 = tidx_30257 + _30329;
        #line 217 "gpu_device_shm.impala"
        bool _30334;
        _30334 = shm_index_x_30333 < shm_dimx_30276;
        #line 217 "gpu_device_shm.impala"
        if (_30334) goto l30335; else goto l30369;
    l30369: ;
        #line 229 "gpu_device_shm.impala"
        goto l30368;
    l30335: ;
        #line 217 "gpu_device_shm.impala"
        if (_30337) goto l30338; else goto l30367;
    l30367: ;
        #line 229 "gpu_device_shm.impala"
        goto l30368;
    l30368: ;
        #line 40 "gpu_device_shm.impala"
        goto l30349;
    l30338: ;
        #line 219 "gpu_device_shm.impala"
        int img_index_x_30339;
        img_index_x_30339 = _30286 + _30329;
        #line 224 "gpu_device_shm.impala"
        bool _30340;
        _30340 = 0 <= img_index_x_30339;
        #line 224 "gpu_device_shm.impala"
        if (_30340) goto l30341; else goto l30366;
    l30366: ;
        #line 228 "gpu_device_shm.impala"
        goto l30363;
    l30341: ;
        #line 224 "gpu_device_shm.impala"
        bool _30342;
        _30342 = img_index_x_30339 < _30290;
        #line 224 "gpu_device_shm.impala"
        if (_30342) goto l30343; else goto l30365;
    l30365: ;
        #line 228 "gpu_device_shm.impala"
        goto l30363;
    l30343: ;
        #line 224 "gpu_device_shm.impala"
        if (_30345) goto l30346; else goto l30364;
    l30364: ;
        #line 228 "gpu_device_shm.impala"
        goto l30363;
    l30346: ;
        #line 224 "gpu_device_shm.impala"
        if (_30347) goto l30348; else goto l30362;
    l30362: ;
        #line 228 "gpu_device_shm.impala"
        goto l30363;
    l30363: ;
        #line 40 "gpu_device_shm.impala"
        goto l30349;
    l30348: ;
        #line 227 "gpu_device_shm.impala"
        int _30353;
        _30353 = _30352 + img_index_x_30339;
        #line 227 "gpu_device_shm.impala"
        double* _30354;
        _30354 = _25551_30240 + _30353;
        #line 227 "gpu_device_shm.impala"
        double _30355;
        _30355 = *_30354;
        #line 226 "gpu_device_shm.impala"
        int _30358;
        _30358 = _30357 + shm_index_x_30333;
        #line 227 "gpu_device_shm.impala"
        double _30360;
        _30360 = _30355;
        #line 226 "gpu_device_shm.impala"
        double* _30359;
        _30359 = reserve_shared_30263 + _30358;
        #line 226 "gpu_device_shm.impala"
        *_30359 = _30360;
        #line 40 "gpu_device_shm.impala"
        goto l30349;
    l30349: ;
        #line 42 "gpu_device_shm.impala"
        int _30351;
        _30351 = _30329 + bdimx_30245;
        #line 38 "gpu_device_shm.impala"
        p_30329 = _30351;
        goto l30328;
    l30278: ;
        #line 212 "gpu_device_shm.impala"
        int shm_index_x_30279;
        shm_index_x_30279 = tidx_30257 + _30271;
        #line 217 "gpu_device_shm.impala"
        bool _30280;
        _30280 = shm_index_x_30279 < shm_dimx_30276;
        #line 217 "gpu_device_shm.impala"
        if (_30280) goto l30281; else goto l30321;
    l30321: ;
        #line 229 "gpu_device_shm.impala"
        goto l30320;
    l30281: ;
        #line 217 "gpu_device_shm.impala"
        if (_30282) goto l30283; else goto l30319;
    l30319: ;
        #line 229 "gpu_device_shm.impala"
        goto l30320;
    l30320: ;
        #line 40 "gpu_device_shm.impala"
        goto l30301;
    l30283: ;
        #line 219 "gpu_device_shm.impala"
        int img_index_x_30287;
        img_index_x_30287 = _30286 + _30271;
        #line 224 "gpu_device_shm.impala"
        bool _30288;
        _30288 = 0 <= img_index_x_30287;
        #line 224 "gpu_device_shm.impala"
        if (_30288) goto l30289; else goto l30318;
    l30318: ;
        #line 228 "gpu_device_shm.impala"
        goto l30315;
    l30289: ;
        #line 224 "gpu_device_shm.impala"
        bool _30291;
        _30291 = img_index_x_30287 < _30290;
        #line 224 "gpu_device_shm.impala"
        if (_30291) goto l30292; else goto l30317;
    l30317: ;
        #line 228 "gpu_device_shm.impala"
        goto l30315;
    l30292: ;
        #line 224 "gpu_device_shm.impala"
        if (_30296) goto l30297; else goto l30316;
    l30316: ;
        #line 228 "gpu_device_shm.impala"
        goto l30315;
    l30297: ;
        #line 224 "gpu_device_shm.impala"
        if (_30299) goto l30300; else goto l30314;
    l30314: ;
        #line 228 "gpu_device_shm.impala"
        goto l30315;
    l30315: ;
        #line 40 "gpu_device_shm.impala"
        goto l30301;
    l30300: ;
        #line 226 "gpu_device_shm.impala"
        int _30310;
        _30310 = _30309 + shm_index_x_30279;
        #line 227 "gpu_device_shm.impala"
        int _30305;
        _30305 = _30304 + img_index_x_30287;
        #line 226 "gpu_device_shm.impala"
        double* _30311;
        _30311 = reserve_shared_30263 + _30310;
        #line 227 "gpu_device_shm.impala"
        double* _30306;
        _30306 = _25551_30240 + _30305;
        #line 227 "gpu_device_shm.impala"
        double _30307;
        _30307 = *_30306;
        #line 227 "gpu_device_shm.impala"
        double _30312;
        _30312 = _30307;
        #line 226 "gpu_device_shm.impala"
        *_30311 = _30312;
        #line 40 "gpu_device_shm.impala"
        goto l30301;
    l30301: ;
        #line 42 "gpu_device_shm.impala"
        int _30303;
        _30303 = _30271 + bdimx_30245;
        #line 38 "gpu_device_shm.impala"
        p_30271 = _30303;
        goto l30270;
}

}