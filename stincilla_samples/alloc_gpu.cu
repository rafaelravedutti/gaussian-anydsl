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
__global__ void lambda_10603(float*, float*);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_10603(float* _10606_11332, float* _10607_11333) {
    int  threadIdx_x_11339;
    int pthreadIdx_x_11339;
    int  blockDim_x_11345;
    int pblockDim_x_11345;
    int  blockIdx_x_11351;
    int pblockIdx_x_11351;
    int  threadIdx_y_11357;
    int pthreadIdx_y_11357;
    int  blockDim_y_11363;
    int pblockDim_y_11363;
    int  blockIdx_y_11369;
    int pblockIdx_y_11369;
    threadIdx_x_11339 = threadIdx_x();
    pthreadIdx_x_11339 = threadIdx_x_11339;
    l11337: ;
        threadIdx_x_11339 = pthreadIdx_x_11339;
        blockDim_x_11345 = blockDim_x();
        pblockDim_x_11345 = blockDim_x_11345;
    l11343: ;
        blockDim_x_11345 = pblockDim_x_11345;
        blockIdx_x_11351 = blockIdx_x();
        pblockIdx_x_11351 = blockIdx_x_11351;
    l11349: ;
        blockIdx_x_11351 = pblockIdx_x_11351;
        threadIdx_y_11357 = threadIdx_y();
        pthreadIdx_y_11357 = threadIdx_y_11357;
    l11355: ;
        threadIdx_y_11357 = pthreadIdx_y_11357;
        blockDim_y_11363 = blockDim_y();
        pblockDim_y_11363 = blockDim_y_11363;
    l11361: ;
        blockDim_y_11363 = pblockDim_y_11363;
        blockIdx_y_11369 = blockIdx_y();
        pblockIdx_y_11369 = blockIdx_y_11369;
    l11367: ;
        blockIdx_y_11369 = pblockIdx_y_11369;
        int _11371;
        _11371 = blockDim_y_11363 * blockIdx_y_11369;
        int _11374;
        _11374 = blockDim_x_11345 * blockIdx_x_11351;
        int _11372;
        _11372 = threadIdx_y_11357 + _11371;
        int _11375;
        _11375 = threadIdx_x_11339 + _11374;
        int _11373;
        _11373 = 2048 * _11372;
        int idx_11376;
        idx_11376 = _11373 + _11375;
        float* i_11381;
        i_11381 = _10607_11333 + idx_11376;
        float* i_11377;
        i_11377 = _10606_11332 + idx_11376;
        float _11378;
        _11378 = *i_11377;
        float _11383;
        _11383 = _11378;
        *i_11381 = _11383;
        return ;
}

}