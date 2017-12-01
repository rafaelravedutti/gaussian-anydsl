extern "C" {
typedef struct {
    int e0;
    char* e1;
} struct_Buffer_5838;
typedef struct {
    struct_Buffer_5838 e0;
    struct_Buffer_5838 e1;
    int e2;
    int e3;
} struct_image_5837;
typedef struct {
    struct_Buffer_5838 e0;
    int e1;
    int e2;
} struct_filter_5841;

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
__global__ void lambda_21887();
__global__ void lambda_22080(struct_image_5837, struct_Buffer_5838, struct_filter_5841);
__global__ void lambda_22212(double*, struct_image_5837, struct_Buffer_5838, struct_Buffer_5838, struct_filter_5841);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_21887() {
    return ;
}

__global__ __launch_bounds__ (16 * 16 * 1) void lambda_22080(struct_image_5837 _22083_24475, struct_Buffer_5838 _22084_24476, struct_filter_5841 _22085_24477) {
    int  _24483;
    int p_24483;
    int  _24489;
    int p_24489;
    int  _24495;
    int p_24495;
    int  _24501;
    int p_24501;
    int  _24507;
    int p_24507;
    int  _24513;
    int p_24513;
    int  _24536;
    int p_24536;
    double  sum_24538;
    double psum_24538;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _24483 = blockIdx_x();
    p_24483 = _24483;
    l24481: ;
        _24483 = p_24483;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _24489 = blockDim_x();
        p_24489 = _24489;
    l24487: ;
        _24489 = p_24489;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _24495 = threadIdx_x();
        p_24495 = _24495;
    l24493: ;
        _24495 = p_24495;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _24501 = blockIdx_y();
        p_24501 = _24501;
    l24499: ;
        _24501 = p_24501;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _24507 = blockDim_y();
        p_24507 = _24507;
    l24505: ;
        _24507 = p_24507;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _24513 = threadIdx_y();
        p_24513 = _24513;
    l24511: ;
        _24513 = p_24513;
        #line 185 "impala/gpu_device.impala"
        int _24514;
        _24514 = _24483 * _24489;
        #line 11 "impala/main.impala"
        int _24517;
        _24517 = _22083_24475.e2;
        #line 185 "impala/gpu_device.impala"
        int gid_x_24515;
        gid_x_24515 = _24514 + _24495;
        #line 190 "impala/gpu_device.impala"
        bool _24518;
        _24518 = gid_x_24515 < _24517;
        #line 190 "impala/gpu_device.impala"
        if (_24518) goto l24519; else goto l24584;
    l24584: ;
        #line 193 "impala/gpu_device.impala"
        goto l24583;
    l24519: ;
        #line 187 "impala/gpu_device.impala"
        int _24520;
        _24520 = _24501 * _24507;
        #line 11 "impala/main.impala"
        int _24523;
        _24523 = _22083_24475.e3;
        #line 187 "impala/gpu_device.impala"
        int gid_y_24521;
        gid_y_24521 = _24520 + _24513;
        #line 190 "impala/gpu_device.impala"
        bool _24524;
        _24524 = gid_y_24521 < _24523;
        #line 190 "impala/gpu_device.impala"
        if (_24524) goto l24525; else goto l24582;
    l24582: ;
        #line 193 "impala/gpu_device.impala"
        goto l24583;
    l24583: ;
        return ;
    l24525: ;
        #line 65 "impala/gpu_device.impala"
        struct_Buffer_5838 _24552;
        _24552 = _22083_24475.e1;
        #line 65 "impala/gpu_device.impala"
        int _24555;
        _24555 = gid_y_24521 * _24517;
        #line 9 "impala/gaussian.impala"
        int _24527;
        _24527 = _22085_24477.e1;
        #line 9 "impala/gaussian.impala"
        int h_anchor_24529;
        h_anchor_24529 = _24527 / 2;
        #line 60 "impala/gpu_device.impala"
        char* _24566;
        _24566 = _22084_24476.e1;
        #line 65 "impala/gpu_device.impala"
        char* _24553;
        _24553 = _24552.e1;
        #line 65 "impala/gpu_device.impala"
        int _24568;
        _24568 = _24555 + gid_x_24515;
        #line 22 "impala/gaussian.impala"
        bool _24530;
        _24530 = h_anchor_24529 <= gid_x_24515;
        #line 60 "impala/gpu_device.impala"
        double* _24567;
        union { double* dst; char* src; } u_24567;
        u_24567.src = _24566;
        _24567 = u_24567.dst;
        #line 65 "impala/gpu_device.impala"
        double* _24554;
        union { double* dst; char* src; } u_24554;
        u_24554.src = _24553;
        _24554 = u_24554.dst;
        #line 60 "impala/gpu_device.impala"
        double* _24569;
        _24569 = _24567 + _24568;
        #line 22 "impala/gaussian.impala"
        if (_24530) goto l24531; else goto l24581;
    l24581: ;
        #line 32 "impala/gaussian.impala"
        goto l24575;
    l24531: ;
        #line 22 "impala/gaussian.impala"
        int _24532;
        _24532 = _24517 - h_anchor_24529;
        #line 22 "impala/gaussian.impala"
        bool _24533;
        _24533 = gid_x_24515 < _24532;
        #line 22 "impala/gaussian.impala"
        if (_24533) goto l24534; else goto l24574;
    l24574: ;
        #line 32 "impala/gaussian.impala"
        goto l24575;
    l24575: ;
        #line 65 "impala/gpu_device.impala"
        double* _24576;
        _24576 = _24554 + _24568;
        #line 65 "impala/gpu_device.impala"
        double _24577;
        _24577 = *_24576;
        #line 65 "impala/gpu_device.impala"
        double _24579;
        _24579 = _24577;
        #line 60 "impala/gpu_device.impala"
        *_24569 = _24579;
        return ;
    l24534: ;
        #line 24 "impala/gaussian.impala"
        int _24572;
        _24572 = 0 - h_anchor_24529;
        #line 70 "impala/gpu_device.impala"
        struct_Buffer_5838 _24545;
        _24545 = _22085_24477.e0;
        #line 24 "impala/gaussian.impala"
        int _24540;
        _24540 = 1 + h_anchor_24529;
        #line 70 "impala/gpu_device.impala"
        char* _24546;
        _24546 = _24545.e1;
        #line 70 "impala/gpu_device.impala"
        double* _24547;
        union { double* dst; char* src; } u_24547;
        u_24547.src = _24546;
        _24547 = u_24547.dst;
        #line 19 "impala/gpu_device.impala"
        p_24536 = _24572;
        psum_24538 = 0.000000e+00;
        goto l24535;
    l24535: ;
        _24536 = p_24536;
        sum_24538 = psum_24538;
        #line 19 "impala/gpu_device.impala"
        bool _24541;
        _24541 = _24536 < _24540;
        #line 19 "impala/gpu_device.impala"
        if (_24541) goto l24542; else goto l24565;
    l24565: ;
        #line 60 "impala/gpu_device.impala"
        *_24569 = sum_24538;
        return ;
    l24542: ;
        #line 26 "impala/gaussian.impala"
        int _24556;
        _24556 = gid_x_24515 + _24536;
        #line 23 "impala/gpu_device.impala"
        int _24543;
        _24543 = 1 + _24536;
        #line 65 "impala/gpu_device.impala"
        int _24557;
        _24557 = _24555 + _24556;
        #line 26 "impala/gaussian.impala"
        int _24548;
        _24548 = _24536 + h_anchor_24529;
        #line 69 "impala/gpu_device.impala"
        double* i_24549;
        i_24549 = _24547 + _24548;
        #line 65 "impala/gpu_device.impala"
        double* _24558;
        _24558 = _24554 + _24557;
        #line 70 "impala/gpu_device.impala"
        double _24550;
        _24550 = *i_24549;
        #line 70 "impala/gpu_device.impala"
        double _24561;
        _24561 = _24550;
        #line 65 "impala/gpu_device.impala"
        double _24559;
        _24559 = *_24558;
        #line 65 "impala/gpu_device.impala"
        double _24562;
        _24562 = _24559;
        #line 26 "impala/gaussian.impala"
        double _24563;
        _24563 = _24561 * _24562;
        #line 26 "impala/gaussian.impala"
        double _24564;
        _24564 = sum_24538 + _24563;
        #line 19 "impala/gpu_device.impala"
        p_24536 = _24543;
        psum_24538 = _24564;
        goto l24535;
}

__global__ __launch_bounds__ (16 * 16 * 1) void lambda_22212(double* _22215_24588, struct_image_5837 _22216_24589, struct_Buffer_5838 _22217_24590, struct_Buffer_5838 _22218_24591, struct_filter_5841 _22219_24592) {
    int  _24595;
    int p_24595;
    int  _24598;
    int p_24598;
    int  _24601;
    int p_24601;
    int  _24604;
    int p_24604;
    int  _24607;
    int p_24607;
    int  _24610;
    int p_24610;
    int  _24629;
    int p_24629;
    double  sum_24631;
    double psum_24631;
    #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
    _24595 = blockIdx_x();
    p_24595 = _24595;
    l24593: ;
        _24595 = p_24595;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _24598 = blockDim_x();
        p_24598 = _24598;
    l24596: ;
        _24598 = p_24598;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _24601 = threadIdx_x();
        p_24601 = _24601;
    l24599: ;
        _24601 = p_24601;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _24604 = blockIdx_y();
        p_24604 = _24604;
    l24602: ;
        _24604 = p_24604;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _24607 = blockDim_y();
        p_24607 = _24607;
    l24605: ;
        _24607 = p_24607;
        #line 1 "/home/rafael/repositories/anydsl/runtime/platforms/intrinsics_cuda.impala"
        _24610 = threadIdx_y();
        p_24610 = _24610;
    l24608: ;
        _24610 = p_24610;
        #line 11 "impala/main.impala"
        int _24613;
        _24613 = _22216_24589.e2;
        #line 185 "impala/gpu_device.impala"
        int _24611;
        _24611 = _24595 * _24598;
        #line 185 "impala/gpu_device.impala"
        int gid_x_24612;
        gid_x_24612 = _24611 + _24601;
        #line 190 "impala/gpu_device.impala"
        bool _24614;
        _24614 = gid_x_24612 < _24613;
        #line 190 "impala/gpu_device.impala"
        if (_24614) goto l24615; else goto l24673;
    l24673: ;
        #line 193 "impala/gpu_device.impala"
        goto l24672;
    l24615: ;
        #line 11 "impala/main.impala"
        int _24618;
        _24618 = _22216_24589.e3;
        #line 187 "impala/gpu_device.impala"
        int _24616;
        _24616 = _24604 * _24607;
        #line 187 "impala/gpu_device.impala"
        int gid_y_24617;
        gid_y_24617 = _24616 + _24610;
        #line 190 "impala/gpu_device.impala"
        bool _24619;
        _24619 = gid_y_24617 < _24618;
        #line 190 "impala/gpu_device.impala"
        if (_24619) goto l24620; else goto l24671;
    l24671: ;
        #line 193 "impala/gpu_device.impala"
        goto l24672;
    l24672: ;
        return ;
    l24620: ;
        #line 65 "impala/gpu_device.impala"
        int _24658;
        _24658 = gid_y_24617 * _24613;
        #line 11 "impala/gaussian.impala"
        int _24621;
        _24621 = _22219_24592.e2;
        #line 60 "impala/gpu_device.impala"
        char* _24656;
        _24656 = _22218_24591.e1;
        #line 60 "impala/gpu_device.impala"
        double* _24657;
        union { double* dst; char* src; } u_24657;
        u_24657.src = _24656;
        _24657 = u_24657.dst;
        #line 65 "impala/gpu_device.impala"
        char* _24643;
        _24643 = _22217_24590.e1;
        #line 65 "impala/gpu_device.impala"
        int _24659;
        _24659 = _24658 + gid_x_24612;
        #line 11 "impala/gaussian.impala"
        int v_anchor_24622;
        v_anchor_24622 = _24621 / 2;
        #line 60 "impala/gpu_device.impala"
        double* _24660;
        _24660 = _24657 + _24659;
        #line 65 "impala/gpu_device.impala"
        double* _24644;
        union { double* dst; char* src; } u_24644;
        u_24644.src = _24643;
        _24644 = u_24644.dst;
        #line 44 "impala/gaussian.impala"
        bool _24623;
        _24623 = v_anchor_24622 <= gid_y_24617;
        #line 44 "impala/gaussian.impala"
        if (_24623) goto l24624; else goto l24670;
    l24670: ;
        #line 54 "impala/gaussian.impala"
        goto l24664;
    l24624: ;
        #line 44 "impala/gaussian.impala"
        int _24625;
        _24625 = _24618 - v_anchor_24622;
        #line 44 "impala/gaussian.impala"
        bool _24626;
        _24626 = gid_y_24617 < _24625;
        #line 44 "impala/gaussian.impala"
        if (_24626) goto l24627; else goto l24663;
    l24663: ;
        #line 54 "impala/gaussian.impala"
        goto l24664;
    l24664: ;
        #line 65 "impala/gpu_device.impala"
        double* _24665;
        _24665 = _24644 + _24659;
        #line 65 "impala/gpu_device.impala"
        double _24666;
        _24666 = *_24665;
        #line 65 "impala/gpu_device.impala"
        double _24668;
        _24668 = _24666;
        #line 60 "impala/gpu_device.impala"
        *_24660 = _24668;
        return ;
    l24627: ;
        #line 46 "impala/gaussian.impala"
        int _24632;
        _24632 = 1 + v_anchor_24622;
        #line 46 "impala/gaussian.impala"
        int _24662;
        _24662 = 0 - v_anchor_24622;
        #line 70 "impala/gpu_device.impala"
        struct_Buffer_5838 _24636;
        _24636 = _22219_24592.e0;
        #line 70 "impala/gpu_device.impala"
        char* _24637;
        _24637 = _24636.e1;
        #line 70 "impala/gpu_device.impala"
        double* _24638;
        union { double* dst; char* src; } u_24638;
        u_24638.src = _24637;
        _24638 = u_24638.dst;
        #line 19 "impala/gpu_device.impala"
        p_24629 = _24662;
        psum_24631 = 0.000000e+00;
        goto l24628;
    l24628: ;
        _24629 = p_24629;
        sum_24631 = psum_24631;
        #line 19 "impala/gpu_device.impala"
        bool _24633;
        _24633 = _24629 < _24632;
        #line 19 "impala/gpu_device.impala"
        if (_24633) goto l24634; else goto l24655;
    l24655: ;
        #line 60 "impala/gpu_device.impala"
        *_24660 = sum_24631;
        return ;
    l24634: ;
        #line 48 "impala/gaussian.impala"
        int _24639;
        _24639 = _24629 + v_anchor_24622;
        #line 23 "impala/gpu_device.impala"
        int _24635;
        _24635 = 1 + _24629;
        #line 69 "impala/gpu_device.impala"
        double* i_24640;
        i_24640 = _24638 + _24639;
        #line 48 "impala/gaussian.impala"
        int _24645;
        _24645 = gid_y_24617 + _24629;
        #line 70 "impala/gpu_device.impala"
        double _24641;
        _24641 = *i_24640;
        #line 65 "impala/gpu_device.impala"
        int _24646;
        _24646 = _24645 * _24613;
        #line 70 "impala/gpu_device.impala"
        double _24651;
        _24651 = _24641;
        #line 65 "impala/gpu_device.impala"
        int _24647;
        _24647 = _24646 + gid_x_24612;
        #line 65 "impala/gpu_device.impala"
        double* _24648;
        _24648 = _24644 + _24647;
        #line 65 "impala/gpu_device.impala"
        double _24649;
        _24649 = *_24648;
        #line 65 "impala/gpu_device.impala"
        double _24652;
        _24652 = _24649;
        #line 48 "impala/gaussian.impala"
        double _24653;
        _24653 = _24651 * _24652;
        #line 48 "impala/gaussian.impala"
        double _24654;
        _24654 = sum_24631 + _24653;
        #line 19 "impala/gpu_device.impala"
        p_24629 = _24635;
        psum_24631 = _24654;
        goto l24628;
}

}