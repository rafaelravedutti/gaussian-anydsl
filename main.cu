extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_6445;
typedef struct {
    struct_Buffer_6445 e0;
    struct_Buffer_6445 e1;
    struct_Buffer_6445 e2;
    int e3;
    int e4;
} struct_image_6444;
typedef struct {
    struct_Buffer_6445 e0;
    int e1;
    int e2;
} struct_filter_6450;

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
__global__ void lambda_26231(struct_image_6444, double*, struct_filter_6450, struct_Buffer_6445);
__global__ void lambda_26506(struct_image_6444, double*, struct_filter_6450, struct_Buffer_6445, double*, struct_Buffer_6445);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_26231(struct_image_6444 _26234_31341, double* _26235_31342, struct_filter_6450 _26236_31343, struct_Buffer_6445 _26237_31344) {
    int  _31350;
    int p_31350;
    int  _31356;
    int p_31356;
    int  _31362;
    int p_31362;
    int  _31368;
    int p_31368;
    int  _31374;
    int p_31374;
    int  _31380;
    int p_31380;
    double*  shared_31388;
    double* pshared_31388;
    int  _31391;
    int p_31391;
    int  _31394;
    int p_31394;
    int  _31405;
    int p_31405;
    int  _31408;
    int p_31408;
    int  _31410;
    int p_31410;
    int  _31469;
    int p_31469;
    int  _31546;
    int p_31546;
    double  sum_31548;
    double psum_31548;
    int  _31475;
    int p_31475;
    int  _31478;
    int p_31478;
    int  _31480;
    int p_31480;
    int  _31497;
    int p_31497;
    int  _31500;
    int p_31500;
    int  _31503;
    int p_31503;
    int  _31439;
    int p_31439;
    int  _31442;
    int p_31442;
    int  _31445;
    int p_31445;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _31350 = blockIdx_x();
    p_31350 = _31350;
    l31348: ;
        _31350 = p_31350;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31356 = blockDim_x();
        p_31356 = _31356;
    l31354: ;
        _31356 = p_31356;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31362 = threadIdx_x();
        p_31362 = _31362;
    l31360: ;
        _31362 = p_31362;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31368 = blockIdx_y();
        p_31368 = _31368;
    l31366: ;
        _31368 = p_31368;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31374 = blockDim_y();
        p_31374 = _31374;
    l31372: ;
        _31374 = p_31374;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31380 = threadIdx_y();
        p_31380 = _31380;
    l31378: ;
        _31380 = p_31380;
        #line 160 "gpu_device_shm.impala"
        __shared__ double reserver_shared_31388[2130];
        pshared_31388 = reserver_shared_31388;
    l31386: ;
        shared_31388 = pshared_31388;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31391 = blockDim_y();
        p_31391 = _31391;
    l31389: ;
        _31391 = p_31391;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31394 = blockDim_y();
        p_31394 = _31394;
    l31392: ;
        _31394 = p_31394;
        #line 158 "gpu_device_shm.impala"
        int _31428;
        _31428 = _31368 * _31374;
        #line 163 "gpu_device_shm.impala"
        int _31398;
        _31398 = _26236_31343.e2;
        #line 11 "main.impala"
        int _31425;
        _31425 = _26234_31341.e3;
        #line 158 "gpu_device_shm.impala"
        int gid_y_31429;
        gid_y_31429 = _31428 + _31380;
        #line 156 "gpu_device_shm.impala"
        int _31418;
        _31418 = _31350 * _31356;
        #line 156 "gpu_device_shm.impala"
        int gid_x_31419;
        gid_x_31419 = _31418 + _31362;
        #line 11 "main.impala"
        int _31434;
        _31434 = _26234_31341.e4;
        #line 4 "gaussian.impala"
        int _31413;
        _31413 = _26236_31343.e1;
        #line 163 "gpu_device_shm.impala"
        int _31399;
        _31399 = 2 * _31398;
        #line 163 "gpu_device_shm.impala"
        int _31400;
        _31400 = _31391 + _31399;
        #line 31 "gpu_device_shm.impala"
        bool _31401;
        _31401 = 0 < _31400;
        #line 31 "gpu_device_shm.impala"
        if (_31401) goto l31402; else goto l31593;
    l31593: ;
        #line 172 "gpu_device_shm.impala"
        goto l31528;
    l31402: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31405 = blockDim_x();
        p_31405 = _31405;
    l31403: ;
        _31405 = p_31405;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31408 = blockDim_x();
        p_31408 = _31408;
    l31406: ;
        _31408 = p_31408;
        #line 165 "gpu_device_shm.impala"
        int _31420;
        _31420 = gid_x_31419 - _31413;
        #line 166 "gpu_device_shm.impala"
        int _31430;
        _31430 = gid_y_31429 - _31398;
        #line 164 "gpu_device_shm.impala"
        int _31414;
        _31414 = 2 * _31413;
        #line 168 "gpu_device_shm.impala"
        bool _31431;
        _31431 = 0 <= _31430;
        #line 168 "gpu_device_shm.impala"
        bool _31435;
        _31435 = _31430 < _31434;
        #line 164 "gpu_device_shm.impala"
        int _31415;
        _31415 = _31405 + _31414;
        #line 169 "gpu_device_shm.impala"
        int _31449;
        _31449 = _31430 * _31425;
        #line 31 "gpu_device_shm.impala"
        p_31410 = 0;
        goto l31409;
    l31409: ;
        _31410 = p_31410;
        #line 31 "gpu_device_shm.impala"
        bool _31416;
        _31416 = _31410 < _31415;
        #line 31 "gpu_device_shm.impala"
        if (_31416) goto l31417; else goto l31467;
    l31467: ;
        #line 31 "gpu_device_shm.impala"
        p_31469 = _31394;
        goto l31468;
    l31468: ;
        _31469 = p_31469;
        #line 31 "gpu_device_shm.impala"
        bool _31471;
        _31471 = _31469 < _31400;
        #line 31 "gpu_device_shm.impala"
        if (_31471) goto l31472; else goto l31527;
    l31527: ;
        #line 172 "gpu_device_shm.impala"
        goto l31528;
    l31528: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        __syncthreads();
    l31533: ;
        #line 178 "gpu_device_shm.impala"
        bool _31535;
        _31535 = gid_x_31419 < _31425;
        #line 178 "gpu_device_shm.impala"
        if (_31535) goto l31536; else goto l31592;
    l31592: ;
        #line 181 "gpu_device_shm.impala"
        goto l31591;
    l31536: ;
        #line 178 "gpu_device_shm.impala"
        bool _31537;
        _31537 = gid_y_31429 < _31434;
        #line 178 "gpu_device_shm.impala"
        if (_31537) goto l31538; else goto l31590;
    l31590: ;
        #line 181 "gpu_device_shm.impala"
        goto l31591;
    l31591: ;
        return ;
    l31538: ;
        #line 4 "gaussian.impala"
        int h_anchor_31539;
        h_anchor_31539 = _31413 / 2;
        #line 62 "gpu_device_shm.impala"
        struct_Buffer_6445 _31561;
        _31561 = _26234_31341.e1;
        #line 47 "gpu_device_shm.impala"
        char* _31575;
        _31575 = _26237_31344.e1;
        #line 25 "gaussian.impala"
        int _31564;
        _31564 = gid_y_31429 * _31425;
        #line 17 "gaussian.impala"
        bool _31540;
        _31540 = h_anchor_31539 <= gid_x_31419;
        #line 47 "gpu_device_shm.impala"
        double* _31576;
        union { double* dst; char* src; } u_31576;
        u_31576.src = _31575;
        _31576 = u_31576.dst;
        #line 62 "gpu_device_shm.impala"
        char* _31562;
        _31562 = _31561.e1;
        #line 25 "gaussian.impala"
        int _31577;
        _31577 = _31564 + gid_x_31419;
        #line 46 "gpu_device_shm.impala"
        double* index_31578;
        index_31578 = _31576 + _31577;
        #line 62 "gpu_device_shm.impala"
        double* _31563;
        union { double* dst; char* src; } u_31563;
        u_31563.src = _31562;
        _31563 = u_31563.dst;
        #line 17 "gaussian.impala"
        if (_31540) goto l31541; else goto l31589;
    l31589: ;
        #line 27 "gaussian.impala"
        goto l31583;
    l31541: ;
        #line 17 "gaussian.impala"
        int _31542;
        _31542 = _31425 - h_anchor_31539;
        #line 17 "gaussian.impala"
        bool _31543;
        _31543 = gid_x_31419 < _31542;
        #line 17 "gaussian.impala"
        if (_31543) goto l31544; else goto l31582;
    l31582: ;
        #line 27 "gaussian.impala"
        goto l31583;
    l31583: ;
        #line 62 "gpu_device_shm.impala"
        double* _31584;
        _31584 = _31563 + _31577;
        #line 62 "gpu_device_shm.impala"
        double _31585;
        _31585 = *_31584;
        #line 62 "gpu_device_shm.impala"
        double _31587;
        _31587 = _31585;
        #line 47 "gpu_device_shm.impala"
        *index_31578 = _31587;
        return ;
    l31544: ;
        #line 19 "gaussian.impala"
        int _31580;
        _31580 = 0 - h_anchor_31539;
        #line 67 "gpu_device_shm.impala"
        struct_Buffer_6445 _31554;
        _31554 = _26236_31343.e0;
        #line 67 "gpu_device_shm.impala"
        char* _31555;
        _31555 = _31554.e1;
        #line 19 "gaussian.impala"
        int _31550;
        _31550 = 1 + h_anchor_31539;
        #line 67 "gpu_device_shm.impala"
        double* _31556;
        union { double* dst; char* src; } u_31556;
        u_31556.src = _31555;
        _31556 = u_31556.dst;
        #line 20 "gpu_device_shm.impala"
        p_31546 = _31580;
        psum_31548 = 0.000000e+00;
        goto l31545;
    l31545: ;
        _31546 = p_31546;
        sum_31548 = psum_31548;
        #line 20 "gpu_device_shm.impala"
        bool _31551;
        _31551 = _31546 < _31550;
        #line 20 "gpu_device_shm.impala"
        if (_31551) goto l31552; else goto l31574;
    l31574: ;
        #line 47 "gpu_device_shm.impala"
        *index_31578 = sum_31548;
        return ;
    l31552: ;
        #line 21 "gaussian.impala"
        int _31557;
        _31557 = _31546 + h_anchor_31539;
        #line 24 "gpu_device_shm.impala"
        int _31553;
        _31553 = 1 + _31546;
        #line 66 "gpu_device_shm.impala"
        double* i_31558;
        i_31558 = _31556 + _31557;
        #line 21 "gaussian.impala"
        int _31565;
        _31565 = gid_x_31419 + _31546;
        #line 67 "gpu_device_shm.impala"
        double _31559;
        _31559 = *i_31558;
        #line 62 "gpu_device_shm.impala"
        int _31566;
        _31566 = _31564 + _31565;
        #line 67 "gpu_device_shm.impala"
        double _31570;
        _31570 = _31559;
        #line 62 "gpu_device_shm.impala"
        double* _31567;
        _31567 = _31563 + _31566;
        #line 62 "gpu_device_shm.impala"
        double _31568;
        _31568 = *_31567;
        #line 62 "gpu_device_shm.impala"
        double _31571;
        _31571 = _31568;
        #line 21 "gaussian.impala"
        double _31572;
        _31572 = _31570 * _31571;
        #line 21 "gaussian.impala"
        double _31573;
        _31573 = sum_31548 + _31572;
        #line 20 "gpu_device_shm.impala"
        p_31546 = _31553;
        psum_31548 = _31573;
        goto l31545;
    l31472: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31475 = blockDim_x();
        p_31475 = _31475;
    l31473: ;
        _31475 = p_31475;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31478 = blockDim_x();
        p_31478 = _31478;
    l31476: ;
        _31478 = p_31478;
        #line 166 "gpu_device_shm.impala"
        int img_index_y_31490;
        img_index_y_31490 = _31430 + _31469;
        #line 164 "gpu_device_shm.impala"
        int _31482;
        _31482 = _31475 + _31414;
        #line 169 "gpu_device_shm.impala"
        int _31507;
        _31507 = img_index_y_31490 * _31425;
        #line 168 "gpu_device_shm.impala"
        bool _31491;
        _31491 = 0 <= img_index_y_31490;
        #line 168 "gpu_device_shm.impala"
        bool _31493;
        _31493 = img_index_y_31490 < _31434;
        #line 31 "gpu_device_shm.impala"
        p_31480 = 0;
        goto l31479;
    l31479: ;
        _31480 = p_31480;
        #line 31 "gpu_device_shm.impala"
        bool _31483;
        _31483 = _31480 < _31482;
        #line 31 "gpu_device_shm.impala"
        if (_31483) goto l31484; else goto l31525;
    l31525: ;
        #line 35 "gpu_device_shm.impala"
        int _31526;
        _31526 = _31469 + _31394;
        #line 31 "gpu_device_shm.impala"
        p_31469 = _31526;
        goto l31468;
    l31484: ;
        #line 165 "gpu_device_shm.impala"
        int img_index_x_31485;
        img_index_x_31485 = _31420 + _31480;
        #line 168 "gpu_device_shm.impala"
        bool _31486;
        _31486 = 0 <= img_index_x_31485;
        #line 168 "gpu_device_shm.impala"
        if (_31486) goto l31487; else goto l31524;
    l31524: ;
        #line 170 "gpu_device_shm.impala"
        goto l31521;
    l31487: ;
        #line 168 "gpu_device_shm.impala"
        bool _31488;
        _31488 = img_index_x_31485 < _31425;
        #line 168 "gpu_device_shm.impala"
        if (_31488) goto l31489; else goto l31523;
    l31523: ;
        #line 170 "gpu_device_shm.impala"
        goto l31521;
    l31489: ;
        #line 168 "gpu_device_shm.impala"
        if (_31491) goto l31492; else goto l31522;
    l31522: ;
        #line 170 "gpu_device_shm.impala"
        goto l31521;
    l31492: ;
        #line 168 "gpu_device_shm.impala"
        if (_31493) goto l31494; else goto l31520;
    l31520: ;
        #line 170 "gpu_device_shm.impala"
        goto l31521;
    l31521: ;
        #line 33 "gpu_device_shm.impala"
        goto l31504;
    l31494: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31497 = threadIdx_y();
        p_31497 = _31497;
    l31495: ;
        _31497 = p_31497;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31500 = blockDim_y();
        p_31500 = _31500;
    l31498: ;
        _31500 = p_31500;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31503 = threadIdx_x();
        p_31503 = _31503;
    l31501: ;
        _31503 = p_31503;
        #line 169 "gpu_device_shm.impala"
        int _31513;
        _31513 = _31500 + _31399;
        #line 169 "gpu_device_shm.impala"
        int _31508;
        _31508 = _31507 + img_index_x_31485;
        #line 169 "gpu_device_shm.impala"
        int _31512;
        _31512 = _31497 + _31469;
        #line 169 "gpu_device_shm.impala"
        int _31514;
        _31514 = _31512 * _31513;
        #line 169 "gpu_device_shm.impala"
        double* _31509;
        _31509 = _26235_31342 + _31508;
        #line 169 "gpu_device_shm.impala"
        int _31515;
        _31515 = _31514 + _31503;
        #line 169 "gpu_device_shm.impala"
        double _31510;
        _31510 = *_31509;
        #line 169 "gpu_device_shm.impala"
        int _31516;
        _31516 = _31515 + _31480;
        #line 169 "gpu_device_shm.impala"
        double _31518;
        _31518 = _31510;
        #line 169 "gpu_device_shm.impala"
        double* _31517;
        _31517 = shared_31388 + _31516;
        #line 169 "gpu_device_shm.impala"
        *_31517 = _31518;
        #line 33 "gpu_device_shm.impala"
        goto l31504;
    l31504: ;
        #line 35 "gpu_device_shm.impala"
        int _31506;
        _31506 = _31480 + _31478;
        #line 31 "gpu_device_shm.impala"
        p_31480 = _31506;
        goto l31479;
    l31417: ;
        #line 165 "gpu_device_shm.impala"
        int img_index_x_31421;
        img_index_x_31421 = _31420 + _31410;
        #line 168 "gpu_device_shm.impala"
        bool _31422;
        _31422 = 0 <= img_index_x_31421;
        #line 168 "gpu_device_shm.impala"
        if (_31422) goto l31423; else goto l31466;
    l31466: ;
        #line 170 "gpu_device_shm.impala"
        goto l31463;
    l31423: ;
        #line 168 "gpu_device_shm.impala"
        bool _31426;
        _31426 = img_index_x_31421 < _31425;
        #line 168 "gpu_device_shm.impala"
        if (_31426) goto l31427; else goto l31465;
    l31465: ;
        #line 170 "gpu_device_shm.impala"
        goto l31463;
    l31427: ;
        #line 168 "gpu_device_shm.impala"
        if (_31431) goto l31432; else goto l31464;
    l31464: ;
        #line 170 "gpu_device_shm.impala"
        goto l31463;
    l31432: ;
        #line 168 "gpu_device_shm.impala"
        if (_31435) goto l31436; else goto l31462;
    l31462: ;
        #line 170 "gpu_device_shm.impala"
        goto l31463;
    l31463: ;
        #line 33 "gpu_device_shm.impala"
        goto l31446;
    l31436: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31439 = threadIdx_y();
        p_31439 = _31439;
    l31437: ;
        _31439 = p_31439;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31442 = blockDim_y();
        p_31442 = _31442;
    l31440: ;
        _31442 = p_31442;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31445 = threadIdx_x();
        p_31445 = _31445;
    l31443: ;
        _31445 = p_31445;
        #line 169 "gpu_device_shm.impala"
        int _31450;
        _31450 = _31449 + img_index_x_31421;
        #line 169 "gpu_device_shm.impala"
        int _31455;
        _31455 = _31442 + _31399;
        #line 169 "gpu_device_shm.impala"
        int _31456;
        _31456 = _31439 * _31455;
        #line 169 "gpu_device_shm.impala"
        double* _31451;
        _31451 = _26235_31342 + _31450;
        #line 169 "gpu_device_shm.impala"
        int _31457;
        _31457 = _31456 + _31445;
        #line 169 "gpu_device_shm.impala"
        double _31452;
        _31452 = *_31451;
        #line 169 "gpu_device_shm.impala"
        int _31458;
        _31458 = _31457 + _31410;
        #line 169 "gpu_device_shm.impala"
        double _31460;
        _31460 = _31452;
        #line 169 "gpu_device_shm.impala"
        double* _31459;
        _31459 = shared_31388 + _31458;
        #line 169 "gpu_device_shm.impala"
        *_31459 = _31460;
        #line 33 "gpu_device_shm.impala"
        goto l31446;
    l31446: ;
        #line 35 "gpu_device_shm.impala"
        int _31448;
        _31448 = _31410 + _31408;
        #line 31 "gpu_device_shm.impala"
        p_31410 = _31448;
        goto l31409;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_26506(struct_image_6444 _26509_31597, double* _26510_31598, struct_filter_6450 _26511_31599, struct_Buffer_6445 _26512_31600, double* _26513_31601, struct_Buffer_6445 _26514_31602) {
    int  _31605;
    int p_31605;
    int  _31608;
    int p_31608;
    int  _31611;
    int p_31611;
    int  _31614;
    int p_31614;
    int  _31617;
    int p_31617;
    int  _31620;
    int p_31620;
    double*  shared_31623;
    double* pshared_31623;
    int  _31626;
    int p_31626;
    int  _31629;
    int p_31629;
    int  _31637;
    int p_31637;
    int  _31640;
    int p_31640;
    int  _31642;
    int p_31642;
    int  _31697;
    int p_31697;
    int  _31771;
    int p_31771;
    double  sum_31773;
    double psum_31773;
    int  _31703;
    int p_31703;
    int  _31706;
    int p_31706;
    int  _31708;
    int p_31708;
    int  _31725;
    int p_31725;
    int  _31728;
    int p_31728;
    int  _31731;
    int p_31731;
    int  _31668;
    int p_31668;
    int  _31671;
    int p_31671;
    int  _31674;
    int p_31674;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _31605 = blockIdx_x();
    p_31605 = _31605;
    l31603: ;
        _31605 = p_31605;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31608 = blockDim_x();
        p_31608 = _31608;
    l31606: ;
        _31608 = p_31608;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31611 = threadIdx_x();
        p_31611 = _31611;
    l31609: ;
        _31611 = p_31611;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31614 = blockIdx_y();
        p_31614 = _31614;
    l31612: ;
        _31614 = p_31614;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31617 = blockDim_y();
        p_31617 = _31617;
    l31615: ;
        _31617 = p_31617;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31620 = threadIdx_y();
        p_31620 = _31620;
    l31618: ;
        _31620 = p_31620;
        #line 160 "gpu_device_shm.impala"
        __shared__ double reserver_shared_31623[2130];
        pshared_31623 = reserver_shared_31623;
    l31621: ;
        shared_31623 = pshared_31623;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31626 = blockDim_y();
        p_31626 = _31626;
    l31624: ;
        _31626 = p_31626;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31629 = blockDim_y();
        p_31629 = _31629;
    l31627: ;
        _31629 = p_31629;
        #line 11 "main.impala"
        int _31663;
        _31663 = _26509_31597.e4;
        #line 158 "gpu_device_shm.impala"
        int _31658;
        _31658 = _31614 * _31617;
        #line 11 "main.impala"
        int _31655;
        _31655 = _26509_31597.e3;
        #line 156 "gpu_device_shm.impala"
        int _31649;
        _31649 = _31605 * _31608;
        #line 6 "gaussian.impala"
        int _31630;
        _31630 = _26511_31599.e2;
        #line 158 "gpu_device_shm.impala"
        int gid_y_31659;
        gid_y_31659 = _31658 + _31620;
        #line 156 "gpu_device_shm.impala"
        int gid_x_31650;
        gid_x_31650 = _31649 + _31611;
        #line 163 "gpu_device_shm.impala"
        int _31631;
        _31631 = 2 * _31630;
        #line 163 "gpu_device_shm.impala"
        int _31632;
        _31632 = _31626 + _31631;
        #line 31 "gpu_device_shm.impala"
        bool _31633;
        _31633 = 0 < _31632;
        #line 31 "gpu_device_shm.impala"
        if (_31633) goto l31634; else goto l31816;
    l31816: ;
        #line 172 "gpu_device_shm.impala"
        goto l31756;
    l31634: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31637 = blockDim_x();
        p_31637 = _31637;
    l31635: ;
        _31637 = p_31637;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31640 = blockDim_x();
        p_31640 = _31640;
    l31638: ;
        _31640 = p_31640;
        #line 166 "gpu_device_shm.impala"
        int _31660;
        _31660 = gid_y_31659 - _31630;
        #line 168 "gpu_device_shm.impala"
        bool _31664;
        _31664 = _31660 < _31663;
        #line 164 "gpu_device_shm.impala"
        int _31644;
        _31644 = _26511_31599.e1;
        #line 165 "gpu_device_shm.impala"
        int _31651;
        _31651 = gid_x_31650 - _31644;
        #line 169 "gpu_device_shm.impala"
        int _31678;
        _31678 = _31660 * _31655;
        #line 164 "gpu_device_shm.impala"
        int _31645;
        _31645 = 2 * _31644;
        #line 168 "gpu_device_shm.impala"
        bool _31661;
        _31661 = 0 <= _31660;
        #line 164 "gpu_device_shm.impala"
        int _31646;
        _31646 = _31637 + _31645;
        #line 31 "gpu_device_shm.impala"
        p_31642 = 0;
        goto l31641;
    l31641: ;
        _31642 = p_31642;
        #line 31 "gpu_device_shm.impala"
        bool _31647;
        _31647 = _31642 < _31646;
        #line 31 "gpu_device_shm.impala"
        if (_31647) goto l31648; else goto l31695;
    l31695: ;
        #line 31 "gpu_device_shm.impala"
        p_31697 = _31629;
        goto l31696;
    l31696: ;
        _31697 = p_31697;
        #line 31 "gpu_device_shm.impala"
        bool _31699;
        _31699 = _31697 < _31632;
        #line 31 "gpu_device_shm.impala"
        if (_31699) goto l31700; else goto l31755;
    l31755: ;
        #line 172 "gpu_device_shm.impala"
        goto l31756;
    l31756: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        __syncthreads();
    l31758: ;
        #line 178 "gpu_device_shm.impala"
        bool _31760;
        _31760 = gid_x_31650 < _31655;
        #line 178 "gpu_device_shm.impala"
        if (_31760) goto l31761; else goto l31815;
    l31815: ;
        #line 181 "gpu_device_shm.impala"
        goto l31814;
    l31761: ;
        #line 178 "gpu_device_shm.impala"
        bool _31762;
        _31762 = gid_y_31659 < _31663;
        #line 178 "gpu_device_shm.impala"
        if (_31762) goto l31763; else goto l31813;
    l31813: ;
        #line 181 "gpu_device_shm.impala"
        goto l31814;
    l31814: ;
        return ;
    l31763: ;
        #line 57 "gpu_device_shm.impala"
        char* _31798;
        _31798 = _26514_31602.e1;
        #line 6 "gaussian.impala"
        int v_anchor_31764;
        v_anchor_31764 = _31630 / 2;
        #line 51 "gaussian.impala"
        int _31800;
        _31800 = gid_y_31659 * _31655;
        #line 39 "gaussian.impala"
        bool _31765;
        _31765 = v_anchor_31764 <= gid_y_31659;
        #line 52 "gpu_device_shm.impala"
        char* _31785;
        _31785 = _26512_31600.e1;
        #line 57 "gpu_device_shm.impala"
        double* _31799;
        union { double* dst; char* src; } u_31799;
        u_31799.src = _31798;
        _31799 = u_31799.dst;
        #line 51 "gaussian.impala"
        int _31801;
        _31801 = _31800 + gid_x_31650;
        #line 52 "gpu_device_shm.impala"
        double* _31786;
        union { double* dst; char* src; } u_31786;
        u_31786.src = _31785;
        _31786 = u_31786.dst;
        #line 57 "gpu_device_shm.impala"
        double* _31802;
        _31802 = _31799 + _31801;
        #line 39 "gaussian.impala"
        if (_31765) goto l31766; else goto l31812;
    l31812: ;
        #line 49 "gaussian.impala"
        goto l31806;
    l31766: ;
        #line 39 "gaussian.impala"
        int _31767;
        _31767 = _31663 - v_anchor_31764;
        #line 39 "gaussian.impala"
        bool _31768;
        _31768 = gid_y_31659 < _31767;
        #line 39 "gaussian.impala"
        if (_31768) goto l31769; else goto l31805;
    l31805: ;
        #line 49 "gaussian.impala"
        goto l31806;
    l31806: ;
        #line 51 "gpu_device_shm.impala"
        double* index_31807;
        index_31807 = _31786 + _31801;
        #line 52 "gpu_device_shm.impala"
        double _31808;
        _31808 = *index_31807;
        #line 52 "gpu_device_shm.impala"
        double _31810;
        _31810 = _31808;
        #line 57 "gpu_device_shm.impala"
        *_31802 = _31810;
        return ;
    l31769: ;
        #line 67 "gpu_device_shm.impala"
        struct_Buffer_6445 _31778;
        _31778 = _26511_31599.e0;
        #line 41 "gaussian.impala"
        int _31774;
        _31774 = 1 + v_anchor_31764;
        #line 41 "gaussian.impala"
        int _31804;
        _31804 = 0 - v_anchor_31764;
        #line 67 "gpu_device_shm.impala"
        char* _31779;
        _31779 = _31778.e1;
        #line 67 "gpu_device_shm.impala"
        double* _31780;
        union { double* dst; char* src; } u_31780;
        u_31780.src = _31779;
        _31780 = u_31780.dst;
        #line 20 "gpu_device_shm.impala"
        p_31771 = _31804;
        psum_31773 = 0.000000e+00;
        goto l31770;
    l31770: ;
        _31771 = p_31771;
        sum_31773 = psum_31773;
        #line 20 "gpu_device_shm.impala"
        bool _31775;
        _31775 = _31771 < _31774;
        #line 20 "gpu_device_shm.impala"
        if (_31775) goto l31776; else goto l31797;
    l31797: ;
        #line 57 "gpu_device_shm.impala"
        *_31802 = sum_31773;
        return ;
    l31776: ;
        #line 24 "gpu_device_shm.impala"
        int _31777;
        _31777 = 1 + _31771;
        #line 43 "gaussian.impala"
        int _31787;
        _31787 = gid_y_31659 + _31771;
        #line 43 "gaussian.impala"
        int _31781;
        _31781 = _31771 + v_anchor_31764;
        #line 66 "gpu_device_shm.impala"
        double* i_31782;
        i_31782 = _31780 + _31781;
        #line 43 "gaussian.impala"
        int _31788;
        _31788 = _31787 * _31655;
        #line 67 "gpu_device_shm.impala"
        double _31783;
        _31783 = *i_31782;
        #line 43 "gaussian.impala"
        int _31789;
        _31789 = _31788 + gid_x_31650;
        #line 67 "gpu_device_shm.impala"
        double _31793;
        _31793 = _31783;
        #line 51 "gpu_device_shm.impala"
        double* index_31790;
        index_31790 = _31786 + _31789;
        #line 52 "gpu_device_shm.impala"
        double _31791;
        _31791 = *index_31790;
        #line 52 "gpu_device_shm.impala"
        double _31794;
        _31794 = _31791;
        #line 43 "gaussian.impala"
        double _31795;
        _31795 = _31793 * _31794;
        #line 43 "gaussian.impala"
        double _31796;
        _31796 = sum_31773 + _31795;
        #line 20 "gpu_device_shm.impala"
        p_31771 = _31777;
        psum_31773 = _31796;
        goto l31770;
    l31700: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31703 = blockDim_x();
        p_31703 = _31703;
    l31701: ;
        _31703 = p_31703;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31706 = blockDim_x();
        p_31706 = _31706;
    l31704: ;
        _31706 = p_31706;
        #line 164 "gpu_device_shm.impala"
        int _31710;
        _31710 = _31703 + _31645;
        #line 166 "gpu_device_shm.impala"
        int img_index_y_31718;
        img_index_y_31718 = _31660 + _31697;
        #line 168 "gpu_device_shm.impala"
        bool _31721;
        _31721 = img_index_y_31718 < _31663;
        #line 168 "gpu_device_shm.impala"
        bool _31719;
        _31719 = 0 <= img_index_y_31718;
        #line 169 "gpu_device_shm.impala"
        int _31735;
        _31735 = img_index_y_31718 * _31655;
        #line 31 "gpu_device_shm.impala"
        p_31708 = 0;
        goto l31707;
    l31707: ;
        _31708 = p_31708;
        #line 31 "gpu_device_shm.impala"
        bool _31711;
        _31711 = _31708 < _31710;
        #line 31 "gpu_device_shm.impala"
        if (_31711) goto l31712; else goto l31753;
    l31753: ;
        #line 35 "gpu_device_shm.impala"
        int _31754;
        _31754 = _31697 + _31629;
        #line 31 "gpu_device_shm.impala"
        p_31697 = _31754;
        goto l31696;
    l31712: ;
        #line 165 "gpu_device_shm.impala"
        int img_index_x_31713;
        img_index_x_31713 = _31651 + _31708;
        #line 168 "gpu_device_shm.impala"
        bool _31714;
        _31714 = 0 <= img_index_x_31713;
        #line 168 "gpu_device_shm.impala"
        if (_31714) goto l31715; else goto l31752;
    l31752: ;
        #line 170 "gpu_device_shm.impala"
        goto l31749;
    l31715: ;
        #line 168 "gpu_device_shm.impala"
        bool _31716;
        _31716 = img_index_x_31713 < _31655;
        #line 168 "gpu_device_shm.impala"
        if (_31716) goto l31717; else goto l31751;
    l31751: ;
        #line 170 "gpu_device_shm.impala"
        goto l31749;
    l31717: ;
        #line 168 "gpu_device_shm.impala"
        if (_31719) goto l31720; else goto l31750;
    l31750: ;
        #line 170 "gpu_device_shm.impala"
        goto l31749;
    l31720: ;
        #line 168 "gpu_device_shm.impala"
        if (_31721) goto l31722; else goto l31748;
    l31748: ;
        #line 170 "gpu_device_shm.impala"
        goto l31749;
    l31749: ;
        #line 33 "gpu_device_shm.impala"
        goto l31732;
    l31722: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31725 = threadIdx_y();
        p_31725 = _31725;
    l31723: ;
        _31725 = p_31725;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31728 = blockDim_y();
        p_31728 = _31728;
    l31726: ;
        _31728 = p_31728;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31731 = threadIdx_x();
        p_31731 = _31731;
    l31729: ;
        _31731 = p_31731;
        #line 169 "gpu_device_shm.impala"
        int _31736;
        _31736 = _31735 + img_index_x_31713;
        #line 169 "gpu_device_shm.impala"
        int _31740;
        _31740 = _31725 + _31697;
        #line 169 "gpu_device_shm.impala"
        int _31741;
        _31741 = _31728 + _31631;
        #line 169 "gpu_device_shm.impala"
        double* _31737;
        _31737 = _26510_31598 + _31736;
        #line 169 "gpu_device_shm.impala"
        int _31742;
        _31742 = _31740 * _31741;
        #line 169 "gpu_device_shm.impala"
        double _31738;
        _31738 = *_31737;
        #line 169 "gpu_device_shm.impala"
        int _31743;
        _31743 = _31742 + _31731;
        #line 169 "gpu_device_shm.impala"
        double _31746;
        _31746 = _31738;
        #line 169 "gpu_device_shm.impala"
        int _31744;
        _31744 = _31743 + _31708;
        #line 169 "gpu_device_shm.impala"
        double* _31745;
        _31745 = shared_31623 + _31744;
        #line 169 "gpu_device_shm.impala"
        *_31745 = _31746;
        #line 33 "gpu_device_shm.impala"
        goto l31732;
    l31732: ;
        #line 35 "gpu_device_shm.impala"
        int _31734;
        _31734 = _31708 + _31706;
        #line 31 "gpu_device_shm.impala"
        p_31708 = _31734;
        goto l31707;
    l31648: ;
        #line 165 "gpu_device_shm.impala"
        int img_index_x_31652;
        img_index_x_31652 = _31651 + _31642;
        #line 168 "gpu_device_shm.impala"
        bool _31653;
        _31653 = 0 <= img_index_x_31652;
        #line 168 "gpu_device_shm.impala"
        if (_31653) goto l31654; else goto l31694;
    l31694: ;
        #line 170 "gpu_device_shm.impala"
        goto l31691;
    l31654: ;
        #line 168 "gpu_device_shm.impala"
        bool _31656;
        _31656 = img_index_x_31652 < _31655;
        #line 168 "gpu_device_shm.impala"
        if (_31656) goto l31657; else goto l31693;
    l31693: ;
        #line 170 "gpu_device_shm.impala"
        goto l31691;
    l31657: ;
        #line 168 "gpu_device_shm.impala"
        if (_31661) goto l31662; else goto l31692;
    l31692: ;
        #line 170 "gpu_device_shm.impala"
        goto l31691;
    l31662: ;
        #line 168 "gpu_device_shm.impala"
        if (_31664) goto l31665; else goto l31690;
    l31690: ;
        #line 170 "gpu_device_shm.impala"
        goto l31691;
    l31691: ;
        #line 33 "gpu_device_shm.impala"
        goto l31675;
    l31665: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31668 = threadIdx_y();
        p_31668 = _31668;
    l31666: ;
        _31668 = p_31668;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31671 = blockDim_y();
        p_31671 = _31671;
    l31669: ;
        _31671 = p_31671;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _31674 = threadIdx_x();
        p_31674 = _31674;
    l31672: ;
        _31674 = p_31674;
        #line 169 "gpu_device_shm.impala"
        int _31679;
        _31679 = _31678 + img_index_x_31652;
        #line 169 "gpu_device_shm.impala"
        double* _31680;
        _31680 = _26510_31598 + _31679;
        #line 169 "gpu_device_shm.impala"
        int _31683;
        _31683 = _31671 + _31631;
        #line 169 "gpu_device_shm.impala"
        double _31681;
        _31681 = *_31680;
        #line 169 "gpu_device_shm.impala"
        int _31684;
        _31684 = _31668 * _31683;
        #line 169 "gpu_device_shm.impala"
        double _31688;
        _31688 = _31681;
        #line 169 "gpu_device_shm.impala"
        int _31685;
        _31685 = _31684 + _31674;
        #line 169 "gpu_device_shm.impala"
        int _31686;
        _31686 = _31685 + _31642;
        #line 169 "gpu_device_shm.impala"
        double* _31687;
        _31687 = shared_31623 + _31686;
        #line 169 "gpu_device_shm.impala"
        *_31687 = _31688;
        #line 33 "gpu_device_shm.impala"
        goto l31675;
    l31675: ;
        #line 35 "gpu_device_shm.impala"
        int _31677;
        _31677 = _31642 + _31640;
        #line 31 "gpu_device_shm.impala"
        p_31642 = _31677;
        goto l31641;
}

}
