extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5491;
typedef struct {
    struct_Buffer_5491 e0;
    int e1;
    int e2;
} struct_filter_5490;
typedef struct {
    struct_Buffer_5491 e0;
    struct_Buffer_5491 e1;
    int e2;
    int e3;
} struct_image_5494;

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
__global__ void lambda_21041(struct_filter_5490, struct_Buffer_5491, struct_image_5494);
__global__ void lambda_21173(struct_filter_5490, struct_Buffer_5491, double*, struct_Buffer_5491, struct_image_5494);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_21041(struct_filter_5490 _21044_23380, struct_Buffer_5491 _21045_23381, struct_image_5494 _21046_23382) {
    __shared__ double ds_img[134][7];
    __shared__ double ds_filter[7];
    int  _23388;
    int p_23388;
    int  _23394;
    int p_23394;
    int  _23400;
    int p_23400;
    int  _23406;
    int p_23406;
    int  _23412;
    int p_23412;
    int  _23418;
    int p_23418;
    int  _23441;
    int p_23441;
    double  sum_23443;
    double psum_23443;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23388 = blockIdx_x();
    p_23388 = _23388;
    l23386: ;
        _23388 = p_23388;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23394 = blockDim_x();
        p_23394 = _23394;
    l23392: ;
        _23394 = p_23394;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23400 = threadIdx_x();
        p_23400 = _23400;
    l23398: ;
        _23400 = p_23400;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23406 = blockIdx_y();
        p_23406 = _23406;
    l23404: ;
        _23406 = p_23406;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23412 = blockDim_y();
        p_23412 = _23412;
    l23410: ;
        _23412 = p_23412;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23418 = threadIdx_y();
        p_23418 = _23418;
    l23416: ;
        _23418 = p_23418;
        #line 170 "gpu_device.impala"
        int _23419;
        _23419 = _23388 * _23394;
        #line 11 "main.impala"
        int _23422;
        _23422 = _21046_23382.e2;
        #line 170 "gpu_device.impala"
        int gid_x_23420;
        gid_x_23420 = _23419 + _23400;
        #line 175 "gpu_device.impala"
        bool _23423;
        _23423 = gid_x_23420 < _23422;
        #line 175 "gpu_device.impala"
        if (_23423) goto l23424; else goto l23489;
    l23489: ;
        #line 178 "gpu_device.impala"
        goto l23488;
    l23424: ;
        #line 172 "gpu_device.impala"
        int _23425;
        _23425 = _23406 * _23412;
        #line 172 "gpu_device.impala"
        int gid_y_23426;
        gid_y_23426 = _23425 + _23418;
        #line 11 "main.impala"
        int _23428;
        _23428 = _21046_23382.e3;
        #line 175 "gpu_device.impala"
        bool _23429;
        _23429 = gid_y_23426 < _23428;
        #line 175 "gpu_device.impala"
        if (_23429) goto l23430; else goto l23487;
    l23487: ;
        #line 178 "gpu_device.impala"
        goto l23488;
    l23488: ;
        return ;
    l23430: ;
        #line 65 "gpu_device.impala"
        struct_Buffer_5491 _23457;
        _23457 = _21046_23382.e1;
        #line 60 "gpu_device.impala"
        char* _23471;
        _23471 = _21045_23381.e1;
        #line 65 "gpu_device.impala"
        int _23460;
        _23460 = gid_y_23426 * _23422;
        #line 4 "gaussian.impala"
        int _23432;
        _23432 = _21044_23380.e1;
        #line 4 "gaussian.impala"
        int h_anchor_23434;
        h_anchor_23434 = _23432 / 2;
        #line 65 "gpu_device.impala"
        int _23473;
        _23473 = _23460 + gid_x_23420;
        #line 65 "gpu_device.impala"
        char* _23458;
        _23458 = _23457.e1;
        #line 60 "gpu_device.impala"
        double* _23472;
        union { double* dst; char* src; } u_23472;
        u_23472.src = _23471;
        _23472 = u_23472.dst;
        #line 17 "gaussian.impala"
        bool _23435;
        _23435 = h_anchor_23434 <= gid_x_23420;
        #line 60 "gpu_device.impala"
        double* _23474;
        _23474 = _23472 + _23473;
        #line 65 "gpu_device.impala"
        double* _23459;
        union { double* dst; char* src; } u_23459;
        u_23459.src = _23458;
        _23459 = u_23459.dst;
        #line 100 "shared_memory_image_copy"
        for(int i = 0; i < blockDim.x + 6; i += blockDim.x) {
            for(int j = 0; j < blockDim.y + 6; j += blockDim.y) {
                if(threadIdx.x + i < blockDim.x + 6 && 
                   threadIdx.y + j < blockDim.y + 6 && 
                   ((blockIdx.x * blockDim.x + threadIdx.x) - 3 + i) < _21046_23382.e2 && 
                   ((blockIdx.y * blockDim.y + threadIdx.y) - 3 + j) < _21046_23382.e3) {
                    ds_img[threadIdx.x + i][threadIdx.y + j] = \
                      _23459[((blockIdx.y * blockDim.y + threadIdx.y) - 3 + j) * _21046_23382.e2 + ((blockIdx.x * blockDim.x + threadIdx.x) - 3 + i)];
                }
            }
        }
        
        __syncthreads();
        
        #line 17 "gaussian.impala"
        if (_23435) goto l23436; else goto l23486;
    l23486: ;
        #line 27 "gaussian.impala"
        goto l23480;
    l23436: ;
        #line 17 "gaussian.impala"
        int _23437;
        _23437 = _23422 - h_anchor_23434;
        #line 17 "gaussian.impala"
        bool _23438;
        _23438 = gid_x_23420 < _23437;
        #line 17 "gaussian.impala"
        if (_23438) goto l23439; else goto l23479;
    l23479: ;
        #line 27 "gaussian.impala"
        goto l23480;
    l23480: ;
        #line 65 "gpu_device.impala"
        #line 100 "shared_memory_access"
        double* _23481;
        _23481 = &ds_img[_23473 % _21046_23382.e2 + 3 - blockIdx.x * blockDim.x][_23473 / _21046_23382.e2 + 3 - blockIdx.y * blockDim.y];
        #line 65 "gpu_device.impala"
        double _23482;
        _23482 = *_23481;
        #line 65 "gpu_device.impala"
        double _23484;
        _23484 = _23482;
        #line 60 "gpu_device.impala"
        *_23474 = _23484;
        return ;
    l23439: ;
        #line 70 "gpu_device.impala"
        struct_Buffer_5491 _23450;
        _23450 = _21044_23380.e0;
        #line 19 "gaussian.impala"
        int _23477;
        _23477 = 0 - h_anchor_23434;
        #line 19 "gaussian.impala"
        int _23445;
        _23445 = 1 + h_anchor_23434;
        #line 70 "gpu_device.impala"
        char* _23451;
        _23451 = _23450.e1;
        #line 70 "gpu_device.impala"
        double* _23452;
        union { double* dst; char* src; } u_23452;
        u_23452.src = _23451;
        _23452 = u_23452.dst;
        #line 200 "shared_memory_filter_copy"
        for(int i = 0; i < 7; i++) {
            ds_filter[i] = _23452[i];
        }
        
        __syncthreads();
        
        #line 19 "gpu_device.impala"
        p_23441 = _23477;
        psum_23443 = 0.000000e+00;
        goto l23440;
    l23440: ;
        _23441 = p_23441;
        sum_23443 = psum_23443;
        #line 19 "gpu_device.impala"
        bool _23446;
        _23446 = _23441 < _23445;
        #line 19 "gpu_device.impala"
        if (_23446) goto l23447; else goto l23470;
    l23470: ;
        #line 60 "gpu_device.impala"
        *_23474 = sum_23443;
        return ;
    l23447: ;
        #line 21 "gaussian.impala"
        int _23461;
        _23461 = gid_x_23420 + _23441;
        #line 21 "gaussian.impala"
        int _23453;
        _23453 = _23441 + h_anchor_23434;
        #line 23 "gpu_device.impala"
        int _23448;
        _23448 = 1 + _23441;
        #line 65 "gpu_device.impala"
        int _23462;
        _23462 = _23460 + _23461;
        #line 69 "gpu_device.impala"
        #line 100 "shared_memory_access"
        double* i_23454;
        i_23454 = &ds_filter[_23453];
        #line 65 "gpu_device.impala"
        #line 100 "shared_memory_access"
        double* _23463;
        _23463 = &ds_img[_23462 % _21046_23382.e2 + 3 - blockIdx.x * blockDim.x][_23462 / _21046_23382.e2 + 3 - blockIdx.y * blockDim.y];
        #line 70 "gpu_device.impala"
        double _23455;
        _23455 = *i_23454;
        #line 70 "gpu_device.impala"
        double _23466;
        _23466 = _23455;
        #line 65 "gpu_device.impala"
        double _23464;
        _23464 = *_23463;
        #line 65 "gpu_device.impala"
        double _23467;
        _23467 = _23464;
        #line 21 "gaussian.impala"
        double _23468;
        _23468 = _23466 * _23467;
        #line 21 "gaussian.impala"
        double _23469;
        _23469 = sum_23443 + _23468;
        #line 19 "gpu_device.impala"
        p_23441 = _23448;
        psum_23443 = _23469;
        goto l23440;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_21173(struct_filter_5490 _21176_23493, struct_Buffer_5491 _21177_23494, double* _21178_23495, struct_Buffer_5491 _21179_23496, struct_image_5494 _21180_23497) {
    __shared__ double ds_img[134][7];
    __shared__ double ds_filter[7];
    int  _23500;
    int p_23500;
    int  _23503;
    int p_23503;
    int  _23506;
    int p_23506;
    int  _23509;
    int p_23509;
    int  _23512;
    int p_23512;
    int  _23515;
    int p_23515;
    int  _23534;
    int p_23534;
    double  sum_23536;
    double psum_23536;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23500 = blockIdx_x();
    p_23500 = _23500;
    l23498: ;
        _23500 = p_23500;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23503 = blockDim_x();
        p_23503 = _23503;
    l23501: ;
        _23503 = p_23503;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23506 = threadIdx_x();
        p_23506 = _23506;
    l23504: ;
        _23506 = p_23506;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23509 = blockIdx_y();
        p_23509 = _23509;
    l23507: ;
        _23509 = p_23509;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23512 = blockDim_y();
        p_23512 = _23512;
    l23510: ;
        _23512 = p_23512;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23515 = threadIdx_y();
        p_23515 = _23515;
    l23513: ;
        _23515 = p_23515;
        #line 11 "main.impala"
        int _23518;
        _23518 = _21180_23497.e2;
        #line 170 "gpu_device.impala"
        int _23516;
        _23516 = _23500 * _23503;
        #line 170 "gpu_device.impala"
        int gid_x_23517;
        gid_x_23517 = _23516 + _23506;
        #line 175 "gpu_device.impala"
        bool _23519;
        _23519 = gid_x_23517 < _23518;
        #line 175 "gpu_device.impala"
        if (_23519) goto l23520; else goto l23578;
    l23578: ;
        #line 178 "gpu_device.impala"
        goto l23577;
    l23520: ;
        #line 172 "gpu_device.impala"
        int _23521;
        _23521 = _23509 * _23512;
        #line 11 "main.impala"
        int _23523;
        _23523 = _21180_23497.e3;
        #line 172 "gpu_device.impala"
        int gid_y_23522;
        gid_y_23522 = _23521 + _23515;
        #line 175 "gpu_device.impala"
        bool _23524;
        _23524 = gid_y_23522 < _23523;
        #line 175 "gpu_device.impala"
        if (_23524) goto l23525; else goto l23576;
    l23576: ;
        #line 178 "gpu_device.impala"
        goto l23577;
    l23577: ;
        return ;
    l23525: ;
        #line 65 "gpu_device.impala"
        int _23563;
        _23563 = gid_y_23522 * _23518;
        #line 60 "gpu_device.impala"
        char* _23561;
        _23561 = _21177_23494.e1;
        #line 6 "gaussian.impala"
        int _23526;
        _23526 = _21176_23493.e2;
        #line 65 "gpu_device.impala"
        char* _23548;
        _23548 = _21179_23496.e1;
        #line 65 "gpu_device.impala"
        int _23564;
        _23564 = _23563 + gid_x_23517;
        #line 60 "gpu_device.impala"
        double* _23562;
        union { double* dst; char* src; } u_23562;
        u_23562.src = _23561;
        _23562 = u_23562.dst;
        #line 6 "gaussian.impala"
        int v_anchor_23527;
        v_anchor_23527 = _23526 / 2;
        #line 65 "gpu_device.impala"
        double* _23549;
        union { double* dst; char* src; } u_23549;
        u_23549.src = _23548;
        _23549 = u_23549.dst;
        #line 100 "shared_memory_image_copy"
        for(int i = 0; i < blockDim.x + 6; i += blockDim.x) {
            for(int j = 0; j < blockDim.y + 6; j += blockDim.y) {
                if(threadIdx.x + i < blockDim.x + 6 && 
                   threadIdx.y + j < blockDim.y + 6 && 
                   ((blockIdx.x * blockDim.x + threadIdx.x) - 3 + i) < _21180_23497.e2 && 
                   ((blockIdx.y * blockDim.y + threadIdx.y) - 3 + j) < _21180_23497.e3) {
                    ds_img[threadIdx.x + i][threadIdx.y + j] = \
                      _23549[((blockIdx.y * blockDim.y + threadIdx.y) - 3 + j) * _21180_23497.e2 + ((blockIdx.x * blockDim.x + threadIdx.x) - 3 + i)];
                }
            }
        }
        
        __syncthreads();
        
        #line 60 "gpu_device.impala"
        double* _23565;
        _23565 = _23562 + _23564;
        #line 39 "gaussian.impala"
        bool _23528;
        _23528 = v_anchor_23527 <= gid_y_23522;
        #line 39 "gaussian.impala"
        if (_23528) goto l23529; else goto l23575;
    l23575: ;
        #line 49 "gaussian.impala"
        goto l23569;
    l23529: ;
        #line 39 "gaussian.impala"
        int _23530;
        _23530 = _23523 - v_anchor_23527;
        #line 39 "gaussian.impala"
        bool _23531;
        _23531 = gid_y_23522 < _23530;
        #line 39 "gaussian.impala"
        if (_23531) goto l23532; else goto l23568;
    l23568: ;
        #line 49 "gaussian.impala"
        goto l23569;
    l23569: ;
        #line 65 "gpu_device.impala"
        #line 100 "shared_memory_access"
        double* _23570;
        _23570 = &ds_img[_23564 % _21180_23497.e2 + 3 - blockIdx.x * blockDim.x][_23564 / _21180_23497.e2 + 3 - blockIdx.y * blockDim.y];
        #line 65 "gpu_device.impala"
        double _23571;
        _23571 = *_23570;
        #line 65 "gpu_device.impala"
        double _23573;
        _23573 = _23571;
        #line 60 "gpu_device.impala"
        *_23565 = _23573;
        return ;
    l23532: ;
        #line 41 "gaussian.impala"
        int _23567;
        _23567 = 0 - v_anchor_23527;
        #line 70 "gpu_device.impala"
        struct_Buffer_5491 _23541;
        _23541 = _21176_23493.e0;
        #line 41 "gaussian.impala"
        int _23537;
        _23537 = 1 + v_anchor_23527;
        #line 70 "gpu_device.impala"
        char* _23542;
        _23542 = _23541.e1;
        #line 70 "gpu_device.impala"
        double* _23543;
        union { double* dst; char* src; } u_23543;
        u_23543.src = _23542;
        _23543 = u_23543.dst;
        #line 200 "shared_memory_filter_copy"
        for(int i = 0; i < 7; i++) {
            ds_filter[i] = _23543[i];
        }
        
        __syncthreads();
        
        #line 19 "gpu_device.impala"
        p_23534 = _23567;
        psum_23536 = 0.000000e+00;
        goto l23533;
    l23533: ;
        _23534 = p_23534;
        sum_23536 = psum_23536;
        #line 19 "gpu_device.impala"
        bool _23538;
        _23538 = _23534 < _23537;
        #line 19 "gpu_device.impala"
        if (_23538) goto l23539; else goto l23560;
    l23560: ;
        #line 60 "gpu_device.impala"
        *_23565 = sum_23536;
        return ;
    l23539: ;
        #line 23 "gpu_device.impala"
        int _23540;
        _23540 = 1 + _23534;
        #line 43 "gaussian.impala"
        int _23550;
        _23550 = gid_y_23522 + _23534;
        #line 43 "gaussian.impala"
        int _23544;
        _23544 = _23534 + v_anchor_23527;
        #line 65 "gpu_device.impala"
        int _23551;
        _23551 = _23550 * _23518;
        #line 69 "gpu_device.impala"
        #line 100 "shared_memory_access"
        double* i_23545;
        i_23545 = &ds_filter[_23544];
        #line 65 "gpu_device.impala"
        int _23552;
        _23552 = _23551 + gid_x_23517;
        #line 70 "gpu_device.impala"
        double _23546;
        _23546 = *i_23545;
        #line 65 "gpu_device.impala"
        #line 100 "shared_memory_access"
        double* _23553;
        _23553 = &ds_img[_23552 % _21180_23497.e2 + 3 - blockIdx.x * blockDim.x][_23552 / _21180_23497.e2 + 3 - blockIdx.y * blockDim.y];
        #line 70 "gpu_device.impala"
        double _23556;
        _23556 = _23546;
        #line 65 "gpu_device.impala"
        double _23554;
        _23554 = *_23553;
        #line 65 "gpu_device.impala"
        double _23557;
        _23557 = _23554;
        #line 43 "gaussian.impala"
        double _23558;
        _23558 = _23556 * _23557;
        #line 43 "gaussian.impala"
        double _23559;
        _23559 = sum_23536 + _23558;
        #line 19 "gpu_device.impala"
        p_23534 = _23540;
        psum_23536 = _23559;
        goto l23533;
}

}