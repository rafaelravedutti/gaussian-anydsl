extern "C" {
typedef struct {
    float e[4];
} array_11173;

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
__global__ void lambda_40799(float*, float*);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_40799(float* _40802_44104, float* _40803_44105) {
    int  threadIdx_x_44114;
    int pthreadIdx_x_44114;
    int  blockDim_x_44120;
    int pblockDim_x_44120;
    int  blockIdx_x_44126;
    int pblockIdx_x_44126;
    int  threadIdx_y_44132;
    int pthreadIdx_y_44132;
    int  blockDim_y_44138;
    int pblockDim_y_44138;
    int  blockIdx_y_44144;
    int pblockIdx_y_44144;
    int  converge_44153;
    int pconverge_44153;
    int  converge_44158;
    int pconverge_44158;
    float  _44170;
    float p_44170;
    int  converge_44176;
    int pconverge_44176;
    int  converge_44180;
    int pconverge_44180;
    float  _44190;
    float p_44190;
    int  converge_44194;
    int pconverge_44194;
    int  converge_44198;
    int pconverge_44198;
    float  _44206;
    float p_44206;
    int  converge_44211;
    int pconverge_44211;
    int  converge_44215;
    int pconverge_44215;
    float  _44223;
    float p_44223;
    int  lower_44274;
    int plower_44274;
    int  upper_44275;
    int pupper_44275;
    int  step_44276;
    int pstep_44276;
    
    array_11173 tmp_44183_slot;
    array_11173* tmp_44183;
    tmp_44183 = &tmp_44183_slot;
    threadIdx_x_44114 = threadIdx_x();
    pthreadIdx_x_44114 = threadIdx_x_44114;
    l44112: ;
        threadIdx_x_44114 = pthreadIdx_x_44114;
        blockDim_x_44120 = blockDim_x();
        pblockDim_x_44120 = blockDim_x_44120;
    l44118: ;
        blockDim_x_44120 = pblockDim_x_44120;
        blockIdx_x_44126 = blockIdx_x();
        pblockIdx_x_44126 = blockIdx_x_44126;
    l44124: ;
        blockIdx_x_44126 = pblockIdx_x_44126;
        threadIdx_y_44132 = threadIdx_y();
        pthreadIdx_y_44132 = threadIdx_y_44132;
    l44130: ;
        threadIdx_y_44132 = pthreadIdx_y_44132;
        blockDim_y_44138 = blockDim_y();
        pblockDim_y_44138 = blockDim_y_44138;
    l44136: ;
        blockDim_y_44138 = pblockDim_y_44138;
        blockIdx_y_44144 = blockIdx_y();
        pblockIdx_y_44144 = blockIdx_y_44144;
    l44142: ;
        blockIdx_y_44144 = pblockIdx_y_44144;
        int _44146;
        _44146 = blockDim_x_44120 * blockIdx_x_44126;
        int _44147;
        _44147 = threadIdx_x_44114 + _44146;
        int _44148;
        _44148 = -2 + _44147;
        bool _44150;
        _44150 = _44148 < 0;
        if (_44150) goto l44151; else goto l44367;
    l44367: ;
        pconverge_44153 = _44148;
        goto l44152;
    l44151: ;
        pconverge_44153 = 0;
        goto l44152;
    l44152: ;
        converge_44153 = pconverge_44153;
        bool _44155;
        _44155 = 4096 <= converge_44153;
        if (_44155) goto l44156; else goto l44366;
    l44366: ;
        pconverge_44158 = converge_44153;
        goto l44157;
    l44156: ;
        pconverge_44158 = 4095;
        goto l44157;
    l44157: ;
        converge_44158 = pconverge_44158;
        int _44163;
        _44163 = blockDim_y_44138 * blockIdx_y_44144;
        int _44164;
        _44164 = threadIdx_y_44132 + _44163;
        int _44165;
        _44165 = 4096 * _44164;
        int _44166;
        _44166 = _44165 + converge_44158;
        float* idx_44167;
        idx_44167 = _40803_44105 + _44166;
        _44170 = __ldg(idx_44167);
        p_44170 = _44170;
    l44168: ;
        _44170 = p_44170;
        int _44172;
        _44172 = -1 + _44147;
        bool _44173;
        _44173 = _44172 < 0;
        if (_44173) goto l44174; else goto l44365;
    l44365: ;
        pconverge_44176 = _44172;
        goto l44175;
    l44174: ;
        pconverge_44176 = 0;
        goto l44175;
    l44175: ;
        converge_44176 = pconverge_44176;
        bool _44177;
        _44177 = 4096 <= converge_44176;
        if (_44177) goto l44178; else goto l44364;
    l44364: ;
        pconverge_44180 = converge_44176;
        goto l44179;
    l44178: ;
        pconverge_44180 = 4095;
        goto l44179;
    l44179: ;
        converge_44180 = pconverge_44180;
        int _44186;
        _44186 = _44165 + converge_44180;
        float* idx_44187;
        idx_44187 = _40803_44105 + _44186;
        float* _44184;
        _44184 = &tmp_44183->e[0];
        *_44184 = _44170;
        _44190 = __ldg(idx_44187);
        p_44190 = _44190;
    l44188: ;
        _44190 = p_44190;
        bool _44191;
        _44191 = _44147 < 0;
        if (_44191) goto l44192; else goto l44363;
    l44363: ;
        pconverge_44194 = _44147;
        goto l44193;
    l44192: ;
        pconverge_44194 = 0;
        goto l44193;
    l44193: ;
        converge_44194 = pconverge_44194;
        bool _44195;
        _44195 = 4096 <= converge_44194;
        if (_44195) goto l44196; else goto l44362;
    l44362: ;
        pconverge_44198 = converge_44194;
        goto l44197;
    l44196: ;
        pconverge_44198 = 4095;
        goto l44197;
    l44197: ;
        converge_44198 = pconverge_44198;
        int _44202;
        _44202 = _44165 + converge_44198;
        float* idx_44203;
        idx_44203 = _40803_44105 + _44202;
        float* unroll_44200;
        unroll_44200 = &tmp_44183->e[1];
        *unroll_44200 = _44190;
        _44206 = __ldg(idx_44203);
        p_44206 = _44206;
    l44204: ;
        _44206 = p_44206;
        int _44207;
        _44207 = 1 + _44147;
        bool _44208;
        _44208 = _44207 < 0;
        if (_44208) goto l44209; else goto l44361;
    l44361: ;
        pconverge_44211 = _44207;
        goto l44210;
    l44209: ;
        pconverge_44211 = 0;
        goto l44210;
    l44210: ;
        converge_44211 = pconverge_44211;
        bool _44212;
        _44212 = 4096 <= converge_44211;
        if (_44212) goto l44213; else goto l44360;
    l44360: ;
        pconverge_44215 = converge_44211;
        goto l44214;
    l44213: ;
        pconverge_44215 = 4095;
        goto l44214;
    l44214: ;
        converge_44215 = pconverge_44215;
        int _44219;
        _44219 = _44165 + converge_44215;
        float* _44217;
        _44217 = &tmp_44183->e[2];
        float* idx_44220;
        idx_44220 = _40803_44105 + _44219;
        *_44217 = _44206;
        _44223 = __ldg(idx_44220);
        p_44223 = _44223;
    l44221: ;
        _44223 = p_44223;
        float* _44225;
        _44225 = &tmp_44183->e[3];
        *_44225 = _44223;
        float _44227;
        _44227 = *_44184;
        float _44231;
        _44231 = _44227;
        float _44229;
        _44229 = *unroll_44200;
        float _44230;
        _44230 = _44229;
        bool _44232;
        _44232 = _44230 < _44231;
        if (_44232) goto l44233; else goto l44358;
    l44358: ;
        goto l44234;
    l44233: ;
        float _44350;
        _44350 = *_44184;
        float _44356;
        _44356 = _44350;
        float _44352;
        _44352 = *unroll_44200;
        float _44354;
        _44354 = _44352;
        *_44184 = _44354;
        *unroll_44200 = _44356;
        goto l44234;
    l44234: ;
        float _44236;
        _44236 = *_44217;
        float _44240;
        _44240 = _44236;
        float _44238;
        _44238 = *_44225;
        float _44239;
        _44239 = _44238;
        bool _44241;
        _44241 = _44239 < _44240;
        if (_44241) goto l44242; else goto l44348;
    l44348: ;
        goto l44243;
    l44242: ;
        float _44340;
        _44340 = *_44217;
        float _44346;
        _44346 = _44340;
        float _44342;
        _44342 = *_44225;
        float _44344;
        _44344 = _44342;
        *_44217 = _44344;
        *_44225 = _44346;
        goto l44243;
    l44243: ;
        float _44245;
        _44245 = *_44184;
        float _44249;
        _44249 = _44245;
        float _44247;
        _44247 = *_44217;
        float _44248;
        _44248 = _44247;
        bool _44250;
        _44250 = _44248 < _44249;
        if (_44250) goto l44251; else goto l44338;
    l44338: ;
        goto l44252;
    l44251: ;
        float _44330;
        _44330 = *_44184;
        float _44332;
        _44332 = *_44217;
        float _44336;
        _44336 = _44330;
        float _44334;
        _44334 = _44332;
        *_44184 = _44334;
        *_44217 = _44336;
        goto l44252;
    l44252: ;
        float _44254;
        _44254 = *unroll_44200;
        float _44258;
        _44258 = _44254;
        float _44256;
        _44256 = *_44225;
        float _44257;
        _44257 = _44256;
        bool _44259;
        _44259 = _44257 < _44258;
        if (_44259) goto l44260; else goto l44328;
    l44328: ;
        goto l44261;
    l44260: ;
        float _44320;
        _44320 = *unroll_44200;
        float _44326;
        _44326 = _44320;
        float _44322;
        _44322 = *_44225;
        float _44324;
        _44324 = _44322;
        *unroll_44200 = _44324;
        *_44225 = _44326;
        goto l44261;
    l44261: ;
        float _44263;
        _44263 = *unroll_44200;
        float _44267;
        _44267 = _44263;
        float _44265;
        _44265 = *_44217;
        float _44266;
        _44266 = _44265;
        bool _44268;
        _44268 = _44266 < _44267;
        if (_44268) goto l44269; else goto l44318;
    l44318: ;
        goto l44270;
    l44269: ;
        float _44310;
        _44310 = *unroll_44200;
        float _44316;
        _44316 = _44310;
        float _44312;
        _44312 = *_44217;
        float _44314;
        _44314 = _44312;
        *unroll_44200 = _44314;
        *_44217 = _44316;
        goto l44270;
    l44270: ;
        plower_44274 = 3;
        pupper_44275 = 3;
        pstep_44276 = 2;
        goto l44272;
    l44272: ;
        lower_44274 = plower_44274;
        upper_44275 = pupper_44275;
        step_44276 = pstep_44276;
        bool _44277;
        _44277 = lower_44274 < upper_44275;
        if (_44277) goto l44278; else goto l44302;
    l44302: ;
        int _44305;
        _44305 = _44165 + _44147;
        float _44303;
        _44303 = *unroll_44200;
        float* idx_44306;
        idx_44306 = _40802_44104 + _44305;
        float _44307;
        _44307 = _44303;
        *idx_44306 = _44307;
        return ;
    l44278: ;
        int _44282;
        _44282 = 1 + lower_44274;
        float* idx_44279;
        idx_44279 = &tmp_44183->e[lower_44274];
        float _44280;
        _44280 = *idx_44279;
        float* idx_44283;
        idx_44283 = &tmp_44183->e[_44282];
        float _44286;
        _44286 = _44280;
        float _44284;
        _44284 = *idx_44283;
        float _44285;
        _44285 = _44284;
        bool _44287;
        _44287 = _44285 < _44286;
        if (_44287) goto l44288; else goto l44301;
    l44301: ;
        goto l44289;
    l44288: ;
        float _44293;
        _44293 = *idx_44279;
        float _44299;
        _44299 = _44293;
        float _44295;
        _44295 = *idx_44283;
        float _44297;
        _44297 = _44295;
        *idx_44279 = _44297;
        *idx_44283 = _44299;
        goto l44289;
    l44289: ;
        int _44291;
        _44291 = lower_44274 + step_44276;
        plower_44274 = _44291;
        pupper_44275 = upper_44275;
        pstep_44276 = step_44276;
        goto l44272;
}

}