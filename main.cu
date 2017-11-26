extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5487;
typedef struct {
    struct_Buffer_5487 e0;
    struct_Buffer_5487 e1;
    int e2;
    int e3;
} struct_image_5486;
typedef struct {
    struct_Buffer_5487 e0;
    int e1;
    int e2;
} struct_filter_5490;

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
__global__ void lambda_21017(struct_image_5486, struct_filter_5490, struct_Buffer_5487);
__global__ void lambda_21149(struct_filter_5490, struct_image_5486, double*, struct_Buffer_5487, struct_Buffer_5487);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_21017(struct_image_5486 _21020_23356, struct_filter_5490 _21021_23357, struct_Buffer_5487 _21022_23358) {
    __shared__ double ds_img[134][7];
    int  _23364;
    int p_23364;
    int  _23370;
    int p_23370;
    int  _23376;
    int p_23376;
    int  _23382;
    int p_23382;
    int  _23388;
    int p_23388;
    int  _23394;
    int p_23394;
    int  _23417;
    int p_23417;
    double  sum_23419;
    double psum_23419;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23364 = blockIdx_x();
    p_23364 = _23364;
    l23362: ;
        _23364 = p_23364;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23370 = blockDim_x();
        p_23370 = _23370;
    l23368: ;
        _23370 = p_23370;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23376 = threadIdx_x();
        p_23376 = _23376;
    l23374: ;
        _23376 = p_23376;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23382 = blockIdx_y();
        p_23382 = _23382;
    l23380: ;
        _23382 = p_23382;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23388 = blockDim_y();
        p_23388 = _23388;
    l23386: ;
        _23388 = p_23388;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23394 = threadIdx_y();
        p_23394 = _23394;
    l23392: ;
        _23394 = p_23394;
        #line 11 "main.impala"
        int _23398;
        _23398 = _21020_23356.e2;
        #line 170 "gpu_device.impala"
        int _23395;
        _23395 = _23364 * _23370;
        #line 170 "gpu_device.impala"
        int gid_x_23396;
        gid_x_23396 = _23395 + _23376;
        #line 175 "gpu_device.impala"
        bool _23399;
        _23399 = gid_x_23396 < _23398;
        #line 175 "gpu_device.impala"
        if (_23399) goto l23400; else goto l23465;
    l23465: ;
        #line 178 "gpu_device.impala"
        goto l23464;
    l23400: ;
        #line 11 "main.impala"
        int _23404;
        _23404 = _21020_23356.e3;
        #line 172 "gpu_device.impala"
        int _23401;
        _23401 = _23382 * _23388;
        #line 172 "gpu_device.impala"
        int gid_y_23402;
        gid_y_23402 = _23401 + _23394;
        #line 175 "gpu_device.impala"
        bool _23405;
        _23405 = gid_y_23402 < _23404;
        #line 175 "gpu_device.impala"
        if (_23405) goto l23406; else goto l23463;
    l23463: ;
        #line 178 "gpu_device.impala"
        goto l23464;
    l23464: ;
        return ;
    l23406: ;
        #line 65 "gpu_device.impala"
        int _23436;
        _23436 = gid_y_23402 * _23398;
        #line 4 "gaussian.impala"
        int _23408;
        _23408 = _21021_23357.e1;
        #line 60 "gpu_device.impala"
        char* _23447;
        _23447 = _21022_23358.e1;
        #line 65 "gpu_device.impala"
        struct_Buffer_5487 _23433;
        _23433 = _21020_23356.e1;
        #line 65 "gpu_device.impala"
        int _23449;
        _23449 = _23436 + gid_x_23396;
        #line 4 "gaussian.impala"
        int h_anchor_23410;
        h_anchor_23410 = _23408 / 2;
        #line 60 "gpu_device.impala"
        double* _23448;
        union { double* dst; char* src; } u_23448;
        u_23448.src = _23447;
        _23448 = u_23448.dst;
        #line 65 "gpu_device.impala"
        char* _23434;
        _23434 = _23433.e1;
        #line 60 "gpu_device.impala"
        double* _23450;
        _23450 = _23448 + _23449;
        #line 17 "gaussian.impala"
        bool _23411;
        _23411 = h_anchor_23410 <= gid_x_23396;
        #line 65 "gpu_device.impala"
        double* _23435;
        union { double* dst; char* src; } u_23435;
        u_23435.src = _23434;
        _23435 = u_23435.dst;
        #line 100 "shared_memory_copy"
        for(int i = 0; i < blockDim.x + 6; i += blockDim.x) {
            for(int j = 0; j < blockDim.y + 6; j += blockDim.y) {
                if(threadIdx.x + i < blockDim.x + 6 && 
                   threadIdx.y + j < blockDim.y + 6 && 
                   ((blockIdx.x * blockDim.x + threadIdx.x) - 3 + i) < _21020_23356.e2 && 
                   ((blockIdx.y * blockDim.y + threadIdx.y) - 3 + j) < _21020_23356.e3) {
                    ds_img[threadIdx.x + i][threadIdx.y + j] = \
                      _23435[((blockIdx.y * blockDim.y + threadIdx.y) - 3 + j) * _21020_23356.e2 + ((blockIdx.x * blockDim.x + threadIdx.x) - 3 + i)];
                }
            }
        }
        
        __syncthreads();
        
        #line 17 "gaussian.impala"
        if (_23411) goto l23412; else goto l23462;
    l23462: ;
        #line 27 "gaussian.impala"
        goto l23456;
    l23412: ;
        #line 17 "gaussian.impala"
        int _23413;
        _23413 = _23398 - h_anchor_23410;
        #line 17 "gaussian.impala"
        bool _23414;
        _23414 = gid_x_23396 < _23413;
        #line 17 "gaussian.impala"
        if (_23414) goto l23415; else goto l23455;
    l23455: ;
        #line 27 "gaussian.impala"
        goto l23456;
    l23456: ;
        #line 65 "gpu_device.impala"
        #line 100 "shared_memory_access"
        double* _23457;
        _23457 = &ds_img[_23449 % _21020_23356.e2 + 3 - blockIdx.x * blockDim.x][_23449 / _21020_23356.e2 + 3 - blockIdx.y * blockDim.y];
        #line 65 "gpu_device.impala"
        double _23458;
        _23458 = *_23457;
        #line 65 "gpu_device.impala"
        double _23460;
        _23460 = _23458;
        #line 60 "gpu_device.impala"
        *_23450 = _23460;
        return ;
    l23415: ;
        #line 19 "gaussian.impala"
        int _23421;
        _23421 = 1 + h_anchor_23410;
        #line 19 "gaussian.impala"
        int _23453;
        _23453 = 0 - h_anchor_23410;
        #line 70 "gpu_device.impala"
        struct_Buffer_5487 _23426;
        _23426 = _21021_23357.e0;
        #line 70 "gpu_device.impala"
        char* _23427;
        _23427 = _23426.e1;
        #line 70 "gpu_device.impala"
        double* _23428;
        union { double* dst; char* src; } u_23428;
        u_23428.src = _23427;
        _23428 = u_23428.dst;
        #line 19 "gpu_device.impala"
        p_23417 = _23453;
        psum_23419 = 0.000000e+00;
        goto l23416;
    l23416: ;
        _23417 = p_23417;
        sum_23419 = psum_23419;
        #line 19 "gpu_device.impala"
        bool _23422;
        _23422 = _23417 < _23421;
        #line 19 "gpu_device.impala"
        if (_23422) goto l23423; else goto l23446;
    l23446: ;
        #line 60 "gpu_device.impala"
        *_23450 = sum_23419;
        return ;
    l23423: ;
        #line 21 "gaussian.impala"
        int _23429;
        _23429 = _23417 + h_anchor_23410;
        #line 21 "gaussian.impala"
        int _23437;
        _23437 = gid_x_23396 + _23417;
        #line 69 "gpu_device.impala"
        double* i_23430;
        i_23430 = _23428 + _23429;
        #line 23 "gpu_device.impala"
        int _23424;
        _23424 = 1 + _23417;
        #line 65 "gpu_device.impala"
        int _23438;
        _23438 = _23436 + _23437;
        #line 70 "gpu_device.impala"
        double _23431;
        _23431 = *i_23430;
        #line 65 "gpu_device.impala"
        #line 100 "shared_memory_access"
        double* _23439;
        _23439 = &ds_img[_23438 % _21020_23356.e2 + 3 - blockIdx.x * blockDim.x][_23438 / _21020_23356.e2 + 3 - blockIdx.y * blockDim.y];
        #line 70 "gpu_device.impala"
        double _23442;
        _23442 = _23431;
        #line 65 "gpu_device.impala"
        double _23440;
        _23440 = *_23439;
        #line 65 "gpu_device.impala"
        double _23443;
        _23443 = _23440;
        #line 21 "gaussian.impala"
        double _23444;
        _23444 = _23442 * _23443;
        #line 21 "gaussian.impala"
        double _23445;
        _23445 = sum_23419 + _23444;
        #line 19 "gpu_device.impala"
        p_23417 = _23424;
        psum_23419 = _23445;
        goto l23416;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_21149(struct_filter_5490 _21152_23469, struct_image_5486 _21153_23470, double* _21154_23471, struct_Buffer_5487 _21155_23472, struct_Buffer_5487 _21156_23473) {
    __shared__ double ds_img[134][7];
    int  _23476;
    int p_23476;
    int  _23479;
    int p_23479;
    int  _23482;
    int p_23482;
    int  _23485;
    int p_23485;
    int  _23488;
    int p_23488;
    int  _23491;
    int p_23491;
    int  _23510;
    int p_23510;
    double  sum_23512;
    double psum_23512;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23476 = blockIdx_x();
    p_23476 = _23476;
    l23474: ;
        _23476 = p_23476;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23479 = blockDim_x();
        p_23479 = _23479;
    l23477: ;
        _23479 = p_23479;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23482 = threadIdx_x();
        p_23482 = _23482;
    l23480: ;
        _23482 = p_23482;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23485 = blockIdx_y();
        p_23485 = _23485;
    l23483: ;
        _23485 = p_23485;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23488 = blockDim_y();
        p_23488 = _23488;
    l23486: ;
        _23488 = p_23488;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23491 = threadIdx_y();
        p_23491 = _23491;
    l23489: ;
        _23491 = p_23491;
        #line 170 "gpu_device.impala"
        int _23492;
        _23492 = _23476 * _23479;
        #line 170 "gpu_device.impala"
        int gid_x_23493;
        gid_x_23493 = _23492 + _23482;
        #line 11 "main.impala"
        int _23494;
        _23494 = _21153_23470.e2;
        #line 175 "gpu_device.impala"
        bool _23495;
        _23495 = gid_x_23493 < _23494;
        #line 175 "gpu_device.impala"
        if (_23495) goto l23496; else goto l23554;
    l23554: ;
        #line 178 "gpu_device.impala"
        goto l23553;
    l23496: ;
        #line 172 "gpu_device.impala"
        int _23497;
        _23497 = _23485 * _23488;
        #line 172 "gpu_device.impala"
        int gid_y_23498;
        gid_y_23498 = _23497 + _23491;
        #line 11 "main.impala"
        int _23499;
        _23499 = _21153_23470.e3;
        #line 175 "gpu_device.impala"
        bool _23500;
        _23500 = gid_y_23498 < _23499;
        #line 175 "gpu_device.impala"
        if (_23500) goto l23501; else goto l23552;
    l23552: ;
        #line 178 "gpu_device.impala"
        goto l23553;
    l23553: ;
        return ;
    l23501: ;
        #line 65 "gpu_device.impala"
        int _23539;
        _23539 = gid_y_23498 * _23494;
        #line 65 "gpu_device.impala"
        int _23540;
        _23540 = _23539 + gid_x_23493;
        #line 6 "gaussian.impala"
        int _23502;
        _23502 = _21152_23469.e2;
        #line 65 "gpu_device.impala"
        char* _23524;
        _23524 = _21156_23473.e1;
        #line 60 "gpu_device.impala"
        char* _23537;
        _23537 = _21155_23472.e1;
        #line 65 "gpu_device.impala"
        double* _23525;
        union { double* dst; char* src; } u_23525;
        u_23525.src = _23524;
        _23525 = u_23525.dst;
        #line 100 "shared_memory_copy"
        for(int i = 0; i < blockDim.x + 6; i += blockDim.x) {
            for(int j = 0; j < blockDim.y + 6; j += blockDim.y) {
                if(threadIdx.x + i < blockDim.x + 6 && 
                   threadIdx.y + j < blockDim.y + 6 && 
                   ((blockIdx.x * blockDim.x + threadIdx.x) - 3 + i) < _21153_23470.e2 && 
                   ((blockIdx.y * blockDim.y + threadIdx.y) - 3 + j) < _21153_23470.e3) {
                    ds_img[threadIdx.x + i][threadIdx.y + j] = \
                      _23525[((blockIdx.y * blockDim.y + threadIdx.y) - 3 + j) * _21153_23470.e2 + ((blockIdx.x * blockDim.x + threadIdx.x) - 3 + i)];
                }
            }
        }
        
        __syncthreads();
        
        #line 6 "gaussian.impala"
        int v_anchor_23503;
        v_anchor_23503 = _23502 / 2;
        #line 60 "gpu_device.impala"
        double* _23538;
        union { double* dst; char* src; } u_23538;
        u_23538.src = _23537;
        _23538 = u_23538.dst;
        #line 39 "gaussian.impala"
        bool _23504;
        _23504 = v_anchor_23503 <= gid_y_23498;
        #line 60 "gpu_device.impala"
        double* _23541;
        _23541 = _23538 + _23540;
        #line 39 "gaussian.impala"
        if (_23504) goto l23505; else goto l23551;
    l23551: ;
        #line 49 "gaussian.impala"
        goto l23545;
    l23505: ;
        #line 39 "gaussian.impala"
        int _23506;
        _23506 = _23499 - v_anchor_23503;
        #line 39 "gaussian.impala"
        bool _23507;
        _23507 = gid_y_23498 < _23506;
        #line 39 "gaussian.impala"
        if (_23507) goto l23508; else goto l23544;
    l23544: ;
        #line 49 "gaussian.impala"
        goto l23545;
    l23545: ;
        #line 65 "gpu_device.impala"
        #line 100 "shared_memory_access"
        double* _23546;
        _23546 = &ds_img[_23540 % _21153_23470.e2 + 3 - blockIdx.x * blockDim.x][_23540 / _21153_23470.e2 + 3 - blockIdx.y * blockDim.y];
        #line 65 "gpu_device.impala"
        double _23547;
        _23547 = *_23546;
        #line 65 "gpu_device.impala"
        double _23549;
        _23549 = _23547;
        #line 60 "gpu_device.impala"
        *_23541 = _23549;
        return ;
    l23508: ;
        #line 41 "gaussian.impala"
        int _23513;
        _23513 = 1 + v_anchor_23503;
        #line 41 "gaussian.impala"
        int _23543;
        _23543 = 0 - v_anchor_23503;
        #line 70 "gpu_device.impala"
        struct_Buffer_5487 _23517;
        _23517 = _21152_23469.e0;
        #line 70 "gpu_device.impala"
        char* _23518;
        _23518 = _23517.e1;
        #line 70 "gpu_device.impala"
        double* _23519;
        union { double* dst; char* src; } u_23519;
        u_23519.src = _23518;
        _23519 = u_23519.dst;
        #line 19 "gpu_device.impala"
        p_23510 = _23543;
        psum_23512 = 0.000000e+00;
        goto l23509;
    l23509: ;
        _23510 = p_23510;
        sum_23512 = psum_23512;
        #line 19 "gpu_device.impala"
        bool _23514;
        _23514 = _23510 < _23513;
        #line 19 "gpu_device.impala"
        if (_23514) goto l23515; else goto l23536;
    l23536: ;
        #line 60 "gpu_device.impala"
        *_23541 = sum_23512;
        return ;
    l23515: ;
        #line 43 "gaussian.impala"
        int _23520;
        _23520 = _23510 + v_anchor_23503;
        #line 69 "gpu_device.impala"
        double* i_23521;
        i_23521 = _23519 + _23520;
        #line 43 "gaussian.impala"
        int _23526;
        _23526 = gid_y_23498 + _23510;
        #line 23 "gpu_device.impala"
        int _23516;
        _23516 = 1 + _23510;
        #line 70 "gpu_device.impala"
        double _23522;
        _23522 = *i_23521;
        #line 65 "gpu_device.impala"
        int _23527;
        _23527 = _23526 * _23494;
        #line 70 "gpu_device.impala"
        double _23532;
        _23532 = _23522;
        #line 65 "gpu_device.impala"
        int _23528;
        _23528 = _23527 + gid_x_23493;
        #line 65 "gpu_device.impala"
        #line 100 "shared_memory_access"
        double* _23529;
        _23529 = &ds_img[_23528 % _21153_23470.e2 + 3 - blockIdx.x * blockDim.x][_23528 / _21153_23470.e2 + 3 - blockIdx.y * blockDim.y];
        #line 65 "gpu_device.impala"
        double _23530;
        _23530 = *_23529;
        #line 65 "gpu_device.impala"
        double _23533;
        _23533 = _23530;
        #line 43 "gaussian.impala"
        double _23534;
        _23534 = _23532 * _23533;
        #line 43 "gaussian.impala"
        double _23535;
        _23535 = sum_23512 + _23534;
        #line 19 "gpu_device.impala"
        p_23510 = _23516;
        psum_23512 = _23535;
        goto l23509;
}

}