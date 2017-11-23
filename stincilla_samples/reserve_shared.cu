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
__global__ void lambda_11973(float*, float*);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_11973(float* _11976_13141, float* _11977_13142) {
    float*  shared_13150;
    float* pshared_13150;
    int  threadIdx_x_13156;
    int pthreadIdx_x_13156;
    int  blockDim_x_13162;
    int pblockDim_x_13162;
    int  blockIdx_x_13168;
    int pblockIdx_x_13168;
    int  threadIdx_y_13174;
    int pthreadIdx_y_13174;
    int  blockDim_y_13180;
    int pblockDim_y_13180;
    int  blockIdx_y_13186;
    int pblockIdx_y_13186;
    int  _13200;
    int p_13200;
    int  threadIdx_x_13207;
    int pthreadIdx_x_13207;
    int  blockDim_x_13210;
    int pblockDim_x_13210;
    int  blockIdx_x_13213;
    int pblockIdx_x_13213;
    int  threadIdx_y_13216;
    int pthreadIdx_y_13216;
    int  blockDim_y_13219;
    int pblockDim_y_13219;
    int  blockIdx_y_13222;
    int pblockIdx_y_13222;
    int  _13225;
    int p_13225;
    __shared__ float reserver_shared_13150[128];
    pshared_13150 = reserver_shared_13150;
    l13148: ;
        shared_13150 = pshared_13150;
        threadIdx_x_13156 = threadIdx_x();
        pthreadIdx_x_13156 = threadIdx_x_13156;
    l13154: ;
        threadIdx_x_13156 = pthreadIdx_x_13156;
        blockDim_x_13162 = blockDim_x();
        pblockDim_x_13162 = blockDim_x_13162;
    l13160: ;
        blockDim_x_13162 = pblockDim_x_13162;
        blockIdx_x_13168 = blockIdx_x();
        pblockIdx_x_13168 = blockIdx_x_13168;
    l13166: ;
        blockIdx_x_13168 = pblockIdx_x_13168;
        threadIdx_y_13174 = threadIdx_y();
        pthreadIdx_y_13174 = threadIdx_y_13174;
    l13172: ;
        threadIdx_y_13174 = pthreadIdx_y_13174;
        blockDim_y_13180 = blockDim_y();
        pblockDim_y_13180 = blockDim_y_13180;
    l13178: ;
        blockDim_y_13180 = pblockDim_y_13180;
        blockIdx_y_13186 = blockIdx_y();
        pblockIdx_y_13186 = blockIdx_y_13186;
    l13184: ;
        blockIdx_y_13186 = pblockIdx_y_13186;
        int _13188;
        _13188 = blockDim_y_13180 * blockIdx_y_13186;
        int _13191;
        _13191 = blockDim_x_13162 * blockIdx_x_13168;
        int _13189;
        _13189 = threadIdx_y_13174 + _13188;
        int _13192;
        _13192 = threadIdx_x_13156 + _13191;
        int _13190;
        _13190 = 2048 * _13189;
        int _13193;
        _13193 = _13190 + _13192;
        float* _13194;
        _13194 = _11976_13141 + _13193;
        float _13195;
        _13195 = *_13194;
        _13200 = threadIdx_x();
        p_13200 = _13200;
    l13198: ;
        _13200 = p_13200;
        float* _13201;
        _13201 = shared_13150 + _13200;
        float _13203;
        _13203 = _13195;
        *_13201 = _13203;
        threadIdx_x_13207 = threadIdx_x();
        pthreadIdx_x_13207 = threadIdx_x_13207;
    l13205: ;
        threadIdx_x_13207 = pthreadIdx_x_13207;
        blockDim_x_13210 = blockDim_x();
        pblockDim_x_13210 = blockDim_x_13210;
    l13208: ;
        blockDim_x_13210 = pblockDim_x_13210;
        blockIdx_x_13213 = blockIdx_x();
        pblockIdx_x_13213 = blockIdx_x_13213;
    l13211: ;
        blockIdx_x_13213 = pblockIdx_x_13213;
        threadIdx_y_13216 = threadIdx_y();
        pthreadIdx_y_13216 = threadIdx_y_13216;
    l13214: ;
        threadIdx_y_13216 = pthreadIdx_y_13216;
        blockDim_y_13219 = blockDim_y();
        pblockDim_y_13219 = blockDim_y_13219;
    l13217: ;
        blockDim_y_13219 = pblockDim_y_13219;
        blockIdx_y_13222 = blockIdx_y();
        pblockIdx_y_13222 = blockIdx_y_13222;
    l13220: ;
        blockIdx_y_13222 = pblockIdx_y_13222;
        _13225 = threadIdx_x();
        p_13225 = _13225;
    l13223: ;
        _13225 = p_13225;
        int _13229;
        _13229 = blockDim_y_13219 * blockIdx_y_13222;
        float* _13226;
        _13226 = shared_13150 + _13225;
        int _13230;
        _13230 = threadIdx_y_13216 + _13229;
        int _13232;
        _13232 = blockDim_x_13210 * blockIdx_x_13213;
        float _13227;
        _13227 = *_13226;
        int _13231;
        _13231 = 2048 * _13230;
        int _13233;
        _13233 = threadIdx_x_13207 + _13232;
        float _13236;
        _13236 = _13227;
        int _13234;
        _13234 = _13231 + _13233;
        float* _13235;
        _13235 = _11977_13142 + _13234;
        *_13235 = _13236;
        return ;
}

}