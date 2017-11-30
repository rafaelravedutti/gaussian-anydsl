extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_6987;
typedef struct {
    struct_Buffer_6987 e0;
    int e1;
    int e2;
} struct_filter_6986;
typedef struct {
    struct_Buffer_6987 e0;
    struct_Buffer_6987 e1;
    int e2;
    int e3;
} struct_image_6992;

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
__global__ void lambda_28285(struct_filter_6986, double*, struct_image_6992, double*, struct_Buffer_6987);
__global__ void lambda_28609(struct_Buffer_6987, struct_image_6992, struct_filter_6986, double*, double*, double*);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_28285(struct_filter_6986 _28288_34329, double* _28289_34330, struct_image_6992 _28290_34331, double* _28291_34332, struct_Buffer_6987 _28292_34333) {
    int  bdimx_34339;
    int pbdimx_34339;
    int  bdimy_34345;
    int pbdimy_34345;
    int  bidx_34351;
    int pbidx_34351;
    int  bidy_34357;
    int pbidy_34357;
    int  tidx_34363;
    int ptidx_34363;
    int  tidy_34369;
    int ptidy_34369;
    double*  reserve_shared_34377;
    double* preserve_shared_34377;
    double*  reserve_shared_34385;
    double* preserve_shared_34385;
    int  _34396;
    int p_34396;
    int  _34452;
    int p_34452;
    int  _34506;
    int p_34506;
    int  _34531;
    int p_34531;
    int  _34580;
    int p_34580;
    double  sum_34582;
    double psum_34582;
    int  _34536;
    int p_34536;
    int  _34457;
    int p_34457;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    bdimx_34339 = blockDim_x();
    pbdimx_34339 = bdimx_34339;
    l34337: ;
        bdimx_34339 = pbdimx_34339;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bdimy_34345 = blockDim_y();
        pbdimy_34345 = bdimy_34345;
    l34343: ;
        bdimy_34345 = pbdimy_34345;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidx_34351 = blockIdx_x();
        pbidx_34351 = bidx_34351;
    l34349: ;
        bidx_34351 = pbidx_34351;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidy_34357 = blockIdx_y();
        pbidy_34357 = bidy_34357;
    l34355: ;
        bidy_34357 = pbidy_34357;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidx_34363 = threadIdx_x();
        ptidx_34363 = tidx_34363;
    l34361: ;
        tidx_34363 = ptidx_34363;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidy_34369 = threadIdx_y();
        ptidy_34369 = tidy_34369;
    l34367: ;
        tidy_34369 = ptidy_34369;
        #line 215 "impala/gpu_device_shm.impala"
        __shared__ double reserver_reserve_shared_34377[938];
        preserve_shared_34377 = reserver_reserve_shared_34377;
    l34375: ;
        reserve_shared_34377 = preserve_shared_34377;
        #line 223 "impala/gpu_device_shm.impala"
        __shared__ double reserver_reserve_shared_34385[49];
        preserve_shared_34385 = reserver_reserve_shared_34385;
    l34383: ;
        reserve_shared_34385 = preserve_shared_34385;
        #line 203 "impala/gpu_device_shm.impala"
        int _34419;
        _34419 = bidy_34357 * bdimy_34345;
        #line 201 "impala/gpu_device_shm.impala"
        int _34410;
        _34410 = bidx_34351 * bdimx_34339;
        #line 201 "impala/gpu_device_shm.impala"
        int gid_x_34411;
        gid_x_34411 = _34410 + tidx_34363;
        #line 11 "impala/main.impala"
        int _34425;
        _34425 = _28290_34331.e3;
        #line 11 "impala/main.impala"
        int _34416;
        _34416 = _28290_34331.e2;
        #line 4 "impala/gaussian.impala"
        int _34399;
        _34399 = _28288_34329.e1;
        #line 203 "impala/gpu_device_shm.impala"
        int gid_y_34420;
        gid_y_34420 = _34419 + tidy_34369;
        #line 207 "impala/gpu_device_shm.impala"
        int _34389;
        _34389 = _28288_34329.e2;
        #line 4 "impala/gaussian.impala"
        int h_anchor_34400;
        h_anchor_34400 = _34399 / 2;
        #line 207 "impala/gpu_device_shm.impala"
        int extend_height_34390;
        extend_height_34390 = _34389 / 2;
        #line 209 "impala/gpu_device_shm.impala"
        int _34401;
        _34401 = 2 * h_anchor_34400;
        #line 211 "impala/gpu_device_shm.impala"
        int _34391;
        _34391 = 2 * extend_height_34390;
        #line 209 "impala/gpu_device_shm.impala"
        int shm_dimx_34402;
        shm_dimx_34402 = bdimx_34339 + _34401;
        #line 211 "impala/gpu_device_shm.impala"
        int shm_dimy_34392;
        shm_dimy_34392 = bdimy_34345 + _34391;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34393;
        _34393 = 0 < shm_dimy_34392;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34393) goto l34394; else goto l34629;
    l34629: ;
        #line 253 "impala/gpu_device_shm.impala"
        goto l34501;
    l34394: ;
        #line 241 "impala/gpu_device_shm.impala"
        int _34412;
        _34412 = gid_x_34411 - h_anchor_34400;
        #line 239 "impala/gpu_device_shm.impala"
        bool _34408;
        _34408 = tidy_34369 < shm_dimy_34392;
        #line 243 "impala/gpu_device_shm.impala"
        int _34421;
        _34421 = gid_y_34420 - extend_height_34390;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34422;
        _34422 = 0 <= _34421;
        #line 248 "impala/gpu_device_shm.impala"
        int _34437;
        _34437 = tidy_34369 * shm_dimx_34402;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34426;
        _34426 = _34421 < _34425;
        #line 249 "impala/gpu_device_shm.impala"
        int _34431;
        _34431 = _34421 * _34416;
        #line 52 "impala/gpu_device_shm.impala"
        p_34396 = 0;
        goto l34395;
    l34395: ;
        _34396 = p_34396;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34403;
        _34403 = _34396 < shm_dimx_34402;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34403) goto l34404; else goto l34450;
    l34450: ;
        #line 52 "impala/gpu_device_shm.impala"
        p_34452 = bdimy_34345;
        goto l34451;
    l34451: ;
        _34452 = p_34452;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34454;
        _34454 = _34452 < shm_dimy_34392;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34454) goto l34455; else goto l34500;
    l34500: ;
        #line 253 "impala/gpu_device_shm.impala"
        goto l34501;
    l34501: ;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34503;
        _34503 = 0 < _34389;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34503) goto l34504; else goto l34628;
    l34628: ;
        #line 271 "impala/gpu_device_shm.impala"
        goto l34563;
    l34504: ;
        #line 265 "impala/gpu_device_shm.impala"
        bool _34513;
        _34513 = tidy_34369 < _34389;
        #line 267 "impala/gpu_device_shm.impala"
        int _34518;
        _34518 = tidy_34369 * _34399;
        #line 52 "impala/gpu_device_shm.impala"
        p_34506 = 0;
        goto l34505;
    l34505: ;
        _34506 = p_34506;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34508;
        _34508 = _34506 < _34399;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34508) goto l34509; else goto l34529;
    l34529: ;
        #line 52 "impala/gpu_device_shm.impala"
        p_34531 = bdimy_34345;
        goto l34530;
    l34530: ;
        _34531 = p_34531;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34533;
        _34533 = _34531 < _34389;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34533) goto l34534; else goto l34562;
    l34562: ;
        #line 271 "impala/gpu_device_shm.impala"
        goto l34563;
    l34563: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        __syncthreads();
    l34568: ;
        #line 277 "impala/gpu_device_shm.impala"
        bool _34570;
        _34570 = gid_x_34411 < _34416;
        #line 277 "impala/gpu_device_shm.impala"
        if (_34570) goto l34571; else goto l34627;
    l34627: ;
        #line 280 "impala/gpu_device_shm.impala"
        goto l34626;
    l34571: ;
        #line 277 "impala/gpu_device_shm.impala"
        bool _34572;
        _34572 = gid_y_34420 < _34425;
        #line 277 "impala/gpu_device_shm.impala"
        if (_34572) goto l34573; else goto l34625;
    l34625: ;
        #line 280 "impala/gpu_device_shm.impala"
        goto l34626;
    l34626: ;
        return ;
    l34573: ;
        #line 78 "impala/gpu_device_shm.impala"
        char* _34607;
        _34607 = _28292_34333.e1;
        #line 78 "impala/gpu_device_shm.impala"
        double* _34608;
        union { double* dst; char* src; } u_34608;
        u_34608.src = _34607;
        _34608 = u_34608.dst;
        #line 217 "impala/gpu_device_shm.impala"
        int _34597;
        _34597 = h_anchor_34400 - _34410;
        #line 78 "impala/gpu_device_shm.impala"
        int _34609;
        _34609 = gid_y_34420 * _34416;
        #line 218 "impala/gpu_device_shm.impala"
        int _34592;
        _34592 = extend_height_34390 - _34419;
        #line 86 "impala/gpu_device_shm.impala"
        int _34593;
        _34593 = gid_y_34420 + _34592;
        #line 78 "impala/gpu_device_shm.impala"
        int _34610;
        _34610 = _34609 + gid_x_34411;
        #line 17 "impala/gaussian.impala"
        bool _34574;
        _34574 = h_anchor_34400 <= gid_x_34411;
        #line 78 "impala/gpu_device_shm.impala"
        double* _34611;
        _34611 = _34608 + _34610;
        #line 86 "impala/gpu_device_shm.impala"
        int _34594;
        _34594 = _34593 * shm_dimx_34402;
        #line 17 "impala/gaussian.impala"
        if (_34574) goto l34575; else goto l34624;
    l34624: ;
        #line 27 "impala/gaussian.impala"
        goto l34616;
    l34575: ;
        #line 17 "impala/gaussian.impala"
        int _34576;
        _34576 = _34416 - h_anchor_34400;
        #line 17 "impala/gaussian.impala"
        bool _34577;
        _34577 = gid_x_34411 < _34576;
        #line 17 "impala/gaussian.impala"
        if (_34577) goto l34578; else goto l34615;
    l34615: ;
        #line 27 "impala/gaussian.impala"
        goto l34616;
    l34616: ;
        #line 86 "impala/gpu_device_shm.impala"
        int _34617;
        _34617 = _34594 + gid_x_34411;
        #line 86 "impala/gpu_device_shm.impala"
        int _34618;
        _34618 = _34617 + _34597;
        #line 86 "impala/gpu_device_shm.impala"
        double* _34619;
        _34619 = reserve_shared_34377 + _34618;
        #line 86 "impala/gpu_device_shm.impala"
        double _34620;
        _34620 = *_34619;
        #line 86 "impala/gpu_device_shm.impala"
        double _34622;
        _34622 = _34620;
        #line 78 "impala/gpu_device_shm.impala"
        *_34611 = _34622;
        return ;
    l34578: ;
        #line 19 "impala/gaussian.impala"
        int _34584;
        _34584 = 1 + h_anchor_34400;
        #line 19 "impala/gaussian.impala"
        int _34613;
        _34613 = 0 - h_anchor_34400;
        #line 27 "impala/gpu_device_shm.impala"
        p_34580 = _34613;
        psum_34582 = 0.000000e+00;
        goto l34579;
    l34579: ;
        _34580 = p_34580;
        sum_34582 = psum_34582;
        #line 27 "impala/gpu_device_shm.impala"
        bool _34585;
        _34585 = _34580 < _34584;
        #line 27 "impala/gpu_device_shm.impala"
        if (_34585) goto l34586; else goto l34606;
    l34606: ;
        #line 78 "impala/gpu_device_shm.impala"
        *_34611 = sum_34582;
        return ;
    l34586: ;
        #line 31 "impala/gpu_device_shm.impala"
        int _34587;
        _34587 = 1 + _34580;
        #line 21 "impala/gaussian.impala"
        int _34595;
        _34595 = gid_x_34411 + _34580;
        #line 21 "impala/gaussian.impala"
        int _34588;
        _34588 = _34580 + h_anchor_34400;
        #line 86 "impala/gpu_device_shm.impala"
        int _34596;
        _34596 = _34594 + _34595;
        #line 90 "impala/gpu_device_shm.impala"
        double* i_34589;
        i_34589 = reserve_shared_34385 + _34588;
        #line 86 "impala/gpu_device_shm.impala"
        int _34598;
        _34598 = _34596 + _34597;
        #line 91 "impala/gpu_device_shm.impala"
        double _34590;
        _34590 = *i_34589;
        #line 86 "impala/gpu_device_shm.impala"
        double* _34599;
        _34599 = reserve_shared_34377 + _34598;
        #line 91 "impala/gpu_device_shm.impala"
        double _34602;
        _34602 = _34590;
        #line 86 "impala/gpu_device_shm.impala"
        double _34600;
        _34600 = *_34599;
        #line 86 "impala/gpu_device_shm.impala"
        double _34603;
        _34603 = _34600;
        #line 21 "impala/gaussian.impala"
        double _34604;
        _34604 = _34602 * _34603;
        #line 21 "impala/gaussian.impala"
        double _34605;
        _34605 = sum_34582 + _34604;
        #line 27 "impala/gpu_device_shm.impala"
        p_34580 = _34587;
        psum_34582 = _34605;
        goto l34579;
    l34534: ;
        #line 262 "impala/gpu_device_shm.impala"
        int shm_index_y_34543;
        shm_index_y_34543 = tidy_34369 + _34531;
        #line 265 "impala/gpu_device_shm.impala"
        bool _34544;
        _34544 = shm_index_y_34543 < _34389;
        #line 267 "impala/gpu_device_shm.impala"
        int _34549;
        _34549 = shm_index_y_34543 * _34399;
        #line 52 "impala/gpu_device_shm.impala"
        p_34536 = 0;
        goto l34535;
    l34535: ;
        _34536 = p_34536;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34538;
        _34538 = _34536 < _34399;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34538) goto l34539; else goto l34560;
    l34560: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34561;
        _34561 = _34531 + bdimy_34345;
        #line 52 "impala/gpu_device_shm.impala"
        p_34531 = _34561;
        goto l34530;
    l34539: ;
        #line 260 "impala/gpu_device_shm.impala"
        int shm_index_x_34540;
        shm_index_x_34540 = tidx_34363 + _34536;
        #line 265 "impala/gpu_device_shm.impala"
        bool _34541;
        _34541 = shm_index_x_34540 < _34399;
        #line 265 "impala/gpu_device_shm.impala"
        if (_34541) goto l34542; else goto l34559;
    l34559: ;
        #line 269 "impala/gpu_device_shm.impala"
        goto l34558;
    l34542: ;
        #line 265 "impala/gpu_device_shm.impala"
        if (_34544) goto l34545; else goto l34557;
    l34557: ;
        #line 269 "impala/gpu_device_shm.impala"
        goto l34558;
    l34558: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34546;
    l34545: ;
        #line 267 "impala/gpu_device_shm.impala"
        int _34550;
        _34550 = _34549 + shm_index_x_34540;
        #line 267 "impala/gpu_device_shm.impala"
        double* _34551;
        _34551 = _28291_34332 + _34550;
        #line 267 "impala/gpu_device_shm.impala"
        double* _34554;
        _34554 = reserve_shared_34385 + _34550;
        #line 268 "impala/gpu_device_shm.impala"
        double _34552;
        _34552 = *_34551;
        #line 268 "impala/gpu_device_shm.impala"
        double _34555;
        _34555 = _34552;
        #line 267 "impala/gpu_device_shm.impala"
        *_34554 = _34555;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34546;
    l34546: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34548;
        _34548 = _34536 + bdimx_34339;
        #line 52 "impala/gpu_device_shm.impala"
        p_34536 = _34548;
        goto l34535;
    l34509: ;
        #line 260 "impala/gpu_device_shm.impala"
        int shm_index_x_34510;
        shm_index_x_34510 = tidx_34363 + _34506;
        #line 265 "impala/gpu_device_shm.impala"
        bool _34511;
        _34511 = shm_index_x_34510 < _34399;
        #line 265 "impala/gpu_device_shm.impala"
        if (_34511) goto l34512; else goto l34528;
    l34528: ;
        #line 269 "impala/gpu_device_shm.impala"
        goto l34527;
    l34512: ;
        #line 265 "impala/gpu_device_shm.impala"
        if (_34513) goto l34514; else goto l34526;
    l34526: ;
        #line 269 "impala/gpu_device_shm.impala"
        goto l34527;
    l34527: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34515;
    l34514: ;
        #line 267 "impala/gpu_device_shm.impala"
        int _34519;
        _34519 = _34518 + shm_index_x_34510;
        #line 267 "impala/gpu_device_shm.impala"
        double* _34523;
        _34523 = reserve_shared_34385 + _34519;
        #line 267 "impala/gpu_device_shm.impala"
        double* _34520;
        _34520 = _28291_34332 + _34519;
        #line 268 "impala/gpu_device_shm.impala"
        double _34521;
        _34521 = *_34520;
        #line 268 "impala/gpu_device_shm.impala"
        double _34524;
        _34524 = _34521;
        #line 267 "impala/gpu_device_shm.impala"
        *_34523 = _34524;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34515;
    l34515: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34517;
        _34517 = _34506 + bdimx_34339;
        #line 52 "impala/gpu_device_shm.impala"
        p_34506 = _34517;
        goto l34505;
    l34455: ;
        #line 243 "impala/gpu_device_shm.impala"
        int img_index_y_34472;
        img_index_y_34472 = _34421 + _34452;
        #line 249 "impala/gpu_device_shm.impala"
        int _34480;
        _34480 = img_index_y_34472 * _34416;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34475;
        _34475 = img_index_y_34472 < _34425;
        #line 236 "impala/gpu_device_shm.impala"
        int shm_index_y_34464;
        shm_index_y_34464 = tidy_34369 + _34452;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34473;
        _34473 = 0 <= img_index_y_34472;
        #line 239 "impala/gpu_device_shm.impala"
        bool _34465;
        _34465 = shm_index_y_34464 < shm_dimy_34392;
        #line 248 "impala/gpu_device_shm.impala"
        int _34485;
        _34485 = shm_index_y_34464 * shm_dimx_34402;
        #line 52 "impala/gpu_device_shm.impala"
        p_34457 = 0;
        goto l34456;
    l34456: ;
        _34457 = p_34457;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34459;
        _34459 = _34457 < shm_dimx_34402;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34459) goto l34460; else goto l34498;
    l34498: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34499;
        _34499 = _34452 + bdimy_34345;
        #line 52 "impala/gpu_device_shm.impala"
        p_34452 = _34499;
        goto l34451;
    l34460: ;
        #line 234 "impala/gpu_device_shm.impala"
        int shm_index_x_34461;
        shm_index_x_34461 = tidx_34363 + _34457;
        #line 239 "impala/gpu_device_shm.impala"
        bool _34462;
        _34462 = shm_index_x_34461 < shm_dimx_34402;
        #line 239 "impala/gpu_device_shm.impala"
        if (_34462) goto l34463; else goto l34497;
    l34497: ;
        #line 251 "impala/gpu_device_shm.impala"
        goto l34496;
    l34463: ;
        #line 239 "impala/gpu_device_shm.impala"
        if (_34465) goto l34466; else goto l34495;
    l34495: ;
        #line 251 "impala/gpu_device_shm.impala"
        goto l34496;
    l34496: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34477;
    l34466: ;
        #line 241 "impala/gpu_device_shm.impala"
        int img_index_x_34467;
        img_index_x_34467 = _34412 + _34457;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34468;
        _34468 = 0 <= img_index_x_34467;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34468) goto l34469; else goto l34494;
    l34494: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34491;
    l34469: ;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34470;
        _34470 = img_index_x_34467 < _34416;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34470) goto l34471; else goto l34493;
    l34493: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34491;
    l34471: ;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34473) goto l34474; else goto l34492;
    l34492: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34491;
    l34474: ;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34475) goto l34476; else goto l34490;
    l34490: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34491;
    l34491: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34477;
    l34476: ;
        #line 249 "impala/gpu_device_shm.impala"
        int _34481;
        _34481 = _34480 + img_index_x_34467;
        #line 248 "impala/gpu_device_shm.impala"
        int _34486;
        _34486 = _34485 + shm_index_x_34461;
        #line 249 "impala/gpu_device_shm.impala"
        double* _34482;
        _34482 = _28289_34330 + _34481;
        #line 248 "impala/gpu_device_shm.impala"
        double* _34487;
        _34487 = reserve_shared_34377 + _34486;
        #line 249 "impala/gpu_device_shm.impala"
        double _34483;
        _34483 = *_34482;
        #line 249 "impala/gpu_device_shm.impala"
        double _34488;
        _34488 = _34483;
        #line 248 "impala/gpu_device_shm.impala"
        *_34487 = _34488;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34477;
    l34477: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34479;
        _34479 = _34457 + bdimx_34339;
        #line 52 "impala/gpu_device_shm.impala"
        p_34457 = _34479;
        goto l34456;
    l34404: ;
        #line 234 "impala/gpu_device_shm.impala"
        int shm_index_x_34405;
        shm_index_x_34405 = tidx_34363 + _34396;
        #line 239 "impala/gpu_device_shm.impala"
        bool _34406;
        _34406 = shm_index_x_34405 < shm_dimx_34402;
        #line 239 "impala/gpu_device_shm.impala"
        if (_34406) goto l34407; else goto l34449;
    l34449: ;
        #line 251 "impala/gpu_device_shm.impala"
        goto l34448;
    l34407: ;
        #line 239 "impala/gpu_device_shm.impala"
        if (_34408) goto l34409; else goto l34447;
    l34447: ;
        #line 251 "impala/gpu_device_shm.impala"
        goto l34448;
    l34448: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34428;
    l34409: ;
        #line 241 "impala/gpu_device_shm.impala"
        int img_index_x_34413;
        img_index_x_34413 = _34412 + _34396;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34414;
        _34414 = 0 <= img_index_x_34413;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34414) goto l34415; else goto l34446;
    l34446: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34443;
    l34415: ;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34417;
        _34417 = img_index_x_34413 < _34416;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34417) goto l34418; else goto l34445;
    l34445: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34443;
    l34418: ;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34422) goto l34423; else goto l34444;
    l34444: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34443;
    l34423: ;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34426) goto l34427; else goto l34442;
    l34442: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34443;
    l34443: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34428;
    l34427: ;
        #line 249 "impala/gpu_device_shm.impala"
        int _34432;
        _34432 = _34431 + img_index_x_34413;
        #line 248 "impala/gpu_device_shm.impala"
        int _34438;
        _34438 = _34437 + shm_index_x_34405;
        #line 248 "impala/gpu_device_shm.impala"
        double* _34439;
        _34439 = reserve_shared_34377 + _34438;
        #line 249 "impala/gpu_device_shm.impala"
        double* _34433;
        _34433 = _28289_34330 + _34432;
        #line 249 "impala/gpu_device_shm.impala"
        double _34434;
        _34434 = *_34433;
        #line 249 "impala/gpu_device_shm.impala"
        double _34440;
        _34440 = _34434;
        #line 248 "impala/gpu_device_shm.impala"
        *_34439 = _34440;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34428;
    l34428: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34430;
        _34430 = _34396 + bdimx_34339;
        #line 52 "impala/gpu_device_shm.impala"
        p_34396 = _34430;
        goto l34395;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_28609(struct_Buffer_6987 _28612_34633, struct_image_6992 _28613_34634, struct_filter_6986 _28614_34635, double* _28615_34636, double* _28616_34637, double* _28617_34638) {
    int  bdimx_34641;
    int pbdimx_34641;
    int  bdimy_34644;
    int pbdimy_34644;
    int  bidx_34647;
    int pbidx_34647;
    int  bidy_34650;
    int pbidy_34650;
    int  tidx_34653;
    int ptidx_34653;
    int  tidy_34656;
    int ptidy_34656;
    double*  reserve_shared_34659;
    double* preserve_shared_34659;
    double*  reserve_shared_34662;
    double* preserve_shared_34662;
    int  _34670;
    int p_34670;
    int  _34723;
    int p_34723;
    int  _34777;
    int p_34777;
    int  _34802;
    int p_34802;
    int  _34848;
    int p_34848;
    double  sum_34850;
    double psum_34850;
    int  _34807;
    int p_34807;
    int  _34728;
    int p_34728;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    bdimx_34641 = blockDim_x();
    pbdimx_34641 = bdimx_34641;
    l34639: ;
        bdimx_34641 = pbdimx_34641;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bdimy_34644 = blockDim_y();
        pbdimy_34644 = bdimy_34644;
    l34642: ;
        bdimy_34644 = pbdimy_34644;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidx_34647 = blockIdx_x();
        pbidx_34647 = bidx_34647;
    l34645: ;
        bidx_34647 = pbidx_34647;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidy_34650 = blockIdx_y();
        pbidy_34650 = bidy_34650;
    l34648: ;
        bidy_34650 = pbidy_34650;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidx_34653 = threadIdx_x();
        ptidx_34653 = tidx_34653;
    l34651: ;
        tidx_34653 = ptidx_34653;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidy_34656 = threadIdx_y();
        ptidy_34656 = tidy_34656;
    l34654: ;
        tidy_34656 = ptidy_34656;
        #line 215 "impala/gpu_device_shm.impala"
        __shared__ double reserver_reserve_shared_34659[938];
        preserve_shared_34659 = reserver_reserve_shared_34659;
    l34657: ;
        reserve_shared_34659 = preserve_shared_34659;
        #line 223 "impala/gpu_device_shm.impala"
        __shared__ double reserver_reserve_shared_34662[49];
        preserve_shared_34662 = reserver_reserve_shared_34662;
    l34660: ;
        reserve_shared_34662 = preserve_shared_34662;
        #line 11 "impala/main.impala"
        int _34697;
        _34697 = _28613_34634.e3;
        #line 6 "impala/gaussian.impala"
        int _34663;
        _34663 = _28614_34635.e2;
        #line 201 "impala/gpu_device_shm.impala"
        int _34683;
        _34683 = bidx_34647 * bdimx_34641;
        #line 201 "impala/gpu_device_shm.impala"
        int gid_x_34684;
        gid_x_34684 = _34683 + tidx_34653;
        #line 203 "impala/gpu_device_shm.impala"
        int _34692;
        _34692 = bidy_34650 * bdimy_34644;
        #line 11 "impala/main.impala"
        int _34689;
        _34689 = _28613_34634.e2;
        #line 205 "impala/gpu_device_shm.impala"
        int _34672;
        _34672 = _28614_34635.e1;
        #line 6 "impala/gaussian.impala"
        int v_anchor_34664;
        v_anchor_34664 = _34663 / 2;
        #line 203 "impala/gpu_device_shm.impala"
        int gid_y_34693;
        gid_y_34693 = _34692 + tidy_34656;
        #line 205 "impala/gpu_device_shm.impala"
        int extend_width_34673;
        extend_width_34673 = _34672 / 2;
        #line 211 "impala/gpu_device_shm.impala"
        int _34665;
        _34665 = 2 * v_anchor_34664;
        #line 209 "impala/gpu_device_shm.impala"
        int _34674;
        _34674 = 2 * extend_width_34673;
        #line 211 "impala/gpu_device_shm.impala"
        int shm_dimy_34666;
        shm_dimy_34666 = bdimy_34644 + _34665;
        #line 209 "impala/gpu_device_shm.impala"
        int shm_dimx_34675;
        shm_dimx_34675 = bdimx_34641 + _34674;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34667;
        _34667 = 0 < shm_dimy_34666;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34667) goto l34668; else goto l34897;
    l34897: ;
        #line 253 "impala/gpu_device_shm.impala"
        goto l34772;
    l34668: ;
        #line 248 "impala/gpu_device_shm.impala"
        int _34708;
        _34708 = tidy_34656 * shm_dimx_34675;
        #line 239 "impala/gpu_device_shm.impala"
        bool _34681;
        _34681 = tidy_34656 < shm_dimy_34666;
        #line 243 "impala/gpu_device_shm.impala"
        int _34694;
        _34694 = gid_y_34693 - v_anchor_34664;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34695;
        _34695 = 0 <= _34694;
        #line 241 "impala/gpu_device_shm.impala"
        int _34685;
        _34685 = gid_x_34684 - extend_width_34673;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34698;
        _34698 = _34694 < _34697;
        #line 249 "impala/gpu_device_shm.impala"
        int _34703;
        _34703 = _34694 * _34689;
        #line 52 "impala/gpu_device_shm.impala"
        p_34670 = 0;
        goto l34669;
    l34669: ;
        _34670 = p_34670;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34676;
        _34676 = _34670 < shm_dimx_34675;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34676) goto l34677; else goto l34721;
    l34721: ;
        #line 52 "impala/gpu_device_shm.impala"
        p_34723 = bdimy_34644;
        goto l34722;
    l34722: ;
        _34723 = p_34723;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34725;
        _34725 = _34723 < shm_dimy_34666;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34725) goto l34726; else goto l34771;
    l34771: ;
        #line 253 "impala/gpu_device_shm.impala"
        goto l34772;
    l34772: ;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34774;
        _34774 = 0 < _34663;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34774) goto l34775; else goto l34896;
    l34896: ;
        #line 271 "impala/gpu_device_shm.impala"
        goto l34834;
    l34775: ;
        #line 265 "impala/gpu_device_shm.impala"
        bool _34784;
        _34784 = tidy_34656 < _34663;
        #line 267 "impala/gpu_device_shm.impala"
        int _34789;
        _34789 = tidy_34656 * _34672;
        #line 52 "impala/gpu_device_shm.impala"
        p_34777 = 0;
        goto l34776;
    l34776: ;
        _34777 = p_34777;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34779;
        _34779 = _34777 < _34672;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34779) goto l34780; else goto l34800;
    l34800: ;
        #line 52 "impala/gpu_device_shm.impala"
        p_34802 = bdimy_34644;
        goto l34801;
    l34801: ;
        _34802 = p_34802;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34804;
        _34804 = _34802 < _34663;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34804) goto l34805; else goto l34833;
    l34833: ;
        #line 271 "impala/gpu_device_shm.impala"
        goto l34834;
    l34834: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        __syncthreads();
    l34836: ;
        #line 277 "impala/gpu_device_shm.impala"
        bool _34838;
        _34838 = gid_x_34684 < _34689;
        #line 277 "impala/gpu_device_shm.impala"
        if (_34838) goto l34839; else goto l34895;
    l34895: ;
        #line 280 "impala/gpu_device_shm.impala"
        goto l34894;
    l34839: ;
        #line 277 "impala/gpu_device_shm.impala"
        bool _34840;
        _34840 = gid_y_34693 < _34697;
        #line 277 "impala/gpu_device_shm.impala"
        if (_34840) goto l34841; else goto l34893;
    l34893: ;
        #line 280 "impala/gpu_device_shm.impala"
        goto l34894;
    l34894: ;
        return ;
    l34841: ;
        #line 39 "impala/gaussian.impala"
        bool _34842;
        _34842 = v_anchor_34664 <= gid_y_34693;
        #line 217 "impala/gpu_device_shm.impala"
        int _34864;
        _34864 = extend_width_34673 - _34683;
        #line 218 "impala/gpu_device_shm.impala"
        int _34860;
        _34860 = v_anchor_34664 - _34692;
        #line 78 "impala/gpu_device_shm.impala"
        char* _34874;
        _34874 = _28612_34633.e1;
        #line 78 "impala/gpu_device_shm.impala"
        double* _34875;
        union { double* dst; char* src; } u_34875;
        u_34875.src = _34874;
        _34875 = u_34875.dst;
        #line 78 "impala/gpu_device_shm.impala"
        int _34876;
        _34876 = gid_y_34693 * _34689;
        #line 78 "impala/gpu_device_shm.impala"
        int _34877;
        _34877 = _34876 + gid_x_34684;
        #line 78 "impala/gpu_device_shm.impala"
        double* _34878;
        _34878 = _34875 + _34877;
        #line 39 "impala/gaussian.impala"
        if (_34842) goto l34843; else goto l34892;
    l34892: ;
        #line 49 "impala/gaussian.impala"
        goto l34882;
    l34843: ;
        #line 39 "impala/gaussian.impala"
        int _34844;
        _34844 = _34697 - v_anchor_34664;
        #line 39 "impala/gaussian.impala"
        bool _34845;
        _34845 = gid_y_34693 < _34844;
        #line 39 "impala/gaussian.impala"
        if (_34845) goto l34846; else goto l34881;
    l34881: ;
        #line 49 "impala/gaussian.impala"
        goto l34882;
    l34882: ;
        #line 86 "impala/gpu_device_shm.impala"
        int _34883;
        _34883 = gid_y_34693 + _34860;
        #line 86 "impala/gpu_device_shm.impala"
        int _34884;
        _34884 = _34883 * shm_dimx_34675;
        #line 86 "impala/gpu_device_shm.impala"
        int _34885;
        _34885 = _34884 + gid_x_34684;
        #line 86 "impala/gpu_device_shm.impala"
        int _34886;
        _34886 = _34885 + _34864;
        #line 86 "impala/gpu_device_shm.impala"
        double* _34887;
        _34887 = reserve_shared_34659 + _34886;
        #line 86 "impala/gpu_device_shm.impala"
        double _34888;
        _34888 = *_34887;
        #line 86 "impala/gpu_device_shm.impala"
        double _34890;
        _34890 = _34888;
        #line 78 "impala/gpu_device_shm.impala"
        *_34878 = _34890;
        return ;
    l34846: ;
        #line 41 "impala/gaussian.impala"
        int _34851;
        _34851 = 1 + v_anchor_34664;
        #line 41 "impala/gaussian.impala"
        int _34880;
        _34880 = 0 - v_anchor_34664;
        #line 27 "impala/gpu_device_shm.impala"
        p_34848 = _34880;
        psum_34850 = 0.000000e+00;
        goto l34847;
    l34847: ;
        _34848 = p_34848;
        sum_34850 = psum_34850;
        #line 27 "impala/gpu_device_shm.impala"
        bool _34852;
        _34852 = _34848 < _34851;
        #line 27 "impala/gpu_device_shm.impala"
        if (_34852) goto l34853; else goto l34873;
    l34873: ;
        #line 78 "impala/gpu_device_shm.impala"
        *_34878 = sum_34850;
        return ;
    l34853: ;
        #line 43 "impala/gaussian.impala"
        int _34859;
        _34859 = gid_y_34693 + _34848;
        #line 31 "impala/gpu_device_shm.impala"
        int _34854;
        _34854 = 1 + _34848;
        #line 43 "impala/gaussian.impala"
        int _34855;
        _34855 = _34848 + v_anchor_34664;
        #line 90 "impala/gpu_device_shm.impala"
        double* i_34856;
        i_34856 = reserve_shared_34662 + _34855;
        #line 86 "impala/gpu_device_shm.impala"
        int _34861;
        _34861 = _34859 + _34860;
        #line 91 "impala/gpu_device_shm.impala"
        double _34857;
        _34857 = *i_34856;
        #line 86 "impala/gpu_device_shm.impala"
        int _34862;
        _34862 = _34861 * shm_dimx_34675;
        #line 91 "impala/gpu_device_shm.impala"
        double _34869;
        _34869 = _34857;
        #line 86 "impala/gpu_device_shm.impala"
        int _34863;
        _34863 = _34862 + gid_x_34684;
        #line 86 "impala/gpu_device_shm.impala"
        int _34865;
        _34865 = _34863 + _34864;
        #line 86 "impala/gpu_device_shm.impala"
        double* _34866;
        _34866 = reserve_shared_34659 + _34865;
        #line 86 "impala/gpu_device_shm.impala"
        double _34867;
        _34867 = *_34866;
        #line 86 "impala/gpu_device_shm.impala"
        double _34870;
        _34870 = _34867;
        #line 43 "impala/gaussian.impala"
        double _34871;
        _34871 = _34869 * _34870;
        #line 43 "impala/gaussian.impala"
        double _34872;
        _34872 = sum_34850 + _34871;
        #line 27 "impala/gpu_device_shm.impala"
        p_34848 = _34854;
        psum_34850 = _34872;
        goto l34847;
    l34805: ;
        #line 262 "impala/gpu_device_shm.impala"
        int shm_index_y_34814;
        shm_index_y_34814 = tidy_34656 + _34802;
        #line 265 "impala/gpu_device_shm.impala"
        bool _34815;
        _34815 = shm_index_y_34814 < _34663;
        #line 267 "impala/gpu_device_shm.impala"
        int _34820;
        _34820 = shm_index_y_34814 * _34672;
        #line 52 "impala/gpu_device_shm.impala"
        p_34807 = 0;
        goto l34806;
    l34806: ;
        _34807 = p_34807;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34809;
        _34809 = _34807 < _34672;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34809) goto l34810; else goto l34831;
    l34831: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34832;
        _34832 = _34802 + bdimy_34644;
        #line 52 "impala/gpu_device_shm.impala"
        p_34802 = _34832;
        goto l34801;
    l34810: ;
        #line 260 "impala/gpu_device_shm.impala"
        int shm_index_x_34811;
        shm_index_x_34811 = tidx_34653 + _34807;
        #line 265 "impala/gpu_device_shm.impala"
        bool _34812;
        _34812 = shm_index_x_34811 < _34672;
        #line 265 "impala/gpu_device_shm.impala"
        if (_34812) goto l34813; else goto l34830;
    l34830: ;
        #line 269 "impala/gpu_device_shm.impala"
        goto l34829;
    l34813: ;
        #line 265 "impala/gpu_device_shm.impala"
        if (_34815) goto l34816; else goto l34828;
    l34828: ;
        #line 269 "impala/gpu_device_shm.impala"
        goto l34829;
    l34829: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34817;
    l34816: ;
        #line 267 "impala/gpu_device_shm.impala"
        int _34821;
        _34821 = _34820 + shm_index_x_34811;
        #line 267 "impala/gpu_device_shm.impala"
        double* _34825;
        _34825 = reserve_shared_34662 + _34821;
        #line 267 "impala/gpu_device_shm.impala"
        double* _34822;
        _34822 = _28615_34636 + _34821;
        #line 268 "impala/gpu_device_shm.impala"
        double _34823;
        _34823 = *_34822;
        #line 268 "impala/gpu_device_shm.impala"
        double _34826;
        _34826 = _34823;
        #line 267 "impala/gpu_device_shm.impala"
        *_34825 = _34826;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34817;
    l34817: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34819;
        _34819 = _34807 + bdimx_34641;
        #line 52 "impala/gpu_device_shm.impala"
        p_34807 = _34819;
        goto l34806;
    l34780: ;
        #line 260 "impala/gpu_device_shm.impala"
        int shm_index_x_34781;
        shm_index_x_34781 = tidx_34653 + _34777;
        #line 265 "impala/gpu_device_shm.impala"
        bool _34782;
        _34782 = shm_index_x_34781 < _34672;
        #line 265 "impala/gpu_device_shm.impala"
        if (_34782) goto l34783; else goto l34799;
    l34799: ;
        #line 269 "impala/gpu_device_shm.impala"
        goto l34798;
    l34783: ;
        #line 265 "impala/gpu_device_shm.impala"
        if (_34784) goto l34785; else goto l34797;
    l34797: ;
        #line 269 "impala/gpu_device_shm.impala"
        goto l34798;
    l34798: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34786;
    l34785: ;
        #line 267 "impala/gpu_device_shm.impala"
        int _34790;
        _34790 = _34789 + shm_index_x_34781;
        #line 267 "impala/gpu_device_shm.impala"
        double* _34794;
        _34794 = reserve_shared_34662 + _34790;
        #line 267 "impala/gpu_device_shm.impala"
        double* _34791;
        _34791 = _28615_34636 + _34790;
        #line 268 "impala/gpu_device_shm.impala"
        double _34792;
        _34792 = *_34791;
        #line 268 "impala/gpu_device_shm.impala"
        double _34795;
        _34795 = _34792;
        #line 267 "impala/gpu_device_shm.impala"
        *_34794 = _34795;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34786;
    l34786: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34788;
        _34788 = _34777 + bdimx_34641;
        #line 52 "impala/gpu_device_shm.impala"
        p_34777 = _34788;
        goto l34776;
    l34726: ;
        #line 243 "impala/gpu_device_shm.impala"
        int img_index_y_34743;
        img_index_y_34743 = _34694 + _34723;
        #line 249 "impala/gpu_device_shm.impala"
        int _34751;
        _34751 = img_index_y_34743 * _34689;
        #line 236 "impala/gpu_device_shm.impala"
        int shm_index_y_34735;
        shm_index_y_34735 = tidy_34656 + _34723;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34746;
        _34746 = img_index_y_34743 < _34697;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34744;
        _34744 = 0 <= img_index_y_34743;
        #line 248 "impala/gpu_device_shm.impala"
        int _34756;
        _34756 = shm_index_y_34735 * shm_dimx_34675;
        #line 239 "impala/gpu_device_shm.impala"
        bool _34736;
        _34736 = shm_index_y_34735 < shm_dimy_34666;
        #line 52 "impala/gpu_device_shm.impala"
        p_34728 = 0;
        goto l34727;
    l34727: ;
        _34728 = p_34728;
        #line 52 "impala/gpu_device_shm.impala"
        bool _34730;
        _34730 = _34728 < shm_dimx_34675;
        #line 52 "impala/gpu_device_shm.impala"
        if (_34730) goto l34731; else goto l34769;
    l34769: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34770;
        _34770 = _34723 + bdimy_34644;
        #line 52 "impala/gpu_device_shm.impala"
        p_34723 = _34770;
        goto l34722;
    l34731: ;
        #line 234 "impala/gpu_device_shm.impala"
        int shm_index_x_34732;
        shm_index_x_34732 = tidx_34653 + _34728;
        #line 239 "impala/gpu_device_shm.impala"
        bool _34733;
        _34733 = shm_index_x_34732 < shm_dimx_34675;
        #line 239 "impala/gpu_device_shm.impala"
        if (_34733) goto l34734; else goto l34768;
    l34768: ;
        #line 251 "impala/gpu_device_shm.impala"
        goto l34767;
    l34734: ;
        #line 239 "impala/gpu_device_shm.impala"
        if (_34736) goto l34737; else goto l34766;
    l34766: ;
        #line 251 "impala/gpu_device_shm.impala"
        goto l34767;
    l34767: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34748;
    l34737: ;
        #line 241 "impala/gpu_device_shm.impala"
        int img_index_x_34738;
        img_index_x_34738 = _34685 + _34728;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34739;
        _34739 = 0 <= img_index_x_34738;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34739) goto l34740; else goto l34765;
    l34765: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34762;
    l34740: ;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34741;
        _34741 = img_index_x_34738 < _34689;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34741) goto l34742; else goto l34764;
    l34764: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34762;
    l34742: ;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34744) goto l34745; else goto l34763;
    l34763: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34762;
    l34745: ;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34746) goto l34747; else goto l34761;
    l34761: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34762;
    l34762: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34748;
    l34747: ;
        #line 249 "impala/gpu_device_shm.impala"
        int _34752;
        _34752 = _34751 + img_index_x_34738;
        #line 249 "impala/gpu_device_shm.impala"
        double* _34753;
        _34753 = _28617_34638 + _34752;
        #line 248 "impala/gpu_device_shm.impala"
        int _34757;
        _34757 = _34756 + shm_index_x_34732;
        #line 249 "impala/gpu_device_shm.impala"
        double _34754;
        _34754 = *_34753;
        #line 248 "impala/gpu_device_shm.impala"
        double* _34758;
        _34758 = reserve_shared_34659 + _34757;
        #line 249 "impala/gpu_device_shm.impala"
        double _34759;
        _34759 = _34754;
        #line 248 "impala/gpu_device_shm.impala"
        *_34758 = _34759;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34748;
    l34748: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34750;
        _34750 = _34728 + bdimx_34641;
        #line 52 "impala/gpu_device_shm.impala"
        p_34728 = _34750;
        goto l34727;
    l34677: ;
        #line 234 "impala/gpu_device_shm.impala"
        int shm_index_x_34678;
        shm_index_x_34678 = tidx_34653 + _34670;
        #line 239 "impala/gpu_device_shm.impala"
        bool _34679;
        _34679 = shm_index_x_34678 < shm_dimx_34675;
        #line 239 "impala/gpu_device_shm.impala"
        if (_34679) goto l34680; else goto l34720;
    l34720: ;
        #line 251 "impala/gpu_device_shm.impala"
        goto l34719;
    l34680: ;
        #line 239 "impala/gpu_device_shm.impala"
        if (_34681) goto l34682; else goto l34718;
    l34718: ;
        #line 251 "impala/gpu_device_shm.impala"
        goto l34719;
    l34719: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34700;
    l34682: ;
        #line 241 "impala/gpu_device_shm.impala"
        int img_index_x_34686;
        img_index_x_34686 = _34685 + _34670;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34687;
        _34687 = 0 <= img_index_x_34686;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34687) goto l34688; else goto l34717;
    l34717: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34714;
    l34688: ;
        #line 246 "impala/gpu_device_shm.impala"
        bool _34690;
        _34690 = img_index_x_34686 < _34689;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34690) goto l34691; else goto l34716;
    l34716: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34714;
    l34691: ;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34695) goto l34696; else goto l34715;
    l34715: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34714;
    l34696: ;
        #line 246 "impala/gpu_device_shm.impala"
        if (_34698) goto l34699; else goto l34713;
    l34713: ;
        #line 250 "impala/gpu_device_shm.impala"
        goto l34714;
    l34714: ;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34700;
    l34699: ;
        #line 249 "impala/gpu_device_shm.impala"
        int _34704;
        _34704 = _34703 + img_index_x_34686;
        #line 248 "impala/gpu_device_shm.impala"
        int _34709;
        _34709 = _34708 + shm_index_x_34678;
        #line 249 "impala/gpu_device_shm.impala"
        double* _34705;
        _34705 = _28617_34638 + _34704;
        #line 248 "impala/gpu_device_shm.impala"
        double* _34710;
        _34710 = reserve_shared_34659 + _34709;
        #line 249 "impala/gpu_device_shm.impala"
        double _34706;
        _34706 = *_34705;
        #line 249 "impala/gpu_device_shm.impala"
        double _34711;
        _34711 = _34706;
        #line 248 "impala/gpu_device_shm.impala"
        *_34710 = _34711;
        #line 54 "impala/gpu_device_shm.impala"
        goto l34700;
    l34700: ;
        #line 56 "impala/gpu_device_shm.impala"
        int _34702;
        _34702 = _34670 + bdimx_34641;
        #line 52 "impala/gpu_device_shm.impala"
        p_34670 = _34702;
        goto l34669;
}

}