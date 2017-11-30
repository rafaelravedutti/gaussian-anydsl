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
__global__ void lambda_9740(float*, float*);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_9740(float* _9743_10463, float* _9744_10464) {
    int  threadIdx_x_10470;
    int pthreadIdx_x_10470;
    int  blockDim_x_10476;
    int pblockDim_x_10476;
    int  blockIdx_x_10482;
    int pblockIdx_x_10482;
    int  threadIdx_y_10488;
    int pthreadIdx_y_10488;
    int  blockDim_y_10494;
    int pblockDim_y_10494;
    int  blockIdx_y_10500;
    int pblockIdx_y_10500;
    threadIdx_x_10470 = threadIdx_x();
    pthreadIdx_x_10470 = threadIdx_x_10470;
    l10468: ;
        threadIdx_x_10470 = pthreadIdx_x_10470;
        blockDim_x_10476 = blockDim_x();
        pblockDim_x_10476 = blockDim_x_10476;
    l10474: ;
        blockDim_x_10476 = pblockDim_x_10476;
        blockIdx_x_10482 = blockIdx_x();
        pblockIdx_x_10482 = blockIdx_x_10482;
    l10480: ;
        blockIdx_x_10482 = pblockIdx_x_10482;
        threadIdx_y_10488 = threadIdx_y();
        pthreadIdx_y_10488 = threadIdx_y_10488;
    l10486: ;
        threadIdx_y_10488 = pthreadIdx_y_10488;
        blockDim_y_10494 = blockDim_y();
        pblockDim_y_10494 = blockDim_y_10494;
    l10492: ;
        blockDim_y_10494 = pblockDim_y_10494;
        blockIdx_y_10500 = blockIdx_y();
        pblockIdx_y_10500 = blockIdx_y_10500;
    l10498: ;
        blockIdx_y_10500 = pblockIdx_y_10500;
        int _10502;
        _10502 = blockDim_y_10494 * blockIdx_y_10500;
        int _10505;
        _10505 = blockDim_x_10476 * blockIdx_x_10482;
        int _10503;
        _10503 = threadIdx_y_10488 + _10502;
        int _10506;
        _10506 = threadIdx_x_10470 + _10505;
        int _10504;
        _10504 = 2048 * _10503;
        int idx_10507;
        idx_10507 = _10504 + _10506;
        float* i_10512;
        i_10512 = _9744_10464 + idx_10507;
        float* i_10508;
        i_10508 = _9743_10463 + idx_10507;
        float _10509;
        _10509 = *i_10508;
        float _10514;
        _10514 = _10509;
        *i_10512 = _10514;
        return ;
}

}