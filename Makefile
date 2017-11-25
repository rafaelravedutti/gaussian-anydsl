# AnyDSL
ANYDSL_PATH=/home/rafael/repositories/anydsl

# Impala
IMPALA_PATH=${ANYDSL_PATH}/impala
IMPALA_BIN=${IMPALA_PATH}/build/bin

# LLVM binaries
LLVM_BIN=${ANYDSL_PATH}/llvm_build/bin

# Thorin source path
THORIN_PATH=${ANYDSL_PATH}/thorin
THORIN_BUILD=${THORIN_PATH}/build
THORIN_SRC=${THORIN_PATH}/src
THORIN_BACKEND_SRC=${THORIN_SRC}/thorin/be

# OpenCV
OPENCV_LIBS=-lopencv_core -lopencv_highgui -lopencv_imgproc 

# Device file (gpu or cpu)
PLATFORM_FILE=gpu_device.impala

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

# Use modified version of Thorin code generator?
USE_MODIFIED_CODEGEN=yes

# Dataset path
DATASET_PATH=/home/rafael/repositories/tcc/anydsl/canny/dataset

all: gaussian

main.ll: ${PLATFORM_FILE} gaussian.impala opencv_image.impala main.impala

ifeq ($(USE_MODIFIED_CODEGEN), yes)
	cp c.cpp ${THORIN_BACKEND_SRC}/
	cd ${THORIN_BUILD} && make && cd -
endif

	${IMPALA_BIN}/impala -emit-llvm -g -O3 ${IMPALA_LINK_FILES} $^

ifeq ($(USE_MODIFIED_CODEGEN), yes)
	cp c.cpp.original ${THORIN_BACKEND_SRC}/c.cpp
	cd ${THORIN_BUILD} && make && cd -
endif

opencv_runtime.ll: opencv_runtime.cpp
	${LLVM_BIN}/clang++ -S -emit-llvm ${OPENCV_RUNTIME_FLAGS} $^

gaussian: main.ll opencv_runtime.ll ${ANYDSL_PATH}/runtime/build/lib/libruntime.so
	${LLVM_BIN}/clang++ -lm ${OPENCV_LIBS} -lpthread $^ -o $@

clean:
	rm -f main.ll opencv_runtime.ll gaussian

report:
	pdflatex --shell-escape report.tex
	evince report.pdf &
