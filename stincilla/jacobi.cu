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
__global__ void lambda_35652(float*, float*);

__global__ __launch_bounds__ (128 * 1 * 1) void lambda_35652(float* _35655_38561, float* _35656_38562) {
    int  threadIdx_x_38568;
    int pthreadIdx_x_38568;
    int  blockDim_x_38574;
    int pblockDim_x_38574;
    int  blockIdx_x_38580;
    int pblockIdx_x_38580;
    int  _38586;
    int p_38586;
    int  _38592;
    int p_38592;
    int  _38598;
    int p_38598;
    int  _38601;
    int p_38601;
    int  converge_38608;
    int pconverge_38608;
    int  converge_38613;
    int pconverge_38613;
    int  converge_38621;
    int pconverge_38621;
    int  converge_38625;
    int pconverge_38625;
    float  _38635;
    float p_38635;
    int  converge_38640;
    int pconverge_38640;
    int  converge_38644;
    int pconverge_38644;
    int  converge_38648;
    int pconverge_38648;
    int  converge_38652;
    int pconverge_38652;
    float  _38658;
    float p_38658;
    int  converge_38661;
    int pconverge_38661;
    int  converge_38665;
    int pconverge_38665;
    int  converge_38668;
    int pconverge_38668;
    int  converge_38672;
    int pconverge_38672;
    float  _38678;
    float p_38678;
    int  converge_38684;
    int pconverge_38684;
    int  converge_38688;
    int pconverge_38688;
    int  converge_38691;
    int pconverge_38691;
    int  converge_38695;
    int pconverge_38695;
    float  _38701;
    float p_38701;
    int  converge_38704;
    int pconverge_38704;
    int  converge_38708;
    int pconverge_38708;
    int  converge_38713;
    int pconverge_38713;
    int  converge_38717;
    int pconverge_38717;
    float  _38723;
    float p_38723;
    threadIdx_x_38568 = threadIdx_x();
    pthreadIdx_x_38568 = threadIdx_x_38568;
    l38566: ;
        threadIdx_x_38568 = pthreadIdx_x_38568;
        blockDim_x_38574 = blockDim_x();
        pblockDim_x_38574 = blockDim_x_38574;
    l38572: ;
        blockDim_x_38574 = pblockDim_x_38574;
        blockIdx_x_38580 = blockIdx_x();
        pblockIdx_x_38580 = blockIdx_x_38580;
    l38578: ;
        blockIdx_x_38580 = pblockIdx_x_38580;
        _38586 = threadIdx_y();
        p_38586 = _38586;
    l38584: ;
        _38586 = p_38586;
        _38592 = blockDim_y();
        p_38592 = _38592;
    l38590: ;
        _38592 = p_38592;
        _38598 = blockIdx_y();
        p_38598 = _38598;
    l38596: ;
        _38598 = p_38598;
        _38601 = blockDim_y();
        p_38601 = _38601;
    l38599: ;
        _38601 = p_38601;
        int _38602;
        _38602 = blockDim_x_38574 * blockIdx_x_38580;
        int _38603;
        _38603 = threadIdx_x_38568 + _38602;
        bool _38605;
        _38605 = _38603 < 0;
        if (_38605) goto l38606; else goto l38761;
    l38761: ;
        pconverge_38608 = _38603;
        goto l38607;
    l38606: ;
        pconverge_38608 = 0;
        goto l38607;
    l38607: ;
        converge_38608 = pconverge_38608;
        bool _38610;
        _38610 = 2048 <= converge_38608;
        if (_38610) goto l38611; else goto l38760;
    l38760: ;
        pconverge_38613 = converge_38608;
        goto l38612;
    l38611: ;
        pconverge_38613 = 2047;
        goto l38612;
    l38612: ;
        converge_38613 = pconverge_38613;
        int _38615;
        _38615 = _38592 * _38598;
        int gid_y_38616;
        gid_y_38616 = _38586 + _38615;
        int _38617;
        _38617 = -1 + gid_y_38616;
        bool _38618;
        _38618 = _38617 < 0;
        if (_38618) goto l38619; else goto l38759;
    l38759: ;
        pconverge_38621 = _38617;
        goto l38620;
    l38619: ;
        pconverge_38621 = 0;
        goto l38620;
    l38620: ;
        converge_38621 = pconverge_38621;
        bool _38622;
        _38622 = 2048 <= converge_38621;
        if (_38622) goto l38623; else goto l38758;
    l38758: ;
        pconverge_38625 = converge_38621;
        goto l38624;
    l38623: ;
        pconverge_38625 = 2047;
        goto l38624;
    l38624: ;
        converge_38625 = pconverge_38625;
        int _38630;
        _38630 = 2048 * converge_38625;
        int _38631;
        _38631 = _38630 + converge_38613;
        float* idx_38632;
        idx_38632 = _35655_38561 + _38631;
        _38635 = __ldg(idx_38632);
        p_38635 = _38635;
    l38633: ;
        _38635 = p_38635;
        int _38636;
        _38636 = -1 + _38603;
        bool _38637;
        _38637 = _38636 < 0;
        if (_38637) goto l38638; else goto l38757;
    l38757: ;
        pconverge_38640 = _38636;
        goto l38639;
    l38638: ;
        pconverge_38640 = 0;
        goto l38639;
    l38639: ;
        converge_38640 = pconverge_38640;
        bool _38641;
        _38641 = 2048 <= converge_38640;
        if (_38641) goto l38642; else goto l38756;
    l38756: ;
        pconverge_38644 = converge_38640;
        goto l38643;
    l38642: ;
        pconverge_38644 = 2047;
        goto l38643;
    l38643: ;
        converge_38644 = pconverge_38644;
        bool _38645;
        _38645 = gid_y_38616 < 0;
        if (_38645) goto l38646; else goto l38755;
    l38755: ;
        pconverge_38648 = gid_y_38616;
        goto l38647;
    l38646: ;
        pconverge_38648 = 0;
        goto l38647;
    l38647: ;
        converge_38648 = pconverge_38648;
        bool _38649;
        _38649 = 2048 <= converge_38648;
        if (_38649) goto l38650; else goto l38754;
    l38754: ;
        pconverge_38652 = converge_38648;
        goto l38651;
    l38650: ;
        pconverge_38652 = 2047;
        goto l38651;
    l38651: ;
        converge_38652 = pconverge_38652;
        int _38653;
        _38653 = 2048 * converge_38652;
        int _38654;
        _38654 = _38653 + converge_38644;
        float* idx_38655;
        idx_38655 = _35655_38561 + _38654;
        _38658 = __ldg(idx_38655);
        p_38658 = _38658;
    l38656: ;
        _38658 = p_38658;
        if (_38605) goto l38659; else goto l38753;
    l38753: ;
        pconverge_38661 = _38603;
        goto l38660;
    l38659: ;
        pconverge_38661 = 0;
        goto l38660;
    l38660: ;
        converge_38661 = pconverge_38661;
        bool _38662;
        _38662 = 2048 <= converge_38661;
        if (_38662) goto l38663; else goto l38752;
    l38752: ;
        pconverge_38665 = converge_38661;
        goto l38664;
    l38663: ;
        pconverge_38665 = 2047;
        goto l38664;
    l38664: ;
        converge_38665 = pconverge_38665;
        if (_38645) goto l38666; else goto l38751;
    l38751: ;
        pconverge_38668 = gid_y_38616;
        goto l38667;
    l38666: ;
        pconverge_38668 = 0;
        goto l38667;
    l38667: ;
        converge_38668 = pconverge_38668;
        bool _38669;
        _38669 = 2048 <= converge_38668;
        if (_38669) goto l38670; else goto l38750;
    l38750: ;
        pconverge_38672 = converge_38668;
        goto l38671;
    l38670: ;
        pconverge_38672 = 2047;
        goto l38671;
    l38671: ;
        converge_38672 = pconverge_38672;
        int _38673;
        _38673 = 2048 * converge_38672;
        int _38674;
        _38674 = _38673 + converge_38665;
        float* idx_38675;
        idx_38675 = _35655_38561 + _38674;
        _38678 = __ldg(idx_38675);
        p_38678 = _38678;
    l38676: ;
        _38678 = p_38678;
        int _38680;
        _38680 = 1 + _38603;
        bool _38681;
        _38681 = _38680 < 0;
        if (_38681) goto l38682; else goto l38749;
    l38749: ;
        pconverge_38684 = _38680;
        goto l38683;
    l38682: ;
        pconverge_38684 = 0;
        goto l38683;
    l38683: ;
        converge_38684 = pconverge_38684;
        bool _38685;
        _38685 = 2048 <= converge_38684;
        if (_38685) goto l38686; else goto l38748;
    l38748: ;
        pconverge_38688 = converge_38684;
        goto l38687;
    l38686: ;
        pconverge_38688 = 2047;
        goto l38687;
    l38687: ;
        converge_38688 = pconverge_38688;
        if (_38645) goto l38689; else goto l38747;
    l38747: ;
        pconverge_38691 = gid_y_38616;
        goto l38690;
    l38689: ;
        pconverge_38691 = 0;
        goto l38690;
    l38690: ;
        converge_38691 = pconverge_38691;
        bool _38692;
        _38692 = 2048 <= converge_38691;
        if (_38692) goto l38693; else goto l38746;
    l38746: ;
        pconverge_38695 = converge_38691;
        goto l38694;
    l38693: ;
        pconverge_38695 = 2047;
        goto l38694;
    l38694: ;
        converge_38695 = pconverge_38695;
        int _38696;
        _38696 = 2048 * converge_38695;
        int _38697;
        _38697 = _38696 + converge_38688;
        float* idx_38698;
        idx_38698 = _35655_38561 + _38697;
        _38701 = __ldg(idx_38698);
        p_38701 = _38701;
    l38699: ;
        _38701 = p_38701;
        if (_38605) goto l38702; else goto l38745;
    l38745: ;
        pconverge_38704 = _38603;
        goto l38703;
    l38702: ;
        pconverge_38704 = 0;
        goto l38703;
    l38703: ;
        converge_38704 = pconverge_38704;
        bool _38705;
        _38705 = 2048 <= converge_38704;
        if (_38705) goto l38706; else goto l38744;
    l38744: ;
        pconverge_38708 = converge_38704;
        goto l38707;
    l38706: ;
        pconverge_38708 = 2047;
        goto l38707;
    l38707: ;
        converge_38708 = pconverge_38708;
        int _38709;
        _38709 = 1 + gid_y_38616;
        bool _38710;
        _38710 = _38709 < 0;
        if (_38710) goto l38711; else goto l38743;
    l38743: ;
        pconverge_38713 = _38709;
        goto l38712;
    l38711: ;
        pconverge_38713 = 0;
        goto l38712;
    l38712: ;
        converge_38713 = pconverge_38713;
        bool _38714;
        _38714 = 2048 <= converge_38713;
        if (_38714) goto l38715; else goto l38742;
    l38742: ;
        pconverge_38717 = converge_38713;
        goto l38716;
    l38715: ;
        pconverge_38717 = 2047;
        goto l38716;
    l38716: ;
        converge_38717 = pconverge_38717;
        int _38718;
        _38718 = 2048 * converge_38717;
        int _38719;
        _38719 = _38718 + converge_38708;
        float* idx_38720;
        idx_38720 = _35655_38561 + _38719;
        _38723 = __ldg(idx_38720);
        p_38723 = _38723;
    l38721: ;
        _38723 = p_38723;
        float _38731;
        _38731 = 2.000000e-01f * _38658;
        int _38724;
        _38724 = 2048 * gid_y_38616;
        float _38738;
        _38738 = 2.000000e-01f * _38723;
        float _38734;
        _38734 = 2.000000e-01f * _38678;
        float _38736;
        _38736 = 2.000000e-01f * _38701;
        float _38729;
        _38729 = 2.000000e-01f * _38635;
        int _38725;
        _38725 = _38724 + _38603;
        float _38730;
        _38730 = 0.000000e+00f + _38729;
        float* idx_38726;
        idx_38726 = _35656_38562 + _38725;
        float _38732;
        _38732 = _38730 + _38731;
        float _38735;
        _38735 = _38732 + _38734;
        float _38737;
        _38737 = _38735 + _38736;
        float _38739;
        _38739 = _38737 + _38738;
        *idx_38726 = _38739;
        return ;
}

}