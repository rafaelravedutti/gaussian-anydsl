extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5474;
typedef struct {
    struct_Buffer_5474 e0;
    struct_Buffer_5474 e1;
    int e2;
    int e3;
} struct_image_5473;
typedef struct {
    struct_Buffer_5474 e0;
    int e1;
} struct_filter_5477;

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
__global__ void lambda_20598(struct_image_5473, struct_filter_5477, struct_Buffer_5474);
__global__ void lambda_20730(struct_image_5473, struct_Buffer_5474, struct_filter_5477, struct_Buffer_5474, double*);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_20598(struct_image_5473 _20601_22937, struct_filter_5477 _20602_22938, struct_Buffer_5474 _20603_22939) {
    int  _22945;
    int p_22945;
    int  _22951;
    int p_22951;
    int  _22957;
    int p_22957;
    int  _22963;
    int p_22963;
    int  _22969;
    int p_22969;
    int  _22975;
    int p_22975;
    int  _22998;
    int p_22998;
    double  sum_23000;
    double psum_23000;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _22945 = blockIdx_x();
    p_22945 = _22945;
    l22943: ;
        _22945 = p_22945;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22951 = blockDim_x();
        p_22951 = _22951;
    l22949: ;
        _22951 = p_22951;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22957 = threadIdx_x();
        p_22957 = _22957;
    l22955: ;
        _22957 = p_22957;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22963 = blockIdx_y();
        p_22963 = _22963;
    l22961: ;
        _22963 = p_22963;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22969 = blockDim_y();
        p_22969 = _22969;
    l22967: ;
        _22969 = p_22969;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _22975 = threadIdx_y();
        p_22975 = _22975;
    l22973: ;
        _22975 = p_22975;
        #line 11 "main.impala"
        int _22979;
        _22979 = _20601_22937.e2;
        #line 119 "gpu_device.impala"
        int _22976;
        _22976 = _22945 * _22951;
        #line 119 "gpu_device.impala"
        int gid_x_22977;
        gid_x_22977 = _22976 + _22957;
        #line 124 "gpu_device.impala"
        bool _22980;
        _22980 = gid_x_22977 < _22979;
        #line 124 "gpu_device.impala"
        if (_22980) goto l22981; else goto l23046;
    l23046: ;
        #line 127 "gpu_device.impala"
        goto l23045;
    l22981: ;
        #line 121 "gpu_device.impala"
        int _22982;
        _22982 = _22963 * _22969;
        #line 11 "main.impala"
        int _22985;
        _22985 = _20601_22937.e3;
        #line 121 "gpu_device.impala"
        int gid_y_22983;
        gid_y_22983 = _22982 + _22975;
        #line 124 "gpu_device.impala"
        bool _22986;
        _22986 = gid_y_22983 < _22985;
        #line 124 "gpu_device.impala"
        if (_22986) goto l22987; else goto l23044;
    l23044: ;
        #line 127 "gpu_device.impala"
        goto l23045;
    l23045: ;
        return ;
    l22987: ;
        #line 25 "gaussian.impala"
        int _23017;
        _23017 = gid_y_22983 * _22979;
        #line 49 "gpu_device.impala"
        struct_Buffer_5474 _23014;
        _23014 = _20601_22937.e1;
        #line 34 "gpu_device.impala"
        char* _23028;
        _23028 = _20603_22939.e1;
        #line 4 "gaussian.impala"
        int _22989;
        _22989 = _20602_22938.e1;
        #line 25 "gaussian.impala"
        int _23030;
        _23030 = _23017 + gid_x_22977;
        #line 49 "gpu_device.impala"
        char* _23015;
        _23015 = _23014.e1;
        #line 34 "gpu_device.impala"
        double* _23029;
        union { double* dst; char* src; } u_23029;
        u_23029.src = _23028;
        _23029 = u_23029.dst;
        #line 4 "gaussian.impala"
        int h_anchor_22991;
        h_anchor_22991 = _22989 / 2;
        #line 33 "gpu_device.impala"
        double* index_23031;
        index_23031 = _23029 + _23030;
        #line 49 "gpu_device.impala"
        double* _23016;
        union { double* dst; char* src; } u_23016;
        u_23016.src = _23015;
        _23016 = u_23016.dst;
        #line 17 "gaussian.impala"
        bool _22992;
        _22992 = h_anchor_22991 <= gid_x_22977;
        #line 17 "gaussian.impala"
        if (_22992) goto l22993; else goto l23043;
    l23043: ;
        #line 27 "gaussian.impala"
        goto l23037;
    l22993: ;
        #line 17 "gaussian.impala"
        int _22994;
        _22994 = _22979 - h_anchor_22991;
        #line 17 "gaussian.impala"
        bool _22995;
        _22995 = gid_x_22977 < _22994;
        #line 17 "gaussian.impala"
        if (_22995) goto l22996; else goto l23036;
    l23036: ;
        #line 27 "gaussian.impala"
        goto l23037;
    l23037: ;
        #line 49 "gpu_device.impala"
        double* _23038;
        _23038 = _23016 + _23030;
        #line 49 "gpu_device.impala"
        double _23039;
        _23039 = *_23038;
        #line 49 "gpu_device.impala"
        double _23041;
        _23041 = _23039;
        #line 34 "gpu_device.impala"
        *index_23031 = _23041;
        return ;
    l22996: ;
        #line 19 "gaussian.impala"
        int _23002;
        _23002 = 1 + h_anchor_22991;
        #line 54 "gpu_device.impala"
        struct_Buffer_5474 _23007;
        _23007 = _20602_22938.e0;
        #line 19 "gaussian.impala"
        int _23034;
        _23034 = 0 - h_anchor_22991;
        #line 54 "gpu_device.impala"
        char* _23008;
        _23008 = _23007.e1;
        #line 54 "gpu_device.impala"
        double* _23009;
        union { double* dst; char* src; } u_23009;
        u_23009.src = _23008;
        _23009 = u_23009.dst;
        #line 18 "gpu_device.impala"
        p_22998 = _23034;
        psum_23000 = 0.000000e+00;
        goto l22997;
    l22997: ;
        _22998 = p_22998;
        sum_23000 = psum_23000;
        #line 18 "gpu_device.impala"
        bool _23003;
        _23003 = _22998 < _23002;
        #line 18 "gpu_device.impala"
        if (_23003) goto l23004; else goto l23027;
    l23027: ;
        #line 34 "gpu_device.impala"
        *index_23031 = sum_23000;
        return ;
    l23004: ;
        #line 21 "gaussian.impala"
        int _23010;
        _23010 = _22998 + h_anchor_22991;
        #line 22 "gpu_device.impala"
        int _23005;
        _23005 = 1 + _22998;
        #line 53 "gpu_device.impala"
        double* i_23011;
        i_23011 = _23009 + _23010;
        #line 21 "gaussian.impala"
        int _23018;
        _23018 = gid_x_22977 + _22998;
        #line 54 "gpu_device.impala"
        double _23012;
        _23012 = *i_23011;
        #line 49 "gpu_device.impala"
        int _23019;
        _23019 = _23017 + _23018;
        #line 54 "gpu_device.impala"
        double _23023;
        _23023 = _23012;
        #line 49 "gpu_device.impala"
        double* _23020;
        _23020 = _23016 + _23019;
        #line 49 "gpu_device.impala"
        double _23021;
        _23021 = *_23020;
        #line 49 "gpu_device.impala"
        double _23024;
        _23024 = _23021;
        #line 21 "gaussian.impala"
        double _23025;
        _23025 = _23023 * _23024;
        #line 21 "gaussian.impala"
        double _23026;
        _23026 = sum_23000 + _23025;
        #line 18 "gpu_device.impala"
        p_22998 = _23005;
        psum_23000 = _23026;
        goto l22997;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_20730(struct_image_5473 _20733_23050, struct_Buffer_5474 _20734_23051, struct_filter_5477 _20735_23052, struct_Buffer_5474 _20736_23053, double* _20737_23054) {
    int  _23057;
    int p_23057;
    int  _23060;
    int p_23060;
    int  _23063;
    int p_23063;
    int  _23066;
    int p_23066;
    int  _23069;
    int p_23069;
    int  _23072;
    int p_23072;
    int  _23091;
    int p_23091;
    double  sum_23093;
    double psum_23093;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _23057 = blockIdx_x();
    p_23057 = _23057;
    l23055: ;
        _23057 = p_23057;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23060 = blockDim_x();
        p_23060 = _23060;
    l23058: ;
        _23060 = p_23060;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23063 = threadIdx_x();
        p_23063 = _23063;
    l23061: ;
        _23063 = p_23063;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23066 = blockIdx_y();
        p_23066 = _23066;
    l23064: ;
        _23066 = p_23066;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23069 = blockDim_y();
        p_23069 = _23069;
    l23067: ;
        _23069 = p_23069;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _23072 = threadIdx_y();
        p_23072 = _23072;
    l23070: ;
        _23072 = p_23072;
        #line 119 "gpu_device.impala"
        int _23073;
        _23073 = _23057 * _23060;
        #line 119 "gpu_device.impala"
        int gid_x_23074;
        gid_x_23074 = _23073 + _23063;
        #line 11 "main.impala"
        int _23075;
        _23075 = _20733_23050.e2;
        #line 124 "gpu_device.impala"
        bool _23076;
        _23076 = gid_x_23074 < _23075;
        #line 124 "gpu_device.impala"
        if (_23076) goto l23077; else goto l23135;
    l23135: ;
        #line 127 "gpu_device.impala"
        goto l23134;
    l23077: ;
        #line 11 "main.impala"
        int _23080;
        _23080 = _20733_23050.e3;
        #line 121 "gpu_device.impala"
        int _23078;
        _23078 = _23066 * _23069;
        #line 121 "gpu_device.impala"
        int gid_y_23079;
        gid_y_23079 = _23078 + _23072;
        #line 124 "gpu_device.impala"
        bool _23081;
        _23081 = gid_y_23079 < _23080;
        #line 124 "gpu_device.impala"
        if (_23081) goto l23082; else goto l23133;
    l23133: ;
        #line 127 "gpu_device.impala"
        goto l23134;
    l23134: ;
        return ;
    l23082: ;
        #line 44 "gpu_device.impala"
        char* _23118;
        _23118 = _20736_23053.e1;
        #line 39 "gpu_device.impala"
        char* _23105;
        _23105 = _20734_23051.e1;
        #line 44 "gpu_device.impala"
        double* _23119;
        union { double* dst; char* src; } u_23119;
        u_23119.src = _23118;
        _23119 = u_23119.dst;
        #line 6 "gaussian.impala"
        int _23083;
        _23083 = _20735_23052.e1;
        #line 51 "gaussian.impala"
        int _23120;
        _23120 = gid_y_23079 * _23075;
        #line 39 "gpu_device.impala"
        double* _23106;
        union { double* dst; char* src; } u_23106;
        u_23106.src = _23105;
        _23106 = u_23106.dst;
        #line 6 "gaussian.impala"
        int v_anchor_23084;
        v_anchor_23084 = _23083 / 2;
        #line 51 "gaussian.impala"
        int _23121;
        _23121 = _23120 + gid_x_23074;
        #line 39 "gaussian.impala"
        bool _23085;
        _23085 = v_anchor_23084 <= gid_y_23079;
        #line 44 "gpu_device.impala"
        double* _23122;
        _23122 = _23119 + _23121;
        #line 39 "gaussian.impala"
        if (_23085) goto l23086; else goto l23132;
    l23132: ;
        #line 49 "gaussian.impala"
        goto l23126;
    l23086: ;
        #line 39 "gaussian.impala"
        int _23087;
        _23087 = _23080 - v_anchor_23084;
        #line 39 "gaussian.impala"
        bool _23088;
        _23088 = gid_y_23079 < _23087;
        #line 39 "gaussian.impala"
        if (_23088) goto l23089; else goto l23125;
    l23125: ;
        #line 49 "gaussian.impala"
        goto l23126;
    l23126: ;
        #line 38 "gpu_device.impala"
        double* index_23127;
        index_23127 = _23106 + _23121;
        #line 39 "gpu_device.impala"
        double _23128;
        _23128 = *index_23127;
        #line 39 "gpu_device.impala"
        double _23130;
        _23130 = _23128;
        #line 44 "gpu_device.impala"
        *_23122 = _23130;
        return ;
    l23089: ;
        #line 41 "gaussian.impala"
        int _23094;
        _23094 = 1 + v_anchor_23084;
        #line 41 "gaussian.impala"
        int _23124;
        _23124 = 0 - v_anchor_23084;
        #line 54 "gpu_device.impala"
        struct_Buffer_5474 _23098;
        _23098 = _20735_23052.e0;
        #line 54 "gpu_device.impala"
        char* _23099;
        _23099 = _23098.e1;
        #line 54 "gpu_device.impala"
        double* _23100;
        union { double* dst; char* src; } u_23100;
        u_23100.src = _23099;
        _23100 = u_23100.dst;
        #line 18 "gpu_device.impala"
        p_23091 = _23124;
        psum_23093 = 0.000000e+00;
        goto l23090;
    l23090: ;
        _23091 = p_23091;
        sum_23093 = psum_23093;
        #line 18 "gpu_device.impala"
        bool _23095;
        _23095 = _23091 < _23094;
        #line 18 "gpu_device.impala"
        if (_23095) goto l23096; else goto l23117;
    l23117: ;
        #line 44 "gpu_device.impala"
        *_23122 = sum_23093;
        return ;
    l23096: ;
        #line 22 "gpu_device.impala"
        int _23097;
        _23097 = 1 + _23091;
        #line 43 "gaussian.impala"
        int _23101;
        _23101 = _23091 + v_anchor_23084;
        #line 53 "gpu_device.impala"
        double* i_23102;
        i_23102 = _23100 + _23101;
        #line 43 "gaussian.impala"
        int _23107;
        _23107 = gid_y_23079 + _23091;
        #line 54 "gpu_device.impala"
        double _23103;
        _23103 = *i_23102;
        #line 43 "gaussian.impala"
        int _23108;
        _23108 = _23107 * _23075;
        #line 54 "gpu_device.impala"
        double _23113;
        _23113 = _23103;
        #line 43 "gaussian.impala"
        int _23109;
        _23109 = _23108 + gid_x_23074;
        #line 38 "gpu_device.impala"
        double* index_23110;
        index_23110 = _23106 + _23109;
        #line 39 "gpu_device.impala"
        double _23111;
        _23111 = *index_23110;
        #line 39 "gpu_device.impala"
        double _23114;
        _23114 = _23111;
        #line 43 "gaussian.impala"
        double _23115;
        _23115 = _23113 * _23114;
        #line 43 "gaussian.impala"
        double _23116;
        _23116 = sum_23093 + _23115;
        #line 18 "gpu_device.impala"
        p_23091 = _23097;
        psum_23093 = _23116;
        goto l23090;
}

}