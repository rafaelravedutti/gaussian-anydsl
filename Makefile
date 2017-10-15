# AnyDSL
ANYDSL_PATH=/home/rafael/repositories/anydsl

# Impala
IMPALA_PATH=${ANYDSL_PATH}/impala
IMPALA_BIN=${IMPALA_PATH}/build/bin

# OpenCV
OPENCV_LIBS=-lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_imgcodecs

# Device type (gpu or cpu)
PLATFORM_TYPE=gpu

# Impala files to link
RUNTIME_PATH=${ANYDSL_PATH}/runtime
PLATFORMS_PATH=${RUNTIME_PATH}/platforms

IMPALA_LINK_FILES = \
	${RUNTIME_PATH}/src/runtime.impala \
	${PLATFORMS_PATH}/intrinsics.impala \
	${PLATFORMS_PATH}/intrinsics_thorin.impala \
	${PLATFORMS_PATH}/intrinsics_cpu.impala \
	${PLATFORMS_PATH}/intrinsics_nvvm.impala \
	${PLATFORMS_PATH}/intrinsics_opencl.impala \
	${PLATFORMS_PATH}/intrinsics_cuda.impala

all: gaussian

gaussian.ll: ${PLATFORM_TYPE}_device.impala gaussian.impala opencv_image.impala main.impala
	${IMPALA_BIN}/impala -emit-llvm -g -O3 ${IMPALA_LINK_FILES} $^

opencv_runtime.ll: opencv_runtime.cpp
	clang++ -S -emit-llvm ${OPENCV_RUNTIME_FLAGS} $^

gaussian: gaussian.ll opencv_runtime.ll
	clang++ -lm ${OPENCV_LIBS} -lpthread $^ -o $@

clean:
	rm -f gaussian.ll opencv_runtime.ll gaussian
