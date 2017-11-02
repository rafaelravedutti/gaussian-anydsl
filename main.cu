extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_6341;
typedef struct {
    struct_Buffer_6341 e0;
    int e1;
    int e2;
} struct_filter_6340;
typedef struct {
    struct_Buffer_6341 e0;
    struct_Buffer_6341 e1;
    int e2;
    int e3;
} struct_image_6346;

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
__global__ void lambda_25604(struct_filter_6340, double*, struct_Buffer_6341, struct_image_6346);
__global__ void lambda_25866(double*, double*, struct_filter_6340, struct_Buffer_6341, struct_image_6346);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_25604(struct_filter_6340 _25607_30475, double* _25608_30476, struct_Buffer_6341 _25609_30477, struct_image_6346 _25610_30478) {
    int  bdimx_30484;
    int pbdimx_30484;
    int  bdimy_30490;
    int pbdimy_30490;
    int  bidx_30496;
    int pbidx_30496;
    int  bidy_30502;
    int pbidy_30502;
    int  tidx_30508;
    int ptidx_30508;
    int  tidy_30514;
    int ptidy_30514;
    double*  reserve_shared_30522;
    double* preserve_shared_30522;
    int  _30525;
    int p_30525;
    int  _30528;
    int p_30528;
    int  _30539;
    int p_30539;
    int  _30595;
    int p_30595;
    int  _30661;
    int p_30661;
    double  sum_30663;
    double psum_30663;
    int  _30600;
    int p_30600;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    bdimx_30484 = blockDim_x();
    pbdimx_30484 = bdimx_30484;
    l30482: ;
        bdimx_30484 = pbdimx_30484;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bdimy_30490 = blockDim_y();
        pbdimy_30490 = bdimy_30490;
    l30488: ;
        bdimy_30490 = pbdimy_30490;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidx_30496 = blockIdx_x();
        pbidx_30496 = bidx_30496;
    l30494: ;
        bidx_30496 = pbidx_30496;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidy_30502 = blockIdx_y();
        pbidy_30502 = bidy_30502;
    l30500: ;
        bidy_30502 = pbidy_30502;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidx_30508 = threadIdx_x();
        ptidx_30508 = tidx_30508;
    l30506: ;
        tidx_30508 = ptidx_30508;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidy_30514 = threadIdx_y();
        ptidy_30514 = tidy_30514;
    l30512: ;
        tidy_30514 = ptidy_30514;
        #line 201 "gpu_device_shm.impala"
        __shared__ double reserver_reserve_shared_30522[938];
        preserve_shared_30522 = reserver_reserve_shared_30522;
    l30520: ;
        reserve_shared_30522 = preserve_shared_30522;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _30525 = blockDim_x();
        p_30525 = _30525;
    l30523: ;
        _30525 = p_30525;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _30528 = blockDim_y();
        p_30528 = _30528;
    l30526: ;
        _30528 = p_30528;
        #line 4 "gaussian.impala"
        int _30542;
        _30542 = _25607_30475.e1;
        #line 189 "gpu_device_shm.impala"
        int _30562;
        _30562 = bidy_30502 * bdimy_30490;
        #line 187 "gpu_device_shm.impala"
        int _30553;
        _30553 = bidx_30496 * bdimx_30484;
        #line 193 "gpu_device_shm.impala"
        int _30532;
        _30532 = _25607_30475.e2;
        #line 189 "gpu_device_shm.impala"
        int gid_y_30563;
        gid_y_30563 = _30562 + tidy_30514;
        #line 4 "gaussian.impala"
        int h_anchor_30543;
        h_anchor_30543 = _30542 / 2;
        #line 11 "main.impala"
        int _30568;
        _30568 = _25610_30478.e3;
        #line 193 "gpu_device_shm.impala"
        int extend_height_30533;
        extend_height_30533 = _30532 / 2;
        #line 187 "gpu_device_shm.impala"
        int gid_x_30554;
        gid_x_30554 = _30553 + tidx_30508;
        #line 195 "gpu_device_shm.impala"
        int _30544;
        _30544 = 2 * h_anchor_30543;
        #line 197 "gpu_device_shm.impala"
        int _30534;
        _30534 = 2 * extend_height_30533;
        #line 11 "main.impala"
        int _30559;
        _30559 = _25610_30478.e2;
        #line 195 "gpu_device_shm.impala"
        int shm_dimx_30545;
        shm_dimx_30545 = bdimx_30484 + _30544;
        #line 197 "gpu_device_shm.impala"
        int shm_dimy_30535;
        shm_dimy_30535 = bdimy_30490 + _30534;
        #line 38 "gpu_device_shm.impala"
        bool _30536;
        _30536 = 0 < shm_dimy_30535;
        #line 38 "gpu_device_shm.impala"
        if (_30536) goto l30537; else goto l30714;
    l30714: ;
        #line 231 "gpu_device_shm.impala"
        goto l30644;
    l30537: ;
        #line 219 "gpu_device_shm.impala"
        int _30555;
        _30555 = gid_x_30554 - h_anchor_30543;
        #line 226 "gpu_device_shm.impala"
        int _30580;
        _30580 = tidy_30514 * shm_dimx_30545;
        #line 221 "gpu_device_shm.impala"
        int _30564;
        _30564 = gid_y_30563 - extend_height_30533;
        #line 224 "gpu_device_shm.impala"
        bool _30569;
        _30569 = _30564 < _30568;
        #line 224 "gpu_device_shm.impala"
        bool _30565;
        _30565 = 0 <= _30564;
        #line 217 "gpu_device_shm.impala"
        bool _30551;
        _30551 = tidy_30514 < shm_dimy_30535;
        #line 227 "gpu_device_shm.impala"
        int _30574;
        _30574 = _30564 * _30559;
        #line 38 "gpu_device_shm.impala"
        p_30539 = 0;
        goto l30538;
    l30538: ;
        _30539 = p_30539;
        #line 38 "gpu_device_shm.impala"
        bool _30546;
        _30546 = _30539 < shm_dimx_30545;
        #line 38 "gpu_device_shm.impala"
        if (_30546) goto l30547; else goto l30593;
    l30593: ;
        #line 38 "gpu_device_shm.impala"
        p_30595 = bdimy_30490;
        goto l30594;
    l30594: ;
        _30595 = p_30595;
        #line 38 "gpu_device_shm.impala"
        bool _30597;
        _30597 = _30595 < shm_dimy_30535;
        #line 38 "gpu_device_shm.impala"
        if (_30597) goto l30598; else goto l30643;
    l30643: ;
        #line 231 "gpu_device_shm.impala"
        goto l30644;
    l30644: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        __syncthreads();
    l30649: ;
        #line 237 "gpu_device_shm.impala"
        bool _30651;
        _30651 = gid_x_30554 < _30559;
        #line 237 "gpu_device_shm.impala"
        if (_30651) goto l30652; else goto l30713;
    l30713: ;
        #line 240 "gpu_device_shm.impala"
        goto l30712;
    l30652: ;
        #line 237 "gpu_device_shm.impala"
        bool _30653;
        _30653 = gid_y_30563 < _30568;
        #line 237 "gpu_device_shm.impala"
        if (_30653) goto l30654; else goto l30711;
    l30711: ;
        #line 240 "gpu_device_shm.impala"
        goto l30712;
    l30712: ;
        return ;
    l30654: ;
        #line 204 "gpu_device_shm.impala"
        int _30676;
        _30676 = bidy_30502 * _30528;
        #line 64 "gpu_device_shm.impala"
        char* _30693;
        _30693 = _25609_30477.e1;
        #line 17 "gaussian.impala"
        bool _30655;
        _30655 = h_anchor_30543 <= gid_x_30554;
        #line 64 "gpu_device_shm.impala"
        double* _30694;
        union { double* dst; char* src; } u_30694;
        u_30694.src = _30693;
        _30694 = u_30694.dst;
        #line 204 "gpu_device_shm.impala"
        int _30677;
        _30677 = extend_height_30533 - _30676;
        #line 64 "gpu_device_shm.impala"
        int _30695;
        _30695 = gid_y_30563 * _30559;
        #line 203 "gpu_device_shm.impala"
        int _30682;
        _30682 = bidx_30496 * _30525;
        #line 203 "gpu_device_shm.impala"
        int _30683;
        _30683 = h_anchor_30543 - _30682;
        #line 72 "gpu_device_shm.impala"
        int _30678;
        _30678 = gid_y_30563 + _30677;
        #line 64 "gpu_device_shm.impala"
        int _30696;
        _30696 = _30695 + gid_x_30554;
        #line 72 "gpu_device_shm.impala"
        int _30679;
        _30679 = _30678 * shm_dimx_30545;
        #line 64 "gpu_device_shm.impala"
        double* _30697;
        _30697 = _30694 + _30696;
        #line 17 "gaussian.impala"
        if (_30655) goto l30656; else goto l30710;
    l30710: ;
        #line 27 "gaussian.impala"
        goto l30702;
    l30656: ;
        #line 17 "gaussian.impala"
        int _30657;
        _30657 = _30559 - h_anchor_30543;
        #line 17 "gaussian.impala"
        bool _30658;
        _30658 = gid_x_30554 < _30657;
        #line 17 "gaussian.impala"
        if (_30658) goto l30659; else goto l30701;
    l30701: ;
        #line 27 "gaussian.impala"
        goto l30702;
    l30702: ;
        #line 72 "gpu_device_shm.impala"
        int _30703;
        _30703 = _30679 + gid_x_30554;
        #line 72 "gpu_device_shm.impala"
        int _30704;
        _30704 = _30703 + _30683;
        #line 72 "gpu_device_shm.impala"
        double* _30705;
        _30705 = reserve_shared_30522 + _30704;
        #line 72 "gpu_device_shm.impala"
        double _30706;
        _30706 = *_30705;
        #line 72 "gpu_device_shm.impala"
        double _30708;
        _30708 = _30706;
        #line 64 "gpu_device_shm.impala"
        *_30697 = _30708;
        return ;
    l30659: ;
        #line 19 "gaussian.impala"
        int _30665;
        _30665 = 1 + h_anchor_30543;
        #line 77 "gpu_device_shm.impala"
        struct_Buffer_6341 _30669;
        _30669 = _25607_30475.e0;
        #line 19 "gaussian.impala"
        int _30699;
        _30699 = 0 - h_anchor_30543;
        #line 77 "gpu_device_shm.impala"
        char* _30670;
        _30670 = _30669.e1;
        #line 77 "gpu_device_shm.impala"
        double* _30671;
        union { double* dst; char* src; } u_30671;
        u_30671.src = _30670;
        _30671 = u_30671.dst;
        #line 27 "gpu_device_shm.impala"
        p_30661 = _30699;
        psum_30663 = 0.000000e+00;
        goto l30660;
    l30660: ;
        _30661 = p_30661;
        sum_30663 = psum_30663;
        #line 27 "gpu_device_shm.impala"
        bool _30666;
        _30666 = _30661 < _30665;
        #line 27 "gpu_device_shm.impala"
        if (_30666) goto l30667; else goto l30692;
    l30692: ;
        #line 64 "gpu_device_shm.impala"
        *_30697 = sum_30663;
        return ;
    l30667: ;
        #line 21 "gaussian.impala"
        int _30672;
        _30672 = _30661 + h_anchor_30543;
        #line 21 "gaussian.impala"
        int _30680;
        _30680 = gid_x_30554 + _30661;
        #line 31 "gpu_device_shm.impala"
        int _30668;
        _30668 = 1 + _30661;
        #line 76 "gpu_device_shm.impala"
        double* i_30673;
        i_30673 = _30671 + _30672;
        #line 72 "gpu_device_shm.impala"
        int _30681;
        _30681 = _30679 + _30680;
        #line 77 "gpu_device_shm.impala"
        double _30674;
        _30674 = *i_30673;
        #line 72 "gpu_device_shm.impala"
        int _30684;
        _30684 = _30681 + _30683;
        #line 77 "gpu_device_shm.impala"
        double _30688;
        _30688 = _30674;
        #line 72 "gpu_device_shm.impala"
        double* _30685;
        _30685 = reserve_shared_30522 + _30684;
        #line 72 "gpu_device_shm.impala"
        double _30686;
        _30686 = *_30685;
        #line 72 "gpu_device_shm.impala"
        double _30689;
        _30689 = _30686;
        #line 21 "gaussian.impala"
        double _30690;
        _30690 = _30688 * _30689;
        #line 21 "gaussian.impala"
        double _30691;
        _30691 = sum_30663 + _30690;
        #line 27 "gpu_device_shm.impala"
        p_30661 = _30668;
        psum_30663 = _30691;
        goto l30660;
    l30598: ;
        #line 221 "gpu_device_shm.impala"
        int img_index_y_30615;
        img_index_y_30615 = _30564 + _30595;
        #line 214 "gpu_device_shm.impala"
        int shm_index_y_30607;
        shm_index_y_30607 = tidy_30514 + _30595;
        #line 226 "gpu_device_shm.impala"
        int _30628;
        _30628 = shm_index_y_30607 * shm_dimx_30545;
        #line 224 "gpu_device_shm.impala"
        bool _30616;
        _30616 = 0 <= img_index_y_30615;
        #line 227 "gpu_device_shm.impala"
        int _30623;
        _30623 = img_index_y_30615 * _30559;
        #line 224 "gpu_device_shm.impala"
        bool _30618;
        _30618 = img_index_y_30615 < _30568;
        #line 217 "gpu_device_shm.impala"
        bool _30608;
        _30608 = shm_index_y_30607 < shm_dimy_30535;
        #line 38 "gpu_device_shm.impala"
        p_30600 = 0;
        goto l30599;
    l30599: ;
        _30600 = p_30600;
        #line 38 "gpu_device_shm.impala"
        bool _30602;
        _30602 = _30600 < shm_dimx_30545;
        #line 38 "gpu_device_shm.impala"
        if (_30602) goto l30603; else goto l30641;
    l30641: ;
        #line 42 "gpu_device_shm.impala"
        int _30642;
        _30642 = _30595 + bdimy_30490;
        #line 38 "gpu_device_shm.impala"
        p_30595 = _30642;
        goto l30594;
    l30603: ;
        #line 212 "gpu_device_shm.impala"
        int shm_index_x_30604;
        shm_index_x_30604 = tidx_30508 + _30600;
        #line 217 "gpu_device_shm.impala"
        bool _30605;
        _30605 = shm_index_x_30604 < shm_dimx_30545;
        #line 217 "gpu_device_shm.impala"
        if (_30605) goto l30606; else goto l30640;
    l30640: ;
        #line 229 "gpu_device_shm.impala"
        goto l30639;
    l30606: ;
        #line 217 "gpu_device_shm.impala"
        if (_30608) goto l30609; else goto l30638;
    l30638: ;
        #line 229 "gpu_device_shm.impala"
        goto l30639;
    l30639: ;
        #line 40 "gpu_device_shm.impala"
        goto l30620;
    l30609: ;
        #line 219 "gpu_device_shm.impala"
        int img_index_x_30610;
        img_index_x_30610 = _30555 + _30600;
        #line 224 "gpu_device_shm.impala"
        bool _30611;
        _30611 = 0 <= img_index_x_30610;
        #line 224 "gpu_device_shm.impala"
        if (_30611) goto l30612; else goto l30637;
    l30637: ;
        #line 228 "gpu_device_shm.impala"
        goto l30634;
    l30612: ;
        #line 224 "gpu_device_shm.impala"
        bool _30613;
        _30613 = img_index_x_30610 < _30559;
        #line 224 "gpu_device_shm.impala"
        if (_30613) goto l30614; else goto l30636;
    l30636: ;
        #line 228 "gpu_device_shm.impala"
        goto l30634;
    l30614: ;
        #line 224 "gpu_device_shm.impala"
        if (_30616) goto l30617; else goto l30635;
    l30635: ;
        #line 228 "gpu_device_shm.impala"
        goto l30634;
    l30617: ;
        #line 224 "gpu_device_shm.impala"
        if (_30618) goto l30619; else goto l30633;
    l30633: ;
        #line 228 "gpu_device_shm.impala"
        goto l30634;
    l30634: ;
        #line 40 "gpu_device_shm.impala"
        goto l30620;
    l30619: ;
        #line 226 "gpu_device_shm.impala"
        int _30629;
        _30629 = _30628 + shm_index_x_30604;
        #line 227 "gpu_device_shm.impala"
        int _30624;
        _30624 = _30623 + img_index_x_30610;
        #line 226 "gpu_device_shm.impala"
        double* _30630;
        _30630 = reserve_shared_30522 + _30629;
        #line 227 "gpu_device_shm.impala"
        double* _30625;
        _30625 = _25608_30476 + _30624;
        #line 227 "gpu_device_shm.impala"
        double _30626;
        _30626 = *_30625;
        #line 227 "gpu_device_shm.impala"
        double _30631;
        _30631 = _30626;
        #line 226 "gpu_device_shm.impala"
        *_30630 = _30631;
        #line 40 "gpu_device_shm.impala"
        goto l30620;
    l30620: ;
        #line 42 "gpu_device_shm.impala"
        int _30622;
        _30622 = _30600 + bdimx_30484;
        #line 38 "gpu_device_shm.impala"
        p_30600 = _30622;
        goto l30599;
    l30547: ;
        #line 212 "gpu_device_shm.impala"
        int shm_index_x_30548;
        shm_index_x_30548 = tidx_30508 + _30539;
        #line 217 "gpu_device_shm.impala"
        bool _30549;
        _30549 = shm_index_x_30548 < shm_dimx_30545;
        #line 217 "gpu_device_shm.impala"
        if (_30549) goto l30550; else goto l30592;
    l30592: ;
        #line 229 "gpu_device_shm.impala"
        goto l30591;
    l30550: ;
        #line 217 "gpu_device_shm.impala"
        if (_30551) goto l30552; else goto l30590;
    l30590: ;
        #line 229 "gpu_device_shm.impala"
        goto l30591;
    l30591: ;
        #line 40 "gpu_device_shm.impala"
        goto l30571;
    l30552: ;
        #line 219 "gpu_device_shm.impala"
        int img_index_x_30556;
        img_index_x_30556 = _30555 + _30539;
        #line 224 "gpu_device_shm.impala"
        bool _30557;
        _30557 = 0 <= img_index_x_30556;
        #line 224 "gpu_device_shm.impala"
        if (_30557) goto l30558; else goto l30589;
    l30589: ;
        #line 228 "gpu_device_shm.impala"
        goto l30586;
    l30558: ;
        #line 224 "gpu_device_shm.impala"
        bool _30560;
        _30560 = img_index_x_30556 < _30559;
        #line 224 "gpu_device_shm.impala"
        if (_30560) goto l30561; else goto l30588;
    l30588: ;
        #line 228 "gpu_device_shm.impala"
        goto l30586;
    l30561: ;
        #line 224 "gpu_device_shm.impala"
        if (_30565) goto l30566; else goto l30587;
    l30587: ;
        #line 228 "gpu_device_shm.impala"
        goto l30586;
    l30566: ;
        #line 224 "gpu_device_shm.impala"
        if (_30569) goto l30570; else goto l30585;
    l30585: ;
        #line 228 "gpu_device_shm.impala"
        goto l30586;
    l30586: ;
        #line 40 "gpu_device_shm.impala"
        goto l30571;
    l30570: ;
        #line 227 "gpu_device_shm.impala"
        int _30575;
        _30575 = _30574 + img_index_x_30556;
        #line 227 "gpu_device_shm.impala"
        double* _30576;
        _30576 = _25608_30476 + _30575;
        #line 227 "gpu_device_shm.impala"
        double _30577;
        _30577 = *_30576;
        #line 226 "gpu_device_shm.impala"
        int _30581;
        _30581 = _30580 + shm_index_x_30548;
        #line 227 "gpu_device_shm.impala"
        double _30583;
        _30583 = _30577;
        #line 226 "gpu_device_shm.impala"
        double* _30582;
        _30582 = reserve_shared_30522 + _30581;
        #line 226 "gpu_device_shm.impala"
        *_30582 = _30583;
        #line 40 "gpu_device_shm.impala"
        goto l30571;
    l30571: ;
        #line 42 "gpu_device_shm.impala"
        int _30573;
        _30573 = _30539 + bdimx_30484;
        #line 38 "gpu_device_shm.impala"
        p_30539 = _30573;
        goto l30538;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_25866(double* _25869_30718, double* _25870_30719, struct_filter_6340 _25871_30720, struct_Buffer_6341 _25872_30721, struct_image_6346 _25873_30722) {
    int  bdimx_30725;
    int pbdimx_30725;
    int  bdimy_30728;
    int pbdimy_30728;
    int  bidx_30731;
    int pbidx_30731;
    int  bidy_30734;
    int pbidy_30734;
    int  tidx_30737;
    int ptidx_30737;
    int  tidy_30740;
    int ptidy_30740;
    double*  reserve_shared_30743;
    double* preserve_shared_30743;
    int  _30746;
    int p_30746;
    int  _30749;
    int p_30749;
    int  _30757;
    int p_30757;
    int  _30810;
    int p_30810;
    int  _30873;
    int p_30873;
    double  sum_30875;
    double psum_30875;
    int  _30815;
    int p_30815;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    bdimx_30725 = blockDim_x();
    pbdimx_30725 = bdimx_30725;
    l30723: ;
        bdimx_30725 = pbdimx_30725;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bdimy_30728 = blockDim_y();
        pbdimy_30728 = bdimy_30728;
    l30726: ;
        bdimy_30728 = pbdimy_30728;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidx_30731 = blockIdx_x();
        pbidx_30731 = bidx_30731;
    l30729: ;
        bidx_30731 = pbidx_30731;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        bidy_30734 = blockIdx_y();
        pbidy_30734 = bidy_30734;
    l30732: ;
        bidy_30734 = pbidy_30734;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidx_30737 = threadIdx_x();
        ptidx_30737 = tidx_30737;
    l30735: ;
        tidx_30737 = ptidx_30737;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        tidy_30740 = threadIdx_y();
        ptidy_30740 = tidy_30740;
    l30738: ;
        tidy_30740 = ptidy_30740;
        #line 201 "gpu_device_shm.impala"
        __shared__ double reserver_reserve_shared_30743[938];
        preserve_shared_30743 = reserver_reserve_shared_30743;
    l30741: ;
        reserve_shared_30743 = preserve_shared_30743;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _30746 = blockDim_x();
        p_30746 = _30746;
    l30744: ;
        _30746 = p_30746;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _30749 = blockDim_y();
        p_30749 = _30749;
    l30747: ;
        _30749 = p_30749;
        #line 189 "gpu_device_shm.impala"
        int _30779;
        _30779 = bidy_30734 * bdimy_30728;
        #line 11 "main.impala"
        int _30784;
        _30784 = _25873_30722.e3;
        #line 191 "gpu_device_shm.impala"
        int _30759;
        _30759 = _25871_30720.e1;
        #line 187 "gpu_device_shm.impala"
        int _30770;
        _30770 = bidx_30731 * bdimx_30725;
        #line 6 "gaussian.impala"
        int _30750;
        _30750 = _25871_30720.e2;
        #line 6 "gaussian.impala"
        int v_anchor_30751;
        v_anchor_30751 = _30750 / 2;
        #line 187 "gpu_device_shm.impala"
        int gid_x_30771;
        gid_x_30771 = _30770 + tidx_30737;
        #line 189 "gpu_device_shm.impala"
        int gid_y_30780;
        gid_y_30780 = _30779 + tidy_30740;
        #line 191 "gpu_device_shm.impala"
        int extend_width_30760;
        extend_width_30760 = _30759 / 2;
        #line 197 "gpu_device_shm.impala"
        int _30752;
        _30752 = 2 * v_anchor_30751;
        #line 197 "gpu_device_shm.impala"
        int shm_dimy_30753;
        shm_dimy_30753 = bdimy_30728 + _30752;
        #line 11 "main.impala"
        int _30776;
        _30776 = _25873_30722.e2;
        #line 195 "gpu_device_shm.impala"
        int _30761;
        _30761 = 2 * extend_width_30760;
        #line 38 "gpu_device_shm.impala"
        bool _30754;
        _30754 = 0 < shm_dimy_30753;
        #line 195 "gpu_device_shm.impala"
        int shm_dimx_30762;
        shm_dimx_30762 = bdimx_30725 + _30761;
        #line 38 "gpu_device_shm.impala"
        if (_30754) goto l30755; else goto l30926;
    l30926: ;
        #line 231 "gpu_device_shm.impala"
        goto l30859;
    l30755: ;
        #line 219 "gpu_device_shm.impala"
        int _30772;
        _30772 = gid_x_30771 - extend_width_30760;
        #line 217 "gpu_device_shm.impala"
        bool _30768;
        _30768 = tidy_30740 < shm_dimy_30753;
        #line 226 "gpu_device_shm.impala"
        int _30795;
        _30795 = tidy_30740 * shm_dimx_30762;
        #line 221 "gpu_device_shm.impala"
        int _30781;
        _30781 = gid_y_30780 - v_anchor_30751;
        #line 224 "gpu_device_shm.impala"
        bool _30782;
        _30782 = 0 <= _30781;
        #line 224 "gpu_device_shm.impala"
        bool _30785;
        _30785 = _30781 < _30784;
        #line 227 "gpu_device_shm.impala"
        int _30790;
        _30790 = _30781 * _30776;
        #line 38 "gpu_device_shm.impala"
        p_30757 = 0;
        goto l30756;
    l30756: ;
        _30757 = p_30757;
        #line 38 "gpu_device_shm.impala"
        bool _30763;
        _30763 = _30757 < shm_dimx_30762;
        #line 38 "gpu_device_shm.impala"
        if (_30763) goto l30764; else goto l30808;
    l30808: ;
        #line 38 "gpu_device_shm.impala"
        p_30810 = bdimy_30728;
        goto l30809;
    l30809: ;
        _30810 = p_30810;
        #line 38 "gpu_device_shm.impala"
        bool _30812;
        _30812 = _30810 < shm_dimy_30753;
        #line 38 "gpu_device_shm.impala"
        if (_30812) goto l30813; else goto l30858;
    l30858: ;
        #line 231 "gpu_device_shm.impala"
        goto l30859;
    l30859: ;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        __syncthreads();
    l30861: ;
        #line 237 "gpu_device_shm.impala"
        bool _30863;
        _30863 = gid_x_30771 < _30776;
        #line 237 "gpu_device_shm.impala"
        if (_30863) goto l30864; else goto l30925;
    l30925: ;
        #line 240 "gpu_device_shm.impala"
        goto l30924;
    l30864: ;
        #line 237 "gpu_device_shm.impala"
        bool _30865;
        _30865 = gid_y_30780 < _30784;
        #line 237 "gpu_device_shm.impala"
        if (_30865) goto l30866; else goto l30923;
    l30923: ;
        #line 240 "gpu_device_shm.impala"
        goto l30924;
    l30924: ;
        return ;
    l30866: ;
        #line 203 "gpu_device_shm.impala"
        int _30893;
        _30893 = bidx_30731 * _30746;
        #line 39 "gaussian.impala"
        bool _30867;
        _30867 = v_anchor_30751 <= gid_y_30780;
        #line 64 "gpu_device_shm.impala"
        char* _30904;
        _30904 = _25872_30721.e1;
        #line 203 "gpu_device_shm.impala"
        int _30894;
        _30894 = extend_width_30760 - _30893;
        #line 64 "gpu_device_shm.impala"
        int _30906;
        _30906 = gid_y_30780 * _30776;
        #line 204 "gpu_device_shm.impala"
        int _30888;
        _30888 = bidy_30734 * _30749;
        #line 64 "gpu_device_shm.impala"
        double* _30905;
        union { double* dst; char* src; } u_30905;
        u_30905.src = _30904;
        _30905 = u_30905.dst;
        #line 64 "gpu_device_shm.impala"
        int _30907;
        _30907 = _30906 + gid_x_30771;
        #line 204 "gpu_device_shm.impala"
        int _30889;
        _30889 = v_anchor_30751 - _30888;
        #line 64 "gpu_device_shm.impala"
        double* _30908;
        _30908 = _30905 + _30907;
        #line 39 "gaussian.impala"
        if (_30867) goto l30868; else goto l30922;
    l30922: ;
        #line 49 "gaussian.impala"
        goto l30912;
    l30868: ;
        #line 39 "gaussian.impala"
        int _30869;
        _30869 = _30784 - v_anchor_30751;
        #line 39 "gaussian.impala"
        bool _30870;
        _30870 = gid_y_30780 < _30869;
        #line 39 "gaussian.impala"
        if (_30870) goto l30871; else goto l30911;
    l30911: ;
        #line 49 "gaussian.impala"
        goto l30912;
    l30912: ;
        #line 72 "gpu_device_shm.impala"
        int _30913;
        _30913 = gid_y_30780 + _30889;
        #line 72 "gpu_device_shm.impala"
        int _30914;
        _30914 = _30913 * shm_dimx_30762;
        #line 72 "gpu_device_shm.impala"
        int _30915;
        _30915 = _30914 + gid_x_30771;
        #line 72 "gpu_device_shm.impala"
        int _30916;
        _30916 = _30915 + _30894;
        #line 72 "gpu_device_shm.impala"
        double* _30917;
        _30917 = reserve_shared_30743 + _30916;
        #line 72 "gpu_device_shm.impala"
        double _30918;
        _30918 = *_30917;
        #line 72 "gpu_device_shm.impala"
        double _30920;
        _30920 = _30918;
        #line 64 "gpu_device_shm.impala"
        *_30908 = _30920;
        return ;
    l30871: ;
        #line 77 "gpu_device_shm.impala"
        struct_Buffer_6341 _30880;
        _30880 = _25871_30720.e0;
        #line 41 "gaussian.impala"
        int _30910;
        _30910 = 0 - v_anchor_30751;
        #line 41 "gaussian.impala"
        int _30876;
        _30876 = 1 + v_anchor_30751;
        #line 77 "gpu_device_shm.impala"
        char* _30881;
        _30881 = _30880.e1;
        #line 77 "gpu_device_shm.impala"
        double* _30882;
        union { double* dst; char* src; } u_30882;
        u_30882.src = _30881;
        _30882 = u_30882.dst;
        #line 27 "gpu_device_shm.impala"
        p_30873 = _30910;
        psum_30875 = 0.000000e+00;
        goto l30872;
    l30872: ;
        _30873 = p_30873;
        sum_30875 = psum_30875;
        #line 27 "gpu_device_shm.impala"
        bool _30877;
        _30877 = _30873 < _30876;
        #line 27 "gpu_device_shm.impala"
        if (_30877) goto l30878; else goto l30903;
    l30903: ;
        #line 64 "gpu_device_shm.impala"
        *_30908 = sum_30875;
        return ;
    l30878: ;
        #line 31 "gpu_device_shm.impala"
        int _30879;
        _30879 = 1 + _30873;
        #line 43 "gaussian.impala"
        int _30887;
        _30887 = gid_y_30780 + _30873;
        #line 72 "gpu_device_shm.impala"
        int _30890;
        _30890 = _30887 + _30889;
        #line 43 "gaussian.impala"
        int _30883;
        _30883 = _30873 + v_anchor_30751;
        #line 72 "gpu_device_shm.impala"
        int _30891;
        _30891 = _30890 * shm_dimx_30762;
        #line 76 "gpu_device_shm.impala"
        double* i_30884;
        i_30884 = _30882 + _30883;
        #line 72 "gpu_device_shm.impala"
        int _30892;
        _30892 = _30891 + gid_x_30771;
        #line 77 "gpu_device_shm.impala"
        double _30885;
        _30885 = *i_30884;
        #line 72 "gpu_device_shm.impala"
        int _30895;
        _30895 = _30892 + _30894;
        #line 77 "gpu_device_shm.impala"
        double _30899;
        _30899 = _30885;
        #line 72 "gpu_device_shm.impala"
        double* _30896;
        _30896 = reserve_shared_30743 + _30895;
        #line 72 "gpu_device_shm.impala"
        double _30897;
        _30897 = *_30896;
        #line 72 "gpu_device_shm.impala"
        double _30900;
        _30900 = _30897;
        #line 43 "gaussian.impala"
        double _30901;
        _30901 = _30899 * _30900;
        #line 43 "gaussian.impala"
        double _30902;
        _30902 = sum_30875 + _30901;
        #line 27 "gpu_device_shm.impala"
        p_30873 = _30879;
        psum_30875 = _30902;
        goto l30872;
    l30813: ;
        #line 221 "gpu_device_shm.impala"
        int img_index_y_30830;
        img_index_y_30830 = _30781 + _30810;
        #line 227 "gpu_device_shm.impala"
        int _30838;
        _30838 = img_index_y_30830 * _30776;
        #line 214 "gpu_device_shm.impala"
        int shm_index_y_30822;
        shm_index_y_30822 = tidy_30740 + _30810;
        #line 224 "gpu_device_shm.impala"
        bool _30833;
        _30833 = img_index_y_30830 < _30784;
        #line 224 "gpu_device_shm.impala"
        bool _30831;
        _30831 = 0 <= img_index_y_30830;
        #line 217 "gpu_device_shm.impala"
        bool _30823;
        _30823 = shm_index_y_30822 < shm_dimy_30753;
        #line 226 "gpu_device_shm.impala"
        int _30843;
        _30843 = shm_index_y_30822 * shm_dimx_30762;
        #line 38 "gpu_device_shm.impala"
        p_30815 = 0;
        goto l30814;
    l30814: ;
        _30815 = p_30815;
        #line 38 "gpu_device_shm.impala"
        bool _30817;
        _30817 = _30815 < shm_dimx_30762;
        #line 38 "gpu_device_shm.impala"
        if (_30817) goto l30818; else goto l30856;
    l30856: ;
        #line 42 "gpu_device_shm.impala"
        int _30857;
        _30857 = _30810 + bdimy_30728;
        #line 38 "gpu_device_shm.impala"
        p_30810 = _30857;
        goto l30809;
    l30818: ;
        #line 212 "gpu_device_shm.impala"
        int shm_index_x_30819;
        shm_index_x_30819 = tidx_30737 + _30815;
        #line 217 "gpu_device_shm.impala"
        bool _30820;
        _30820 = shm_index_x_30819 < shm_dimx_30762;
        #line 217 "gpu_device_shm.impala"
        if (_30820) goto l30821; else goto l30855;
    l30855: ;
        #line 229 "gpu_device_shm.impala"
        goto l30854;
    l30821: ;
        #line 217 "gpu_device_shm.impala"
        if (_30823) goto l30824; else goto l30853;
    l30853: ;
        #line 229 "gpu_device_shm.impala"
        goto l30854;
    l30854: ;
        #line 40 "gpu_device_shm.impala"
        goto l30835;
    l30824: ;
        #line 219 "gpu_device_shm.impala"
        int img_index_x_30825;
        img_index_x_30825 = _30772 + _30815;
        #line 224 "gpu_device_shm.impala"
        bool _30826;
        _30826 = 0 <= img_index_x_30825;
        #line 224 "gpu_device_shm.impala"
        if (_30826) goto l30827; else goto l30852;
    l30852: ;
        #line 228 "gpu_device_shm.impala"
        goto l30849;
    l30827: ;
        #line 224 "gpu_device_shm.impala"
        bool _30828;
        _30828 = img_index_x_30825 < _30776;
        #line 224 "gpu_device_shm.impala"
        if (_30828) goto l30829; else goto l30851;
    l30851: ;
        #line 228 "gpu_device_shm.impala"
        goto l30849;
    l30829: ;
        #line 224 "gpu_device_shm.impala"
        if (_30831) goto l30832; else goto l30850;
    l30850: ;
        #line 228 "gpu_device_shm.impala"
        goto l30849;
    l30832: ;
        #line 224 "gpu_device_shm.impala"
        if (_30833) goto l30834; else goto l30848;
    l30848: ;
        #line 228 "gpu_device_shm.impala"
        goto l30849;
    l30849: ;
        #line 40 "gpu_device_shm.impala"
        goto l30835;
    l30834: ;
        #line 227 "gpu_device_shm.impala"
        int _30839;
        _30839 = _30838 + img_index_x_30825;
        #line 226 "gpu_device_shm.impala"
        int _30844;
        _30844 = _30843 + shm_index_x_30819;
        #line 226 "gpu_device_shm.impala"
        double* _30845;
        _30845 = reserve_shared_30743 + _30844;
        #line 227 "gpu_device_shm.impala"
        double* _30840;
        _30840 = _25870_30719 + _30839;
        #line 227 "gpu_device_shm.impala"
        double _30841;
        _30841 = *_30840;
        #line 227 "gpu_device_shm.impala"
        double _30846;
        _30846 = _30841;
        #line 226 "gpu_device_shm.impala"
        *_30845 = _30846;
        #line 40 "gpu_device_shm.impala"
        goto l30835;
    l30835: ;
        #line 42 "gpu_device_shm.impala"
        int _30837;
        _30837 = _30815 + bdimx_30725;
        #line 38 "gpu_device_shm.impala"
        p_30815 = _30837;
        goto l30814;
    l30764: ;
        #line 212 "gpu_device_shm.impala"
        int shm_index_x_30765;
        shm_index_x_30765 = tidx_30737 + _30757;
        #line 217 "gpu_device_shm.impala"
        bool _30766;
        _30766 = shm_index_x_30765 < shm_dimx_30762;
        #line 217 "gpu_device_shm.impala"
        if (_30766) goto l30767; else goto l30807;
    l30807: ;
        #line 229 "gpu_device_shm.impala"
        goto l30806;
    l30767: ;
        #line 217 "gpu_device_shm.impala"
        if (_30768) goto l30769; else goto l30805;
    l30805: ;
        #line 229 "gpu_device_shm.impala"
        goto l30806;
    l30806: ;
        #line 40 "gpu_device_shm.impala"
        goto l30787;
    l30769: ;
        #line 219 "gpu_device_shm.impala"
        int img_index_x_30773;
        img_index_x_30773 = _30772 + _30757;
        #line 224 "gpu_device_shm.impala"
        bool _30774;
        _30774 = 0 <= img_index_x_30773;
        #line 224 "gpu_device_shm.impala"
        if (_30774) goto l30775; else goto l30804;
    l30804: ;
        #line 228 "gpu_device_shm.impala"
        goto l30801;
    l30775: ;
        #line 224 "gpu_device_shm.impala"
        bool _30777;
        _30777 = img_index_x_30773 < _30776;
        #line 224 "gpu_device_shm.impala"
        if (_30777) goto l30778; else goto l30803;
    l30803: ;
        #line 228 "gpu_device_shm.impala"
        goto l30801;
    l30778: ;
        #line 224 "gpu_device_shm.impala"
        if (_30782) goto l30783; else goto l30802;
    l30802: ;
        #line 228 "gpu_device_shm.impala"
        goto l30801;
    l30783: ;
        #line 224 "gpu_device_shm.impala"
        if (_30785) goto l30786; else goto l30800;
    l30800: ;
        #line 228 "gpu_device_shm.impala"
        goto l30801;
    l30801: ;
        #line 40 "gpu_device_shm.impala"
        goto l30787;
    l30786: ;
        #line 226 "gpu_device_shm.impala"
        int _30796;
        _30796 = _30795 + shm_index_x_30765;
        #line 227 "gpu_device_shm.impala"
        int _30791;
        _30791 = _30790 + img_index_x_30773;
        #line 227 "gpu_device_shm.impala"
        double* _30792;
        _30792 = _25870_30719 + _30791;
        #line 226 "gpu_device_shm.impala"
        double* _30797;
        _30797 = reserve_shared_30743 + _30796;
        #line 227 "gpu_device_shm.impala"
        double _30793;
        _30793 = *_30792;
        #line 227 "gpu_device_shm.impala"
        double _30798;
        _30798 = _30793;
        #line 226 "gpu_device_shm.impala"
        *_30797 = _30798;
        #line 40 "gpu_device_shm.impala"
        goto l30787;
    l30787: ;
        #line 42 "gpu_device_shm.impala"
        int _30789;
        _30789 = _30757 + bdimx_30725;
        #line 38 "gpu_device_shm.impala"
        p_30757 = _30789;
        goto l30756;
}

}