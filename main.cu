extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5003;
typedef struct {
    struct_Buffer_5003 e0;
    struct_Buffer_5003 e1;
    int e2;
    int e3;
} struct_image_5002;
typedef struct {
    struct_Buffer_5003 e0;
    int e1;
} struct_filter_5006;

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
__global__ void lambda_17247(double*, struct_image_5002, struct_filter_5006);
__global__ void lambda_17383(double*, struct_filter_5006, struct_image_5002);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_17247(double* _17250_19529, struct_image_5002 _17251_19530, struct_filter_5006 _17252_19531) {
    int  _19537;
    int p_19537;
    int  _19543;
    int p_19543;
    int  _19549;
    int p_19549;
    int  _19555;
    int p_19555;
    int  _19561;
    int p_19561;
    int  _19567;
    int p_19567;
    int  _19590;
    int p_19590;
    double  sum_19592;
    double psum_19592;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _19537 = blockIdx_x();
    p_19537 = _19537;
    l19535: ;
        _19537 = p_19537;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19543 = blockDim_x();
        p_19543 = _19543;
    l19541: ;
        _19543 = p_19543;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19549 = threadIdx_x();
        p_19549 = _19549;
    l19547: ;
        _19549 = p_19549;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19555 = blockIdx_y();
        p_19555 = _19555;
    l19553: ;
        _19555 = p_19555;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19561 = blockDim_y();
        p_19561 = _19561;
    l19559: ;
        _19561 = p_19561;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19567 = threadIdx_y();
        p_19567 = _19567;
    l19565: ;
        _19567 = p_19567;
        #line 50 "gpu_device.impala"
        int _19568;
        _19568 = _19537 * _19543;
        #line 6 "main.impala"
        int _19571;
        _19571 = _17251_19530.e2;
        #line 50 "gpu_device.impala"
        int gid_x_19569;
        gid_x_19569 = _19568 + _19549;
        #line 53 "gpu_device.impala"
        bool _19572;
        _19572 = gid_x_19569 < _19571;
        #line 53 "gpu_device.impala"
        if (_19572) goto l19573; else goto l19638;
    l19638: ;
        #line 55 "gpu_device.impala"
        goto l19637;
    l19573: ;
        #line 51 "gpu_device.impala"
        int _19574;
        _19574 = _19555 * _19561;
        #line 51 "gpu_device.impala"
        int gid_y_19575;
        gid_y_19575 = _19574 + _19567;
        #line 6 "main.impala"
        int _19577;
        _19577 = _17251_19530.e3;
        #line 53 "gpu_device.impala"
        bool _19578;
        _19578 = gid_y_19575 < _19577;
        #line 53 "gpu_device.impala"
        if (_19578) goto l19579; else goto l19636;
    l19636: ;
        #line 55 "gpu_device.impala"
        goto l19637;
    l19637: ;
        return ;
    l19579: ;
        #line 3 "gaussian.impala"
        int _19581;
        _19581 = _17252_19531.e1;
        #line 31 "gpu_device.impala"
        struct_Buffer_5003 _19606;
        _19606 = _17251_19530.e1;
        #line 31 "gpu_device.impala"
        char* _19607;
        _19607 = _19606.e1;
        #line 31 "gpu_device.impala"
        int _19609;
        _19609 = gid_y_19575 * _19571;
        #line 3 "gaussian.impala"
        int anchor_19583;
        anchor_19583 = _19581 / 2;
        #line 31 "gpu_device.impala"
        double* _19608;
        union { double* dst; char* src; } u_19608;
        u_19608.src = _19607;
        _19608 = u_19608.dst;
        #line 31 "gpu_device.impala"
        int _19622;
        _19622 = _19609 + gid_x_19569;
        #line 10 "gaussian.impala"
        bool _19584;
        _19584 = anchor_19583 <= gid_x_19569;
        #line 26 "gpu_device.impala"
        double* _19623;
        _19623 = double* _19621_6;
        union { double* dst; char* src; } u_19621_6;
        u_19621_6.src = // bottom: char* _19620_7;;
        _19621_6 = u_19621_6.dst; + _19622;
        #line 10 "gaussian.impala"
        if (_19584) goto l19585; else goto l19635;
    l19635: ;
        #line 16 "gaussian.impala"
        goto l19629;
    l19585: ;
        #line 10 "gaussian.impala"
        int _19586;
        _19586 = _19571 - anchor_19583;
        #line 10 "gaussian.impala"
        bool _19587;
        _19587 = gid_x_19569 < _19586;
        #line 10 "gaussian.impala"
        if (_19587) goto l19588; else goto l19628;
    l19628: ;
        #line 16 "gaussian.impala"
        goto l19629;
    l19629: ;
        #line 31 "gpu_device.impala"
        double* _19630;
        _19630 = _19608 + _19622;
        #line 31 "gpu_device.impala"
        double _19631;
        _19631 = *_19630;
        #line 31 "gpu_device.impala"
        double _19633;
        _19633 = _19631;
        #line 26 "gpu_device.impala"
        *_19623 = _19633;
        return ;
    l19588: ;
        #line 11 "gaussian.impala"
        int _19626;
        _19626 = 0 - anchor_19583;
        #line 11 "gaussian.impala"
        int _19594;
        _19594 = 1 + anchor_19583;
        #line 36 "gpu_device.impala"
        struct_Buffer_5003 _19599;
        _19599 = _17252_19531.e0;
        #line 36 "gpu_device.impala"
        char* _19600;
        _19600 = _19599.e1;
        #line 36 "gpu_device.impala"
        double* _19601;
        union { double* dst; char* src; } u_19601;
        u_19601.src = _19600;
        _19601 = u_19601.dst;
        #line 14 "gpu_device.impala"
        p_19590 = _19626;
        psum_19592 = 0.000000e+00;
        goto l19589;
    l19589: ;
        _19590 = p_19590;
        sum_19592 = psum_19592;
        #line 14 "gpu_device.impala"
        bool _19595;
        _19595 = _19590 < _19594;
        #line 14 "gpu_device.impala"
        if (_19595) goto l19596; else goto l19619;
    l19619: ;
        #line 26 "gpu_device.impala"
        *_19623 = sum_19592;
        return ;
    l19596: ;
        #line 12 "gaussian.impala"
        int _19602;
        _19602 = _19590 + anchor_19583;
        #line 16 "gpu_device.impala"
        int _19597;
        _19597 = 1 + _19590;
        #line 12 "gaussian.impala"
        int _19610;
        _19610 = gid_x_19569 + _19590;
        #line 35 "gpu_device.impala"
        double* i_19603;
        i_19603 = _19601 + _19602;
        #line 31 "gpu_device.impala"
        int _19611;
        _19611 = _19609 + _19610;
        #line 36 "gpu_device.impala"
        double _19604;
        _19604 = *i_19603;
        #line 31 "gpu_device.impala"
        double* _19612;
        _19612 = _19608 + _19611;
        #line 36 "gpu_device.impala"
        double _19615;
        _19615 = _19604;
        #line 31 "gpu_device.impala"
        double _19613;
        _19613 = *_19612;
        #line 31 "gpu_device.impala"
        double _19616;
        _19616 = _19613;
        #line 12 "gaussian.impala"
        double _19617;
        _19617 = _19615 * _19616;
        #line 12 "gaussian.impala"
        double _19618;
        _19618 = sum_19592 + _19617;
        #line 14 "gpu_device.impala"
        p_19590 = _19597;
        psum_19592 = _19618;
        goto l19589;
}

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_17383(double* _17386_19642, struct_filter_5006 _17387_19643, struct_image_5002 _17388_19644) {
    int  _19647;
    int p_19647;
    int  _19650;
    int p_19650;
    int  _19653;
    int p_19653;
    int  _19656;
    int p_19656;
    int  _19659;
    int p_19659;
    int  _19662;
    int p_19662;
    int  _19681;
    int p_19681;
    double  sum_19683;
    double psum_19683;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _19647 = blockIdx_x();
    p_19647 = _19647;
    l19645: ;
        _19647 = p_19647;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19650 = blockDim_x();
        p_19650 = _19650;
    l19648: ;
        _19650 = p_19650;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19653 = threadIdx_x();
        p_19653 = _19653;
    l19651: ;
        _19653 = p_19653;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19656 = blockIdx_y();
        p_19656 = _19656;
    l19654: ;
        _19656 = p_19656;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19659 = blockDim_y();
        p_19659 = _19659;
    l19657: ;
        _19659 = p_19659;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _19662 = threadIdx_y();
        p_19662 = _19662;
    l19660: ;
        _19662 = p_19662;
        #line 6 "main.impala"
        int _19665;
        _19665 = _17388_19644.e2;
        #line 50 "gpu_device.impala"
        int _19663;
        _19663 = _19647 * _19650;
        #line 50 "gpu_device.impala"
        int gid_x_19664;
        gid_x_19664 = _19663 + _19653;
        #line 53 "gpu_device.impala"
        bool _19666;
        _19666 = gid_x_19664 < _19665;
        #line 53 "gpu_device.impala"
        if (_19666) goto l19667; else goto l19724;
    l19724: ;
        #line 55 "gpu_device.impala"
        goto l19723;
    l19667: ;
        #line 6 "main.impala"
        int _19670;
        _19670 = _17388_19644.e3;
        #line 51 "gpu_device.impala"
        int _19668;
        _19668 = _19656 * _19659;
        #line 51 "gpu_device.impala"
        int gid_y_19669;
        gid_y_19669 = _19668 + _19662;
        #line 53 "gpu_device.impala"
        bool _19671;
        _19671 = gid_y_19669 < _19670;
        #line 53 "gpu_device.impala"
        if (_19671) goto l19672; else goto l19722;
    l19722: ;
        #line 55 "gpu_device.impala"
        goto l19723;
    l19723: ;
        return ;
    l19672: ;
        #line 24 "gaussian.impala"
        int _19673;
        _19673 = _17387_19643.e1;
        #line 31 "gpu_device.impala"
        int _19709;
        _19709 = gid_y_19669 * _19665;
        #line 31 "gpu_device.impala"
        int _19710;
        _19710 = _19709 + gid_x_19664;
        #line 31 "gpu_device.impala"
        struct_Buffer_5003 _19695;
        _19695 = _17388_19644.e1;
        #line 24 "gaussian.impala"
        int anchor_19674;
        anchor_19674 = _19673 / 2;
        #line 26 "gpu_device.impala"
        double* _19711;
        _19711 = double* _19621_19;
        union { double* dst; char* src; } u_19621_19;
        u_19621_19.src = // bottom: char* _19620_20;;
        _19621_19 = u_19621_19.dst; + _19710;
        #line 31 "gpu_device.impala"
        char* _19696;
        _19696 = _19695.e1;
        #line 31 "gaussian.impala"
        bool _19675;
        _19675 = anchor_19674 <= gid_y_19669;
        #line 31 "gpu_device.impala"
        double* _19697;
        union { double* dst; char* src; } u_19697;
        u_19697.src = _19696;
        _19697 = u_19697.dst;
        #line 31 "gaussian.impala"
        if (_19675) goto l19676; else goto l19721;
    l19721: ;
        #line 37 "gaussian.impala"
        goto l19715;
    l19676: ;
        #line 31 "gaussian.impala"
        int _19677;
        _19677 = _19670 - anchor_19674;
        #line 31 "gaussian.impala"
        bool _19678;
        _19678 = gid_y_19669 < _19677;
        #line 31 "gaussian.impala"
        if (_19678) goto l19679; else goto l19714;
    l19714: ;
        #line 37 "gaussian.impala"
        goto l19715;
    l19715: ;
        #line 31 "gpu_device.impala"
        double* _19716;
        _19716 = _19697 + _19710;
        #line 31 "gpu_device.impala"
        double _19717;
        _19717 = *_19716;
        #line 31 "gpu_device.impala"
        double _19719;
        _19719 = _19717;
        #line 26 "gpu_device.impala"
        *_19711 = _19719;
        return ;
    l19679: ;
        #line 36 "gpu_device.impala"
        struct_Buffer_5003 _19688;
        _19688 = _17387_19643.e0;
        #line 32 "gaussian.impala"
        int _19713;
        _19713 = 0 - anchor_19674;
        #line 32 "gaussian.impala"
        int _19684;
        _19684 = 1 + anchor_19674;
        #line 36 "gpu_device.impala"
        char* _19689;
        _19689 = _19688.e1;
        #line 36 "gpu_device.impala"
        double* _19690;
        union { double* dst; char* src; } u_19690;
        u_19690.src = _19689;
        _19690 = u_19690.dst;
        #line 14 "gpu_device.impala"
        p_19681 = _19713;
        psum_19683 = 0.000000e+00;
        goto l19680;
    l19680: ;
        _19681 = p_19681;
        sum_19683 = psum_19683;
        #line 14 "gpu_device.impala"
        bool _19685;
        _19685 = _19681 < _19684;
        #line 14 "gpu_device.impala"
        if (_19685) goto l19686; else goto l19708;
    l19708: ;
        #line 26 "gpu_device.impala"
        *_19711 = sum_19683;
        return ;
    l19686: ;
        #line 33 "gaussian.impala"
        int _19691;
        _19691 = _19681 + anchor_19674;
        #line 16 "gpu_device.impala"
        int _19687;
        _19687 = 1 + _19681;
        #line 35 "gpu_device.impala"
        double* i_19692;
        i_19692 = _19690 + _19691;
        #line 33 "gaussian.impala"
        int _19698;
        _19698 = gid_y_19669 + _19681;
        #line 31 "gpu_device.impala"
        int _19699;
        _19699 = _19698 * _19665;
        #line 36 "gpu_device.impala"
        double _19693;
        _19693 = *i_19692;
        #line 31 "gpu_device.impala"
        int _19700;
        _19700 = _19699 + gid_x_19664;
        #line 36 "gpu_device.impala"
        double _19704;
        _19704 = _19693;
        #line 31 "gpu_device.impala"
        double* _19701;
        _19701 = _19697 + _19700;
        #line 31 "gpu_device.impala"
        double _19702;
        _19702 = *_19701;
        #line 31 "gpu_device.impala"
        double _19705;
        _19705 = _19702;
        #line 33 "gaussian.impala"
        double _19706;
        _19706 = _19704 * _19705;
        #line 33 "gaussian.impala"
        double _19707;
        _19707 = sum_19683 + _19706;
        #line 14 "gpu_device.impala"
        p_19681 = _19687;
        psum_19683 = _19707;
        goto l19680;
}

}