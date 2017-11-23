extern "C" {
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
__global__ void lambda_14349(float*, float*);
__global__ void lambda_14462(float*, float*);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_14349(float* _14352_15506, float* _14353_15507) {
    int  threadIdx_x_15513;
    int pthreadIdx_x_15513;
    int  blockDim_x_15519;
    int pblockDim_x_15519;
    int  blockIdx_x_15525;
    int pblockIdx_x_15525;
    int  threadIdx_y_15531;
    int pthreadIdx_y_15531;
    int  blockDim_y_15537;
    int pblockDim_y_15537;
    int  blockIdx_y_15543;
    int pblockIdx_y_15543;
    threadIdx_x_15513 = threadIdx_x();
    pthreadIdx_x_15513 = threadIdx_x_15513;
    l15511: ;
        threadIdx_x_15513 = pthreadIdx_x_15513;
        blockDim_x_15519 = blockDim_x();
        pblockDim_x_15519 = blockDim_x_15519;
    l15517: ;
        blockDim_x_15519 = pblockDim_x_15519;
        blockIdx_x_15525 = blockIdx_x();
        pblockIdx_x_15525 = blockIdx_x_15525;
    l15523: ;
        blockIdx_x_15525 = pblockIdx_x_15525;
        threadIdx_y_15531 = threadIdx_y();
        pthreadIdx_y_15531 = threadIdx_y_15531;
    l15529: ;
        threadIdx_y_15531 = pthreadIdx_y_15531;
        blockDim_y_15537 = blockDim_y();
        pblockDim_y_15537 = blockDim_y_15537;
    l15535: ;
        blockDim_y_15537 = pblockDim_y_15537;
        blockIdx_y_15543 = blockIdx_y();
        pblockIdx_y_15543 = blockIdx_y_15543;
    l15541: ;
        blockIdx_y_15543 = pblockIdx_y_15543;
        int _15548;
        _15548 = blockDim_x_15519 * blockIdx_x_15525;
        int _15545;
        _15545 = blockDim_y_15537 * blockIdx_y_15543;
        int _15549;
        _15549 = threadIdx_x_15513 + _15548;
        int _15546;
        _15546 = threadIdx_y_15531 + _15545;
        int _15547;
        _15547 = 4096 * _15546;
        int _15550;
        _15550 = _15547 + _15549;
        float* _15555;
        _15555 = _14352_15506 + _15550;
        float* _15551;
        _15551 = _14353_15507 + _15550;
        float _15552;
        _15552 = *_15551;
        float _15557;
        _15557 = _15552;
        *_15555 = _15557;
        return ;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_14462(float* _14465_15562, float* _14466_15563) {
    int  threadIdx_x_15566;
    int pthreadIdx_x_15566;
    int  blockDim_x_15569;
    int pblockDim_x_15569;
    int  blockIdx_x_15572;
    int pblockIdx_x_15572;
    int  threadIdx_y_15575;
    int pthreadIdx_y_15575;
    int  blockDim_y_15578;
    int pblockDim_y_15578;
    int  blockIdx_y_15581;
    int pblockIdx_y_15581;
    threadIdx_x_15566 = threadIdx_x();
    pthreadIdx_x_15566 = threadIdx_x_15566;
    l15564: ;
        threadIdx_x_15566 = pthreadIdx_x_15566;
        blockDim_x_15569 = blockDim_x();
        pblockDim_x_15569 = blockDim_x_15569;
    l15567: ;
        blockDim_x_15569 = pblockDim_x_15569;
        blockIdx_x_15572 = blockIdx_x();
        pblockIdx_x_15572 = blockIdx_x_15572;
    l15570: ;
        blockIdx_x_15572 = pblockIdx_x_15572;
        threadIdx_y_15575 = threadIdx_y();
        pthreadIdx_y_15575 = threadIdx_y_15575;
    l15573: ;
        threadIdx_y_15575 = pthreadIdx_y_15575;
        blockDim_y_15578 = blockDim_y();
        pblockDim_y_15578 = blockDim_y_15578;
    l15576: ;
        blockDim_y_15578 = pblockDim_y_15578;
        blockIdx_y_15581 = blockIdx_y();
        pblockIdx_y_15581 = blockIdx_y_15581;
    l15579: ;
        blockIdx_y_15581 = pblockIdx_y_15581;
        int _15585;
        _15585 = blockDim_x_15569 * blockIdx_x_15572;
        int _15586;
        _15586 = threadIdx_x_15566 + _15585;
        int _15582;
        _15582 = blockDim_y_15578 * blockIdx_y_15581;
        int _15583;
        _15583 = threadIdx_y_15575 + _15582;
        int _15584;
        _15584 = 4096 * _15583;
        int _15587;
        _15587 = _15584 + _15586;
        float* _15591;
        _15591 = _14466_15563 + _15587;
        float* _15588;
        _15588 = _14465_15562 + _15587;
        float _15589;
        _15589 = *_15588;
        float _15592;
        _15592 = _15589;
        *_15591 = _15592;
        return ;
}

}