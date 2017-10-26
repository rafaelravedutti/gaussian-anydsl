extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5540;
typedef struct {
    struct_Buffer_5540 e0;
    int e1;
    int e2;
} struct_filter_5543;
typedef struct {
    struct_Buffer_5540 e0;
    struct_Buffer_5540 e1;
    int e2;
    int e3;
} struct_image_5544;

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
__global__ void lambda_21082(struct_Buffer_5540, struct_filter_5543, struct_image_5544);
__global__ void lambda_21214(struct_Buffer_5540, struct_filter_5543, double*, struct_image_5544, struct_Buffer_5540);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_21082(struct_Buffer_5540 _21085_23421, struct_filter_5543 _21086_23422, struct_image_5544 _21087_23423) {
    int  _23429;
    int p_23429;
    int  _23435;
    int p_23435;
    int  _23441;
    int p_23441;
    int  _23447;
    int p_23447;
    int  _23453;
    int p_23453;
    int  _23459;
    int p_23459;
    int  _23482;
    int p_23482;
    double  sum_23484;
    double psum_23484;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23429 = blockIdx_x();
    p_23429 = _23429;
    l23427: ;
        _23429 = p_23429;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23435 = blockDim_x();
        p_23435 = _23435;
    l23433: ;
        _23435 = p_23435;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23441 = threadIdx_x();
        p_23441 = _23441;
    l23439: ;
        _23441 = p_23441;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23447 = blockIdx_y();
        p_23447 = _23447;
    l23445: ;
        _23447 = p_23447;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23453 = blockDim_y();
        p_23453 = _23453;
    l23451: ;
        _23453 = p_23453;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23459 = threadIdx_y();
        p_23459 = _23459;
    l23457: ;
        _23459 = p_23459;
        #line 11 "main.impala"
        int _23463;
        _23463 = _21087_23423.e2;
        #line 144 "gpu_device.impala"
        int _23460;
        _23460 = _23429 * _23435;
        #line 144 "gpu_device.impala"
        int gid_x_23461;
        gid_x_23461 = _23460 + _23441;
        #line 149 "gpu_device.impala"
        bool _23464;
        _23464 = gid_x_23461 < _23463;
        #line 149 "gpu_device.impala"
        if (_23464) goto l23465; else goto l23530;
    l23530: ;
        #line 152 "gpu_device.impala"
        goto l23529;
    l23465: ;
        #line 146 "gpu_device.impala"
        int _23466;
        _23466 = _23447 * _23453;
        #line 11 "main.impala"
        int _23469;
        _23469 = _21087_23423.e3;
        #line 146 "gpu_device.impala"
        int gid_y_23467;
        gid_y_23467 = _23466 + _23459;
        #line 149 "gpu_device.impala"
        bool _23470;
        _23470 = gid_y_23467 < _23469;
        #line 149 "gpu_device.impala"
        if (_23470) goto l23471; else goto l23528;
    l23528: ;
        #line 152 "gpu_device.impala"
        goto l23529;
    l23529: ;
        return ;
    l23471: ;
        #line 35 "gpu_device.impala"
        char* _23512;
        _23512 = _21085_23421.e1;
        #line 25 "gaussian.impala"
        int _23501;
        _23501 = gid_y_23467 * _23463;
        #line 35 "gpu_device.impala"
        double* _23513;
        union { double* dst; char* src; } u_23513;
        u_23513.src = _23512;
        _23513 = u_23513.dst;
        #line 50 "gpu_device.impala"
        struct_Buffer_5540 _23498;
        _23498 = _21087_23423.e1;
        #line 25 "gaussian.impala"
        int _23514;
        _23514 = _23501 + gid_x_23461;
        #line 4 "gaussian.impala"
        int _23473;
        _23473 = _21086_23422.e1;
        #line 50 "gpu_device.impala"
        char* _23499;
        _23499 = _23498.e1;
        #line 34 "gpu_device.impala"
        double* index_23515;
        index_23515 = _23513 + _23514;
        #line 4 "gaussian.impala"
        int h_anchor_23475;
        h_anchor_23475 = _23473 / 2;
        #line 50 "gpu_device.impala"
        double* _23500;
        union { double* dst; char* src; } u_23500;
        u_23500.src = _23499;
        _23500 = u_23500.dst;
        #line 17 "gaussian.impala"
        bool _23476;
        _23476 = h_anchor_23475 <= gid_x_23461;
        #line 17 "gaussian.impala"
        if (_23476) goto l23477; else goto l23527;
    l23527: ;
        #line 27 "gaussian.impala"
        goto l23521;
    l23477: ;
        #line 17 "gaussian.impala"
        int _23478;
        _23478 = _23463 - h_anchor_23475;
        #line 17 "gaussian.impala"
        bool _23479;
        _23479 = gid_x_23461 < _23478;
        #line 17 "gaussian.impala"
        if (_23479) goto l23480; else goto l23520;
    l23520: ;
        #line 27 "gaussian.impala"
        goto l23521;
    l23521: ;
        #line 50 "gpu_device.impala"
        double* _23522;
        _23522 = _23500 + _23514;
        #line 50 "gpu_device.impala"
        double _23523;
        _23523 = *_23522;
        #line 50 "gpu_device.impala"
        double _23525;
        _23525 = _23523;
        #line 35 "gpu_device.impala"
        *index_23515 = _23525;
        return ;
    l23480: ;
        #line 19 "gaussian.impala"
        int _23486;
        _23486 = 1 + h_anchor_23475;
        #line 19 "gaussian.impala"
        int _23518;
        _23518 = 0 - h_anchor_23475;
        #line 55 "gpu_device.impala"
        struct_Buffer_5540 _23491;
        _23491 = _21086_23422.e0;
        #line 55 "gpu_device.impala"
        char* _23492;
        _23492 = _23491.e1;
        #line 55 "gpu_device.impala"
        double* _23493;
        union { double* dst; char* src; } u_23493;
        u_23493.src = _23492;
        _23493 = u_23493.dst;
        #line 19 "gpu_device.impala"
        p_23482 = _23518;
        psum_23484 = 0.000000e+00;
        goto l23481;
    l23481: ;
        _23482 = p_23482;
        sum_23484 = psum_23484;
        #line 19 "gpu_device.impala"
        bool _23487;
        _23487 = _23482 < _23486;
        #line 19 "gpu_device.impala"
        if (_23487) goto l23488; else goto l23511;
    l23511: ;
        #line 35 "gpu_device.impala"
        *index_23515 = sum_23484;
        return ;
    l23488: ;
        #line 21 "gaussian.impala"
        int _23502;
        _23502 = gid_x_23461 + _23482;
        #line 23 "gpu_device.impala"
        int _23489;
        _23489 = 1 + _23482;
        #line 21 "gaussian.impala"
        int _23494;
        _23494 = _23482 + h_anchor_23475;
        #line 50 "gpu_device.impala"
        int _23503;
        _23503 = _23501 + _23502;
        #line 54 "gpu_device.impala"
        double* i_23495;
        i_23495 = _23493 + _23494;
        #line 50 "gpu_device.impala"
        double* _23504;
        _23504 = _23500 + _23503;
        #line 55 "gpu_device.impala"
        double _23496;
        _23496 = *i_23495;
        #line 55 "gpu_device.impala"
        double _23507;
        _23507 = _23496;
        #line 50 "gpu_device.impala"
        double _23505;
        _23505 = *_23504;
        #line 50 "gpu_device.impala"
        double _23508;
        _23508 = _23505;
        #line 21 "gaussian.impala"
        double _23509;
        _23509 = _23507 * _23508;
        #line 21 "gaussian.impala"
        double _23510;
        _23510 = sum_23484 + _23509;
        #line 19 "gpu_device.impala"
        p_23482 = _23489;
        psum_23484 = _23510;
        goto l23481;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_21214(struct_Buffer_5540 _21217_23534, struct_filter_5543 _21218_23535, double* _21219_23536, struct_image_5544 _21220_23537, struct_Buffer_5540 _21221_23538) {
    int  _23541;
    int p_23541;
    int  _23544;
    int p_23544;
    int  _23547;
    int p_23547;
    int  _23550;
    int p_23550;
    int  _23553;
    int p_23553;
    int  _23556;
    int p_23556;
    int  _23575;
    int p_23575;
    double  sum_23577;
    double psum_23577;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23541 = blockIdx_x();
    p_23541 = _23541;
    l23539: ;
        _23541 = p_23541;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23544 = blockDim_x();
        p_23544 = _23544;
    l23542: ;
        _23544 = p_23544;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23547 = threadIdx_x();
        p_23547 = _23547;
    l23545: ;
        _23547 = p_23547;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23550 = blockIdx_y();
        p_23550 = _23550;
    l23548: ;
        _23550 = p_23550;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23553 = blockDim_y();
        p_23553 = _23553;
    l23551: ;
        _23553 = p_23553;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23556 = threadIdx_y();
        p_23556 = _23556;
    l23554: ;
        _23556 = p_23556;
        #line 11 "main.impala"
        int _23559;
        _23559 = _21220_23537.e2;
        #line 144 "gpu_device.impala"
        int _23557;
        _23557 = _23541 * _23544;
        #line 144 "gpu_device.impala"
        int gid_x_23558;
        gid_x_23558 = _23557 + _23547;
        #line 149 "gpu_device.impala"
        bool _23560;
        _23560 = gid_x_23558 < _23559;
        #line 149 "gpu_device.impala"
        if (_23560) goto l23561; else goto l23619;
    l23619: ;
        #line 152 "gpu_device.impala"
        goto l23618;
    l23561: ;
        #line 11 "main.impala"
        int _23564;
        _23564 = _21220_23537.e3;
        #line 146 "gpu_device.impala"
        int _23562;
        _23562 = _23550 * _23553;
        #line 146 "gpu_device.impala"
        int gid_y_23563;
        gid_y_23563 = _23562 + _23556;
        #line 149 "gpu_device.impala"
        bool _23565;
        _23565 = gid_y_23563 < _23564;
        #line 149 "gpu_device.impala"
        if (_23565) goto l23566; else goto l23617;
    l23617: ;
        #line 152 "gpu_device.impala"
        goto l23618;
    l23618: ;
        return ;
    l23566: ;
        #line 45 "gpu_device.impala"
        char* _23602;
        _23602 = _21221_23538.e1;
        #line 6 "gaussian.impala"
        int _23567;
        _23567 = _21218_23535.e2;
        #line 40 "gpu_device.impala"
        char* _23589;
        _23589 = _21217_23534.e1;
        #line 51 "gaussian.impala"
        int _23604;
        _23604 = gid_y_23563 * _23559;
        #line 45 "gpu_device.impala"
        double* _23603;
        union { double* dst; char* src; } u_23603;
        u_23603.src = _23602;
        _23603 = u_23603.dst;
        #line 6 "gaussian.impala"
        int v_anchor_23568;
        v_anchor_23568 = _23567 / 2;
        #line 40 "gpu_device.impala"
        double* _23590;
        union { double* dst; char* src; } u_23590;
        u_23590.src = _23589;
        _23590 = u_23590.dst;
        #line 51 "gaussian.impala"
        int _23605;
        _23605 = _23604 + gid_x_23558;
        #line 45 "gpu_device.impala"
        double* _23606;
        _23606 = _23603 + _23605;
        #line 39 "gaussian.impala"
        bool _23569;
        _23569 = v_anchor_23568 <= gid_y_23563;
        #line 39 "gaussian.impala"
        if (_23569) goto l23570; else goto l23616;
    l23616: ;
        #line 49 "gaussian.impala"
        goto l23610;
    l23570: ;
        #line 39 "gaussian.impala"
        int _23571;
        _23571 = _23564 - v_anchor_23568;
        #line 39 "gaussian.impala"
        bool _23572;
        _23572 = gid_y_23563 < _23571;
        #line 39 "gaussian.impala"
        if (_23572) goto l23573; else goto l23609;
    l23609: ;
        #line 49 "gaussian.impala"
        goto l23610;
    l23610: ;
        #line 39 "gpu_device.impala"
        double* index_23611;
        index_23611 = _23590 + _23605;
        #line 40 "gpu_device.impala"
        double _23612;
        _23612 = *index_23611;
        #line 40 "gpu_device.impala"
        double _23614;
        _23614 = _23612;
        #line 45 "gpu_device.impala"
        *_23606 = _23614;
        return ;
    l23573: ;
        #line 41 "gaussian.impala"
        int _23608;
        _23608 = 0 - v_anchor_23568;
        #line 41 "gaussian.impala"
        int _23578;
        _23578 = 1 + v_anchor_23568;
        #line 55 "gpu_device.impala"
        struct_Buffer_5540 _23582;
        _23582 = _21218_23535.e0;
        #line 55 "gpu_device.impala"
        char* _23583;
        _23583 = _23582.e1;
        #line 55 "gpu_device.impala"
        double* _23584;
        union { double* dst; char* src; } u_23584;
        u_23584.src = _23583;
        _23584 = u_23584.dst;
        #line 19 "gpu_device.impala"
        p_23575 = _23608;
        psum_23577 = 0.000000e+00;
        goto l23574;
    l23574: ;
        _23575 = p_23575;
        sum_23577 = psum_23577;
        #line 19 "gpu_device.impala"
        bool _23579;
        _23579 = _23575 < _23578;
        #line 19 "gpu_device.impala"
        if (_23579) goto l23580; else goto l23601;
    l23601: ;
        #line 45 "gpu_device.impala"
        *_23606 = sum_23577;
        return ;
    l23580: ;
        #line 23 "gpu_device.impala"
        int _23581;
        _23581 = 1 + _23575;
        #line 43 "gaussian.impala"
        int _23591;
        _23591 = gid_y_23563 + _23575;
        #line 43 "gaussian.impala"
        int _23585;
        _23585 = _23575 + v_anchor_23568;
        #line 43 "gaussian.impala"
        int _23592;
        _23592 = _23591 * _23559;
        #line 54 "gpu_device.impala"
        double* i_23586;
        i_23586 = _23584 + _23585;
        #line 43 "gaussian.impala"
        int _23593;
        _23593 = _23592 + gid_x_23558;
        #line 55 "gpu_device.impala"
        double _23587;
        _23587 = *i_23586;
        #line 39 "gpu_device.impala"
        double* index_23594;
        index_23594 = _23590 + _23593;
        #line 55 "gpu_device.impala"
        double _23597;
        _23597 = _23587;
        #line 40 "gpu_device.impala"
        double _23595;
        _23595 = *index_23594;
        #line 40 "gpu_device.impala"
        double _23598;
        _23598 = _23595;
        #line 43 "gaussian.impala"
        double _23599;
        _23599 = _23597 * _23598;
        #line 43 "gaussian.impala"
        double _23600;
        _23600 = sum_23577 + _23599;
        #line 19 "gpu_device.impala"
        p_23575 = _23581;
        psum_23577 = _23600;
        goto l23574;
}

}