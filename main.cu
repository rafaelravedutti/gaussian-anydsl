extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_6429;
typedef struct {
    struct_Buffer_6429 e0;
    struct_Buffer_6429 e1;
    int e2;
    int e3;
} struct_image_6428;
typedef struct {
    struct_Buffer_6429 e0;
    int e1;
    int e2;
} struct_filter_6434;

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
__global__ void lambda_26808(struct_image_6428, double*, struct_Buffer_6429, struct_filter_6434);
__global__ void lambda_27103(struct_image_6428, double*, struct_Buffer_6429, double*, struct_filter_6434);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_26808(struct_image_6428 _26811_32339, double* _26812_32340, struct_Buffer_6429 _26813_32341, struct_filter_6434 _26814_32342) {
    int  _32348;
    int p_32348;
    int  _32354;
    int p_32354;
    int  _32360;
    int p_32360;
    int  _32366;
    int p_32366;
    int  _32372;
    int p_32372;
    int  _32378;
    int p_32378;
    int  _32381;
    int p_32381;
    int  _32384;
    int p_32384;
    double*  reserve_shared_32392;
    double* preserve_shared_32392;
    int  _32395;
    int p_32395;
    int  _32398;
    int p_32398;
    int  _32401;
    int p_32401;
    int  _32404;
    int p_32404;
    int  _32407;
    int p_32407;
    int  _32419;
    int p_32419;
    int  _32421;
    int p_32421;
    int  _32483;
    int p_32483;
    int  _32558;
    int p_32558;
    double  sum_32560;
    double psum_32560;
    int  _32489;
    int p_32489;
    int  _32491;
    int p_32491;
    int  _32497;
    int p_32497;
    int  _32500;
    int p_32500;
    int  _32432;
    int p_32432;
    int  _32435;
    int p_32435;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _32348 = blockIdx_x();
    p_32348 = _32348;
    l32346: ;
        _32348 = p_32348;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32354 = blockDim_x();
        p_32354 = _32354;
    l32352: ;
        _32354 = p_32354;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32360 = threadIdx_x();
        p_32360 = _32360;
    l32358: ;
        _32360 = p_32360;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32366 = blockIdx_y();
        p_32366 = _32366;
    l32364: ;
        _32366 = p_32366;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32372 = blockDim_y();
        p_32372 = _32372;
    l32370: ;
        _32372 = p_32372;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32378 = threadIdx_y();
        p_32378 = _32378;
    l32376: ;
        _32378 = p_32378;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32381 = blockDim_x();
        p_32381 = _32381;
    l32379: ;
        _32381 = p_32381;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32384 = blockDim_y();
        p_32384 = _32384;
    l32382: ;
        _32384 = p_32384;
        #line 191 "gpu_device_shm.impala"
        __shared__ double reserver_reserve_shared_32392[938];
        preserve_shared_32392 = reserver_reserve_shared_32392;
    l32390: ;
        reserve_shared_32392 = preserve_shared_32392;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32395 = blockIdx_x();
        p_32395 = _32395;
    l32393: ;
        _32395 = p_32395;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32398 = blockDim_x();
        p_32398 = _32398;
    l32396: ;
        _32398 = p_32398;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32401 = blockIdx_y();
        p_32401 = _32401;
    l32399: ;
        _32401 = p_32401;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32404 = blockDim_y();
        p_32404 = _32404;
    l32402: ;
        _32404 = p_32404;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32407 = blockDim_y();
        p_32407 = _32407;
    l32405: ;
        _32407 = p_32407;
        #line 177 "gpu_device_shm.impala"
        int _32441;
        _32441 = _32348 * _32354;
        #line 11 "main.impala"
        int _32456;
        _32456 = _26811_32339.e3;
        #line 183 "gpu_device_shm.impala"
        int _32411;
        _32411 = _26814_32342.e2;
        #line 179 "gpu_device_shm.impala"
        int _32450;
        _32450 = _32366 * _32372;
        #line 11 "main.impala"
        int _32447;
        _32447 = _26811_32339.e2;
        #line 4 "gaussian.impala"
        int _32424;
        _32424 = _26814_32342.e1;
        #line 177 "gpu_device_shm.impala"
        int gid_x_32442;
        gid_x_32442 = _32441 + _32360;
        #line 183 "gpu_device_shm.impala"
        int extend_height_32412;
        extend_height_32412 = _32411 / 2;
        #line 179 "gpu_device_shm.impala"
        int gid_y_32451;
        gid_y_32451 = _32450 + _32378;
        #line 4 "gaussian.impala"
        int h_anchor_32425;
        h_anchor_32425 = _32424 / 2;
        #line 187 "gpu_device_shm.impala"
        int _32413;
        _32413 = 2 * extend_height_32412;
        #line 185 "gpu_device_shm.impala"
        int _32426;
        _32426 = 2 * h_anchor_32425;
        #line 187 "gpu_device_shm.impala"
        int shm_dimy_32414;
        shm_dimy_32414 = _32384 + _32413;
        #line 185 "gpu_device_shm.impala"
        int shm_dimx_32427;
        shm_dimx_32427 = _32381 + _32426;
        #line 38 "gpu_device_shm.impala"
        bool _32415;
        _32415 = 0 < shm_dimy_32414;
        #line 38 "gpu_device_shm.impala"
        if (_32415) goto l32416; else goto l32611;
    l32611: ;
        #line 221 "gpu_device_shm.impala"
        goto l32541;
    l32416: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32419 = blockDim_x();
        p_32419 = _32419;
    l32417: ;
        _32419 = p_32419;
        #line 211 "gpu_device_shm.impala"
        int _32452;
        _32452 = gid_y_32451 - extend_height_32412;
        #line 209 "gpu_device_shm.impala"
        int _32443;
        _32443 = gid_x_32442 - h_anchor_32425;
        #line 214 "gpu_device_shm.impala"
        bool _32457;
        _32457 = _32452 < _32456;
        #line 214 "gpu_device_shm.impala"
        bool _32453;
        _32453 = 0 <= _32452;
        #line 217 "gpu_device_shm.impala"
        int _32462;
        _32462 = _32452 * _32447;
        #line 38 "gpu_device_shm.impala"
        p_32421 = 0;
        goto l32420;
    l32420: ;
        _32421 = p_32421;
        #line 38 "gpu_device_shm.impala"
        bool _32428;
        _32428 = _32421 < shm_dimx_32427;
        #line 38 "gpu_device_shm.impala"
        if (_32428) goto l32429; else goto l32481;
    l32481: ;
        #line 38 "gpu_device_shm.impala"
        p_32483 = _32407;
        goto l32482;
    l32482: ;
        _32483 = p_32483;
        #line 38 "gpu_device_shm.impala"
        bool _32485;
        _32485 = _32483 < shm_dimy_32414;
        #line 38 "gpu_device_shm.impala"
        if (_32485) goto l32486; else goto l32540;
    l32540: ;
        #line 221 "gpu_device_shm.impala"
        goto l32541;
    l32541: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        __syncthreads();
    l32546: ;
        #line 227 "gpu_device_shm.impala"
        bool _32548;
        _32548 = gid_x_32442 < _32447;
        #line 227 "gpu_device_shm.impala"
        if (_32548) goto l32549; else goto l32610;
    l32610: ;
        #line 230 "gpu_device_shm.impala"
        goto l32609;
    l32549: ;
        #line 227 "gpu_device_shm.impala"
        bool _32550;
        _32550 = gid_y_32451 < _32456;
        #line 227 "gpu_device_shm.impala"
        if (_32550) goto l32551; else goto l32608;
    l32608: ;
        #line 230 "gpu_device_shm.impala"
        goto l32609;
    l32609: ;
        return ;
    l32551: ;
        #line 17 "gaussian.impala"
        bool _32552;
        _32552 = h_anchor_32425 <= gid_x_32442;
        #line 194 "gpu_device_shm.impala"
        int _32573;
        _32573 = _32401 * _32404;
        #line 194 "gpu_device_shm.impala"
        int _32574;
        _32574 = extend_height_32412 - _32573;
        #line 64 "gpu_device_shm.impala"
        int _32592;
        _32592 = gid_y_32451 * _32447;
        #line 64 "gpu_device_shm.impala"
        int _32593;
        _32593 = _32592 + gid_x_32442;
        #line 193 "gpu_device_shm.impala"
        int _32579;
        _32579 = _32395 * _32398;
        #line 193 "gpu_device_shm.impala"
        int _32580;
        _32580 = h_anchor_32425 - _32579;
        #line 64 "gpu_device_shm.impala"
        char* _32590;
        _32590 = _26813_32341.e1;
        #line 72 "gpu_device_shm.impala"
        int _32575;
        _32575 = gid_y_32451 + _32574;
        #line 64 "gpu_device_shm.impala"
        double* _32591;
        union { double* dst; char* src; } u_32591;
        u_32591.src = _32590;
        _32591 = u_32591.dst;
        #line 72 "gpu_device_shm.impala"
        int _32576;
        _32576 = _32575 * shm_dimx_32427;
        #line 64 "gpu_device_shm.impala"
        double* _32594;
        _32594 = _32591 + _32593;
        #line 17 "gaussian.impala"
        if (_32552) goto l32553; else goto l32607;
    l32607: ;
        #line 27 "gaussian.impala"
        goto l32599;
    l32553: ;
        #line 17 "gaussian.impala"
        int _32554;
        _32554 = _32447 - h_anchor_32425;
        #line 17 "gaussian.impala"
        bool _32555;
        _32555 = gid_x_32442 < _32554;
        #line 17 "gaussian.impala"
        if (_32555) goto l32556; else goto l32598;
    l32598: ;
        #line 27 "gaussian.impala"
        goto l32599;
    l32599: ;
        #line 72 "gpu_device_shm.impala"
        int _32600;
        _32600 = _32576 + gid_x_32442;
        #line 72 "gpu_device_shm.impala"
        int _32601;
        _32601 = _32600 + _32580;
        #line 72 "gpu_device_shm.impala"
        double* _32602;
        _32602 = reserve_shared_32392 + _32601;
        #line 72 "gpu_device_shm.impala"
        double _32603;
        _32603 = *_32602;
        #line 72 "gpu_device_shm.impala"
        double _32605;
        _32605 = _32603;
        #line 64 "gpu_device_shm.impala"
        *_32594 = _32605;
        return ;
    l32556: ;
        #line 19 "gaussian.impala"
        int _32562;
        _32562 = 1 + h_anchor_32425;
        #line 77 "gpu_device_shm.impala"
        struct_Buffer_6429 _32566;
        _32566 = _26814_32342.e0;
        #line 19 "gaussian.impala"
        int _32596;
        _32596 = 0 - h_anchor_32425;
        #line 77 "gpu_device_shm.impala"
        char* _32567;
        _32567 = _32566.e1;
        #line 77 "gpu_device_shm.impala"
        double* _32568;
        union { double* dst; char* src; } u_32568;
        u_32568.src = _32567;
        _32568 = u_32568.dst;
        #line 27 "gpu_device_shm.impala"
        p_32558 = _32596;
        psum_32560 = 0.000000e+00;
        goto l32557;
    l32557: ;
        _32558 = p_32558;
        sum_32560 = psum_32560;
        #line 27 "gpu_device_shm.impala"
        bool _32563;
        _32563 = _32558 < _32562;
        #line 27 "gpu_device_shm.impala"
        if (_32563) goto l32564; else goto l32589;
    l32589: ;
        #line 64 "gpu_device_shm.impala"
        *_32594 = sum_32560;
        return ;
    l32564: ;
        #line 21 "gaussian.impala"
        int _32577;
        _32577 = gid_x_32442 + _32558;
        #line 72 "gpu_device_shm.impala"
        int _32578;
        _32578 = _32576 + _32577;
        #line 21 "gaussian.impala"
        int _32569;
        _32569 = _32558 + h_anchor_32425;
        #line 31 "gpu_device_shm.impala"
        int _32565;
        _32565 = 1 + _32558;
        #line 72 "gpu_device_shm.impala"
        int _32581;
        _32581 = _32578 + _32580;
        #line 76 "gpu_device_shm.impala"
        double* i_32570;
        i_32570 = _32568 + _32569;
        #line 72 "gpu_device_shm.impala"
        double* _32582;
        _32582 = reserve_shared_32392 + _32581;
        #line 77 "gpu_device_shm.impala"
        double _32571;
        _32571 = *i_32570;
        #line 77 "gpu_device_shm.impala"
        double _32585;
        _32585 = _32571;
        #line 72 "gpu_device_shm.impala"
        double _32583;
        _32583 = *_32582;
        #line 72 "gpu_device_shm.impala"
        double _32586;
        _32586 = _32583;
        #line 21 "gaussian.impala"
        double _32587;
        _32587 = _32585 * _32586;
        #line 21 "gaussian.impala"
        double _32588;
        _32588 = sum_32560 + _32587;
        #line 27 "gpu_device_shm.impala"
        p_32558 = _32565;
        psum_32560 = _32588;
        goto l32557;
    l32486: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32489 = blockDim_x();
        p_32489 = _32489;
    l32487: ;
        _32489 = p_32489;
        #line 211 "gpu_device_shm.impala"
        int img_index_y_32512;
        img_index_y_32512 = _32452 + _32483;
        #line 214 "gpu_device_shm.impala"
        bool _32513;
        _32513 = 0 <= img_index_y_32512;
        #line 217 "gpu_device_shm.impala"
        int _32520;
        _32520 = img_index_y_32512 * _32447;
        #line 214 "gpu_device_shm.impala"
        bool _32515;
        _32515 = img_index_y_32512 < _32456;
        #line 38 "gpu_device_shm.impala"
        p_32491 = 0;
        goto l32490;
    l32490: ;
        _32491 = p_32491;
        #line 38 "gpu_device_shm.impala"
        bool _32493;
        _32493 = _32491 < shm_dimx_32427;
        #line 38 "gpu_device_shm.impala"
        if (_32493) goto l32494; else goto l32538;
    l32538: ;
        #line 42 "gpu_device_shm.impala"
        int _32539;
        _32539 = _32483 + _32407;
        #line 38 "gpu_device_shm.impala"
        p_32483 = _32539;
        goto l32482;
    l32494: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32497 = threadIdx_x();
        p_32497 = _32497;
    l32495: ;
        _32497 = p_32497;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32500 = threadIdx_y();
        p_32500 = _32500;
    l32498: ;
        _32500 = p_32500;
        #line 202 "gpu_device_shm.impala"
        int shm_index_x_32501;
        shm_index_x_32501 = _32497 + _32491;
        #line 207 "gpu_device_shm.impala"
        bool _32502;
        _32502 = shm_index_x_32501 < shm_dimx_32427;
        #line 207 "gpu_device_shm.impala"
        if (_32502) goto l32503; else goto l32537;
    l32537: ;
        #line 219 "gpu_device_shm.impala"
        goto l32536;
    l32503: ;
        #line 204 "gpu_device_shm.impala"
        int shm_index_y_32504;
        shm_index_y_32504 = _32500 + _32483;
        #line 207 "gpu_device_shm.impala"
        bool _32505;
        _32505 = shm_index_y_32504 < shm_dimy_32414;
        #line 207 "gpu_device_shm.impala"
        if (_32505) goto l32506; else goto l32535;
    l32535: ;
        #line 219 "gpu_device_shm.impala"
        goto l32536;
    l32536: ;
        #line 40 "gpu_device_shm.impala"
        goto l32517;
    l32506: ;
        #line 209 "gpu_device_shm.impala"
        int img_index_x_32507;
        img_index_x_32507 = _32443 + _32491;
        #line 214 "gpu_device_shm.impala"
        bool _32508;
        _32508 = 0 <= img_index_x_32507;
        #line 214 "gpu_device_shm.impala"
        if (_32508) goto l32509; else goto l32534;
    l32534: ;
        #line 218 "gpu_device_shm.impala"
        goto l32531;
    l32509: ;
        #line 214 "gpu_device_shm.impala"
        bool _32510;
        _32510 = img_index_x_32507 < _32447;
        #line 214 "gpu_device_shm.impala"
        if (_32510) goto l32511; else goto l32533;
    l32533: ;
        #line 218 "gpu_device_shm.impala"
        goto l32531;
    l32511: ;
        #line 214 "gpu_device_shm.impala"
        if (_32513) goto l32514; else goto l32532;
    l32532: ;
        #line 218 "gpu_device_shm.impala"
        goto l32531;
    l32514: ;
        #line 214 "gpu_device_shm.impala"
        if (_32515) goto l32516; else goto l32530;
    l32530: ;
        #line 218 "gpu_device_shm.impala"
        goto l32531;
    l32531: ;
        #line 40 "gpu_device_shm.impala"
        goto l32517;
    l32516: ;
        #line 216 "gpu_device_shm.impala"
        int _32525;
        _32525 = shm_index_y_32504 * shm_dimx_32427;
        #line 217 "gpu_device_shm.impala"
        int _32521;
        _32521 = _32520 + img_index_x_32507;
        #line 216 "gpu_device_shm.impala"
        int _32526;
        _32526 = _32525 + shm_index_x_32501;
        #line 217 "gpu_device_shm.impala"
        double* _32522;
        _32522 = _26812_32340 + _32521;
        #line 216 "gpu_device_shm.impala"
        double* _32527;
        _32527 = reserve_shared_32392 + _32526;
        #line 217 "gpu_device_shm.impala"
        double _32523;
        _32523 = *_32522;
        #line 217 "gpu_device_shm.impala"
        double _32528;
        _32528 = _32523;
        #line 216 "gpu_device_shm.impala"
        *_32527 = _32528;
        #line 40 "gpu_device_shm.impala"
        goto l32517;
    l32517: ;
        #line 42 "gpu_device_shm.impala"
        int _32519;
        _32519 = _32491 + _32489;
        #line 38 "gpu_device_shm.impala"
        p_32491 = _32519;
        goto l32490;
    l32429: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32432 = threadIdx_x();
        p_32432 = _32432;
    l32430: ;
        _32432 = p_32432;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32435 = threadIdx_y();
        p_32435 = _32435;
    l32433: ;
        _32435 = p_32435;
        #line 202 "gpu_device_shm.impala"
        int shm_index_x_32436;
        shm_index_x_32436 = _32432 + _32421;
        #line 207 "gpu_device_shm.impala"
        bool _32437;
        _32437 = shm_index_x_32436 < shm_dimx_32427;
        #line 207 "gpu_device_shm.impala"
        if (_32437) goto l32438; else goto l32480;
    l32480: ;
        #line 219 "gpu_device_shm.impala"
        goto l32479;
    l32438: ;
        #line 207 "gpu_device_shm.impala"
        bool _32439;
        _32439 = _32435 < shm_dimy_32414;
        #line 207 "gpu_device_shm.impala"
        if (_32439) goto l32440; else goto l32478;
    l32478: ;
        #line 219 "gpu_device_shm.impala"
        goto l32479;
    l32479: ;
        #line 40 "gpu_device_shm.impala"
        goto l32459;
    l32440: ;
        #line 209 "gpu_device_shm.impala"
        int img_index_x_32444;
        img_index_x_32444 = _32443 + _32421;
        #line 214 "gpu_device_shm.impala"
        bool _32445;
        _32445 = 0 <= img_index_x_32444;
        #line 214 "gpu_device_shm.impala"
        if (_32445) goto l32446; else goto l32477;
    l32477: ;
        #line 218 "gpu_device_shm.impala"
        goto l32474;
    l32446: ;
        #line 214 "gpu_device_shm.impala"
        bool _32448;
        _32448 = img_index_x_32444 < _32447;
        #line 214 "gpu_device_shm.impala"
        if (_32448) goto l32449; else goto l32476;
    l32476: ;
        #line 218 "gpu_device_shm.impala"
        goto l32474;
    l32449: ;
        #line 214 "gpu_device_shm.impala"
        if (_32453) goto l32454; else goto l32475;
    l32475: ;
        #line 218 "gpu_device_shm.impala"
        goto l32474;
    l32454: ;
        #line 214 "gpu_device_shm.impala"
        if (_32457) goto l32458; else goto l32473;
    l32473: ;
        #line 218 "gpu_device_shm.impala"
        goto l32474;
    l32474: ;
        #line 40 "gpu_device_shm.impala"
        goto l32459;
    l32458: ;
        #line 216 "gpu_device_shm.impala"
        int _32468;
        _32468 = _32435 * shm_dimx_32427;
        #line 217 "gpu_device_shm.impala"
        int _32463;
        _32463 = _32462 + img_index_x_32444;
        #line 216 "gpu_device_shm.impala"
        int _32469;
        _32469 = _32468 + shm_index_x_32436;
        #line 217 "gpu_device_shm.impala"
        double* _32464;
        _32464 = _26812_32340 + _32463;
        #line 217 "gpu_device_shm.impala"
        double _32465;
        _32465 = *_32464;
        #line 216 "gpu_device_shm.impala"
        double* _32470;
        _32470 = reserve_shared_32392 + _32469;
        #line 217 "gpu_device_shm.impala"
        double _32471;
        _32471 = _32465;
        #line 216 "gpu_device_shm.impala"
        *_32470 = _32471;
        #line 40 "gpu_device_shm.impala"
        goto l32459;
    l32459: ;
        #line 42 "gpu_device_shm.impala"
        int _32461;
        _32461 = _32421 + _32419;
        #line 38 "gpu_device_shm.impala"
        p_32421 = _32461;
        goto l32420;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_27103(struct_image_6428 _27106_32615, double* _27107_32616, struct_Buffer_6429 _27108_32617, double* _27109_32618, struct_filter_6434 _27110_32619) {
    int  _32622;
    int p_32622;
    int  _32625;
    int p_32625;
    int  _32628;
    int p_32628;
    int  _32631;
    int p_32631;
    int  _32634;
    int p_32634;
    int  _32637;
    int p_32637;
    int  _32640;
    int p_32640;
    int  _32643;
    int p_32643;
    double*  reserve_shared_32646;
    double* preserve_shared_32646;
    int  _32649;
    int p_32649;
    int  _32652;
    int p_32652;
    int  _32655;
    int p_32655;
    int  _32658;
    int p_32658;
    int  _32661;
    int p_32661;
    int  _32670;
    int p_32670;
    int  _32672;
    int p_32672;
    int  _32731;
    int p_32731;
    int  _32803;
    int p_32803;
    double  sum_32805;
    double psum_32805;
    int  _32737;
    int p_32737;
    int  _32739;
    int p_32739;
    int  _32745;
    int p_32745;
    int  _32748;
    int p_32748;
    int  _32682;
    int p_32682;
    int  _32685;
    int p_32685;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _32622 = blockIdx_x();
    p_32622 = _32622;
    l32620: ;
        _32622 = p_32622;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32625 = blockDim_x();
        p_32625 = _32625;
    l32623: ;
        _32625 = p_32625;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32628 = threadIdx_x();
        p_32628 = _32628;
    l32626: ;
        _32628 = p_32628;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32631 = blockIdx_y();
        p_32631 = _32631;
    l32629: ;
        _32631 = p_32631;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32634 = blockDim_y();
        p_32634 = _32634;
    l32632: ;
        _32634 = p_32634;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32637 = threadIdx_y();
        p_32637 = _32637;
    l32635: ;
        _32637 = p_32637;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32640 = blockDim_x();
        p_32640 = _32640;
    l32638: ;
        _32640 = p_32640;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32643 = blockDim_y();
        p_32643 = _32643;
    l32641: ;
        _32643 = p_32643;
        #line 191 "gpu_device_shm.impala"
        __shared__ double reserver_reserve_shared_32646[938];
        preserve_shared_32646 = reserver_reserve_shared_32646;
    l32644: ;
        reserve_shared_32646 = preserve_shared_32646;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32649 = blockIdx_x();
        p_32649 = _32649;
    l32647: ;
        _32649 = p_32649;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32652 = blockDim_x();
        p_32652 = _32652;
    l32650: ;
        _32652 = p_32652;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32655 = blockIdx_y();
        p_32655 = _32655;
    l32653: ;
        _32655 = p_32655;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32658 = blockDim_y();
        p_32658 = _32658;
    l32656: ;
        _32658 = p_32658;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32661 = blockDim_y();
        p_32661 = _32661;
    l32659: ;
        _32661 = p_32661;
        #line 179 "gpu_device_shm.impala"
        int _32700;
        _32700 = _32631 * _32634;
        #line 11 "main.impala"
        int _32697;
        _32697 = _27106_32615.e2;
        #line 179 "gpu_device_shm.impala"
        int gid_y_32701;
        gid_y_32701 = _32700 + _32637;
        #line 6 "gaussian.impala"
        int _32662;
        _32662 = _27110_32619.e2;
        #line 11 "main.impala"
        int _32705;
        _32705 = _27106_32615.e3;
        #line 6 "gaussian.impala"
        int v_anchor_32663;
        v_anchor_32663 = _32662 / 2;
        #line 177 "gpu_device_shm.impala"
        int _32691;
        _32691 = _32622 * _32625;
        #line 181 "gpu_device_shm.impala"
        int _32674;
        _32674 = _27110_32619.e1;
        #line 187 "gpu_device_shm.impala"
        int _32664;
        _32664 = 2 * v_anchor_32663;
        #line 177 "gpu_device_shm.impala"
        int gid_x_32692;
        gid_x_32692 = _32691 + _32628;
        #line 181 "gpu_device_shm.impala"
        int extend_width_32675;
        extend_width_32675 = _32674 / 2;
        #line 187 "gpu_device_shm.impala"
        int shm_dimy_32665;
        shm_dimy_32665 = _32643 + _32664;
        #line 185 "gpu_device_shm.impala"
        int _32676;
        _32676 = 2 * extend_width_32675;
        #line 38 "gpu_device_shm.impala"
        bool _32666;
        _32666 = 0 < shm_dimy_32665;
        #line 185 "gpu_device_shm.impala"
        int shm_dimx_32677;
        shm_dimx_32677 = _32640 + _32676;
        #line 38 "gpu_device_shm.impala"
        if (_32666) goto l32667; else goto l32856;
    l32856: ;
        #line 221 "gpu_device_shm.impala"
        goto l32789;
    l32667: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32670 = blockDim_x();
        p_32670 = _32670;
    l32668: ;
        _32670 = p_32670;
        #line 211 "gpu_device_shm.impala"
        int _32702;
        _32702 = gid_y_32701 - v_anchor_32663;
        #line 214 "gpu_device_shm.impala"
        bool _32703;
        _32703 = 0 <= _32702;
        #line 209 "gpu_device_shm.impala"
        int _32693;
        _32693 = gid_x_32692 - extend_width_32675;
        #line 214 "gpu_device_shm.impala"
        bool _32706;
        _32706 = _32702 < _32705;
        #line 217 "gpu_device_shm.impala"
        int _32711;
        _32711 = _32702 * _32697;
        #line 38 "gpu_device_shm.impala"
        p_32672 = 0;
        goto l32671;
    l32671: ;
        _32672 = p_32672;
        #line 38 "gpu_device_shm.impala"
        bool _32678;
        _32678 = _32672 < shm_dimx_32677;
        #line 38 "gpu_device_shm.impala"
        if (_32678) goto l32679; else goto l32729;
    l32729: ;
        #line 38 "gpu_device_shm.impala"
        p_32731 = _32661;
        goto l32730;
    l32730: ;
        _32731 = p_32731;
        #line 38 "gpu_device_shm.impala"
        bool _32733;
        _32733 = _32731 < shm_dimy_32665;
        #line 38 "gpu_device_shm.impala"
        if (_32733) goto l32734; else goto l32788;
    l32788: ;
        #line 221 "gpu_device_shm.impala"
        goto l32789;
    l32789: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        __syncthreads();
    l32791: ;
        #line 227 "gpu_device_shm.impala"
        bool _32793;
        _32793 = gid_x_32692 < _32697;
        #line 227 "gpu_device_shm.impala"
        if (_32793) goto l32794; else goto l32855;
    l32855: ;
        #line 230 "gpu_device_shm.impala"
        goto l32854;
    l32794: ;
        #line 227 "gpu_device_shm.impala"
        bool _32795;
        _32795 = gid_y_32701 < _32705;
        #line 227 "gpu_device_shm.impala"
        if (_32795) goto l32796; else goto l32853;
    l32853: ;
        #line 230 "gpu_device_shm.impala"
        goto l32854;
    l32854: ;
        return ;
    l32796: ;
        #line 64 "gpu_device_shm.impala"
        int _32836;
        _32836 = gid_y_32701 * _32697;
        #line 64 "gpu_device_shm.impala"
        char* _32834;
        _32834 = _27108_32617.e1;
        #line 39 "gaussian.impala"
        bool _32797;
        _32797 = v_anchor_32663 <= gid_y_32701;
        #line 193 "gpu_device_shm.impala"
        int _32823;
        _32823 = _32649 * _32652;
        #line 194 "gpu_device_shm.impala"
        int _32818;
        _32818 = _32655 * _32658;
        #line 64 "gpu_device_shm.impala"
        int _32837;
        _32837 = _32836 + gid_x_32692;
        #line 64 "gpu_device_shm.impala"
        double* _32835;
        union { double* dst; char* src; } u_32835;
        u_32835.src = _32834;
        _32835 = u_32835.dst;
        #line 193 "gpu_device_shm.impala"
        int _32824;
        _32824 = extend_width_32675 - _32823;
        #line 194 "gpu_device_shm.impala"
        int _32819;
        _32819 = v_anchor_32663 - _32818;
        #line 64 "gpu_device_shm.impala"
        double* _32838;
        _32838 = _32835 + _32837;
        #line 39 "gaussian.impala"
        if (_32797) goto l32798; else goto l32852;
    l32852: ;
        #line 49 "gaussian.impala"
        goto l32842;
    l32798: ;
        #line 39 "gaussian.impala"
        int _32799;
        _32799 = _32705 - v_anchor_32663;
        #line 39 "gaussian.impala"
        bool _32800;
        _32800 = gid_y_32701 < _32799;
        #line 39 "gaussian.impala"
        if (_32800) goto l32801; else goto l32841;
    l32841: ;
        #line 49 "gaussian.impala"
        goto l32842;
    l32842: ;
        #line 72 "gpu_device_shm.impala"
        int _32843;
        _32843 = gid_y_32701 + _32819;
        #line 72 "gpu_device_shm.impala"
        int _32844;
        _32844 = _32843 * shm_dimx_32677;
        #line 72 "gpu_device_shm.impala"
        int _32845;
        _32845 = _32844 + gid_x_32692;
        #line 72 "gpu_device_shm.impala"
        int _32846;
        _32846 = _32845 + _32824;
        #line 72 "gpu_device_shm.impala"
        double* _32847;
        _32847 = reserve_shared_32646 + _32846;
        #line 72 "gpu_device_shm.impala"
        double _32848;
        _32848 = *_32847;
        #line 72 "gpu_device_shm.impala"
        double _32850;
        _32850 = _32848;
        #line 64 "gpu_device_shm.impala"
        *_32838 = _32850;
        return ;
    l32801: ;
        #line 77 "gpu_device_shm.impala"
        struct_Buffer_6429 _32810;
        _32810 = _27110_32619.e0;
        #line 41 "gaussian.impala"
        int _32806;
        _32806 = 1 + v_anchor_32663;
        #line 41 "gaussian.impala"
        int _32840;
        _32840 = 0 - v_anchor_32663;
        #line 77 "gpu_device_shm.impala"
        char* _32811;
        _32811 = _32810.e1;
        #line 77 "gpu_device_shm.impala"
        double* _32812;
        union { double* dst; char* src; } u_32812;
        u_32812.src = _32811;
        _32812 = u_32812.dst;
        #line 27 "gpu_device_shm.impala"
        p_32803 = _32840;
        psum_32805 = 0.000000e+00;
        goto l32802;
    l32802: ;
        _32803 = p_32803;
        sum_32805 = psum_32805;
        #line 27 "gpu_device_shm.impala"
        bool _32807;
        _32807 = _32803 < _32806;
        #line 27 "gpu_device_shm.impala"
        if (_32807) goto l32808; else goto l32833;
    l32833: ;
        #line 64 "gpu_device_shm.impala"
        *_32838 = sum_32805;
        return ;
    l32808: ;
        #line 43 "gaussian.impala"
        int _32813;
        _32813 = _32803 + v_anchor_32663;
        #line 43 "gaussian.impala"
        int _32817;
        _32817 = gid_y_32701 + _32803;
        #line 31 "gpu_device_shm.impala"
        int _32809;
        _32809 = 1 + _32803;
        #line 76 "gpu_device_shm.impala"
        double* i_32814;
        i_32814 = _32812 + _32813;
        #line 72 "gpu_device_shm.impala"
        int _32820;
        _32820 = _32817 + _32819;
        #line 77 "gpu_device_shm.impala"
        double _32815;
        _32815 = *i_32814;
        #line 72 "gpu_device_shm.impala"
        int _32821;
        _32821 = _32820 * shm_dimx_32677;
        #line 77 "gpu_device_shm.impala"
        double _32829;
        _32829 = _32815;
        #line 72 "gpu_device_shm.impala"
        int _32822;
        _32822 = _32821 + gid_x_32692;
        #line 72 "gpu_device_shm.impala"
        int _32825;
        _32825 = _32822 + _32824;
        #line 72 "gpu_device_shm.impala"
        double* _32826;
        _32826 = reserve_shared_32646 + _32825;
        #line 72 "gpu_device_shm.impala"
        double _32827;
        _32827 = *_32826;
        #line 72 "gpu_device_shm.impala"
        double _32830;
        _32830 = _32827;
        #line 43 "gaussian.impala"
        double _32831;
        _32831 = _32829 * _32830;
        #line 43 "gaussian.impala"
        double _32832;
        _32832 = sum_32805 + _32831;
        #line 27 "gpu_device_shm.impala"
        p_32803 = _32809;
        psum_32805 = _32832;
        goto l32802;
    l32734: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32737 = blockDim_x();
        p_32737 = _32737;
    l32735: ;
        _32737 = p_32737;
        #line 211 "gpu_device_shm.impala"
        int img_index_y_32760;
        img_index_y_32760 = _32702 + _32731;
        #line 214 "gpu_device_shm.impala"
        bool _32761;
        _32761 = 0 <= img_index_y_32760;
        #line 217 "gpu_device_shm.impala"
        int _32768;
        _32768 = img_index_y_32760 * _32697;
        #line 214 "gpu_device_shm.impala"
        bool _32763;
        _32763 = img_index_y_32760 < _32705;
        #line 38 "gpu_device_shm.impala"
        p_32739 = 0;
        goto l32738;
    l32738: ;
        _32739 = p_32739;
        #line 38 "gpu_device_shm.impala"
        bool _32741;
        _32741 = _32739 < shm_dimx_32677;
        #line 38 "gpu_device_shm.impala"
        if (_32741) goto l32742; else goto l32786;
    l32786: ;
        #line 42 "gpu_device_shm.impala"
        int _32787;
        _32787 = _32731 + _32661;
        #line 38 "gpu_device_shm.impala"
        p_32731 = _32787;
        goto l32730;
    l32742: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32745 = threadIdx_x();
        p_32745 = _32745;
    l32743: ;
        _32745 = p_32745;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32748 = threadIdx_y();
        p_32748 = _32748;
    l32746: ;
        _32748 = p_32748;
        #line 202 "gpu_device_shm.impala"
        int shm_index_x_32749;
        shm_index_x_32749 = _32745 + _32739;
        #line 207 "gpu_device_shm.impala"
        bool _32750;
        _32750 = shm_index_x_32749 < shm_dimx_32677;
        #line 207 "gpu_device_shm.impala"
        if (_32750) goto l32751; else goto l32785;
    l32785: ;
        #line 219 "gpu_device_shm.impala"
        goto l32784;
    l32751: ;
        #line 204 "gpu_device_shm.impala"
        int shm_index_y_32752;
        shm_index_y_32752 = _32748 + _32731;
        #line 207 "gpu_device_shm.impala"
        bool _32753;
        _32753 = shm_index_y_32752 < shm_dimy_32665;
        #line 207 "gpu_device_shm.impala"
        if (_32753) goto l32754; else goto l32783;
    l32783: ;
        #line 219 "gpu_device_shm.impala"
        goto l32784;
    l32784: ;
        #line 40 "gpu_device_shm.impala"
        goto l32765;
    l32754: ;
        #line 209 "gpu_device_shm.impala"
        int img_index_x_32755;
        img_index_x_32755 = _32693 + _32739;
        #line 214 "gpu_device_shm.impala"
        bool _32756;
        _32756 = 0 <= img_index_x_32755;
        #line 214 "gpu_device_shm.impala"
        if (_32756) goto l32757; else goto l32782;
    l32782: ;
        #line 218 "gpu_device_shm.impala"
        goto l32779;
    l32757: ;
        #line 214 "gpu_device_shm.impala"
        bool _32758;
        _32758 = img_index_x_32755 < _32697;
        #line 214 "gpu_device_shm.impala"
        if (_32758) goto l32759; else goto l32781;
    l32781: ;
        #line 218 "gpu_device_shm.impala"
        goto l32779;
    l32759: ;
        #line 214 "gpu_device_shm.impala"
        if (_32761) goto l32762; else goto l32780;
    l32780: ;
        #line 218 "gpu_device_shm.impala"
        goto l32779;
    l32762: ;
        #line 214 "gpu_device_shm.impala"
        if (_32763) goto l32764; else goto l32778;
    l32778: ;
        #line 218 "gpu_device_shm.impala"
        goto l32779;
    l32779: ;
        #line 40 "gpu_device_shm.impala"
        goto l32765;
    l32764: ;
        #line 216 "gpu_device_shm.impala"
        int _32773;
        _32773 = shm_index_y_32752 * shm_dimx_32677;
        #line 217 "gpu_device_shm.impala"
        int _32769;
        _32769 = _32768 + img_index_x_32755;
        #line 216 "gpu_device_shm.impala"
        int _32774;
        _32774 = _32773 + shm_index_x_32749;
        #line 217 "gpu_device_shm.impala"
        double* _32770;
        _32770 = _27109_32618 + _32769;
        #line 216 "gpu_device_shm.impala"
        double* _32775;
        _32775 = reserve_shared_32646 + _32774;
        #line 217 "gpu_device_shm.impala"
        double _32771;
        _32771 = *_32770;
        #line 217 "gpu_device_shm.impala"
        double _32776;
        _32776 = _32771;
        #line 216 "gpu_device_shm.impala"
        *_32775 = _32776;
        #line 40 "gpu_device_shm.impala"
        goto l32765;
    l32765: ;
        #line 42 "gpu_device_shm.impala"
        int _32767;
        _32767 = _32739 + _32737;
        #line 38 "gpu_device_shm.impala"
        p_32739 = _32767;
        goto l32738;
    l32679: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32682 = threadIdx_x();
        p_32682 = _32682;
    l32680: ;
        _32682 = p_32682;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _32685 = threadIdx_y();
        p_32685 = _32685;
    l32683: ;
        _32685 = p_32685;
        #line 202 "gpu_device_shm.impala"
        int shm_index_x_32686;
        shm_index_x_32686 = _32682 + _32672;
        #line 207 "gpu_device_shm.impala"
        bool _32687;
        _32687 = shm_index_x_32686 < shm_dimx_32677;
        #line 207 "gpu_device_shm.impala"
        if (_32687) goto l32688; else goto l32728;
    l32728: ;
        #line 219 "gpu_device_shm.impala"
        goto l32727;
    l32688: ;
        #line 207 "gpu_device_shm.impala"
        bool _32689;
        _32689 = _32685 < shm_dimy_32665;
        #line 207 "gpu_device_shm.impala"
        if (_32689) goto l32690; else goto l32726;
    l32726: ;
        #line 219 "gpu_device_shm.impala"
        goto l32727;
    l32727: ;
        #line 40 "gpu_device_shm.impala"
        goto l32708;
    l32690: ;
        #line 209 "gpu_device_shm.impala"
        int img_index_x_32694;
        img_index_x_32694 = _32693 + _32672;
        #line 214 "gpu_device_shm.impala"
        bool _32695;
        _32695 = 0 <= img_index_x_32694;
        #line 214 "gpu_device_shm.impala"
        if (_32695) goto l32696; else goto l32725;
    l32725: ;
        #line 218 "gpu_device_shm.impala"
        goto l32722;
    l32696: ;
        #line 214 "gpu_device_shm.impala"
        bool _32698;
        _32698 = img_index_x_32694 < _32697;
        #line 214 "gpu_device_shm.impala"
        if (_32698) goto l32699; else goto l32724;
    l32724: ;
        #line 218 "gpu_device_shm.impala"
        goto l32722;
    l32699: ;
        #line 214 "gpu_device_shm.impala"
        if (_32703) goto l32704; else goto l32723;
    l32723: ;
        #line 218 "gpu_device_shm.impala"
        goto l32722;
    l32704: ;
        #line 214 "gpu_device_shm.impala"
        if (_32706) goto l32707; else goto l32721;
    l32721: ;
        #line 218 "gpu_device_shm.impala"
        goto l32722;
    l32722: ;
        #line 40 "gpu_device_shm.impala"
        goto l32708;
    l32707: ;
        #line 217 "gpu_device_shm.impala"
        int _32712;
        _32712 = _32711 + img_index_x_32694;
        #line 216 "gpu_device_shm.impala"
        int _32716;
        _32716 = _32685 * shm_dimx_32677;
        #line 217 "gpu_device_shm.impala"
        double* _32713;
        _32713 = _27109_32618 + _32712;
        #line 216 "gpu_device_shm.impala"
        int _32717;
        _32717 = _32716 + shm_index_x_32686;
        #line 217 "gpu_device_shm.impala"
        double _32714;
        _32714 = *_32713;
        #line 216 "gpu_device_shm.impala"
        double* _32718;
        _32718 = reserve_shared_32646 + _32717;
        #line 217 "gpu_device_shm.impala"
        double _32719;
        _32719 = _32714;
        #line 216 "gpu_device_shm.impala"
        *_32718 = _32719;
        #line 40 "gpu_device_shm.impala"
        goto l32708;
    l32708: ;
        #line 42 "gpu_device_shm.impala"
        int _32710;
        _32710 = _32672 + _32670;
        #line 38 "gpu_device_shm.impala"
        p_32672 = _32710;
        goto l32671;
}

}