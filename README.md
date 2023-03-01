# Halide language experiments on RISC-V

This repository contains a number of examples written in [Halide](https://github.com/halide/Halide) language which work on RISC-V CPU with RVV 0.7.1.
Follow the steps below to reproduce the experiments or some of their parts.

**NOTE**: At this moment project relies on the Ahead-Of-Time (AOT) compilation of Halide kernels. However there are precompiled files for easy start.

Project uses [OpenCV](https://github.com/opencv/opencv/) as a reference implementation for some algorithms.
Also, we benchmark it to compare with Halide implemention.
Fetch OpenCV source code by submodules update after clonning the repository.

```bash
git submodule update --init
```

## Build and go

1. Download THead toolchain: [Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.6.1-20220906.tar.gz](https://occ.t-head.cn/community/download?id=4090445921563774976) (registration needed)
2. Clone Halide source code (no build required)

    ```bash
    git clone --depth 1 https://github.com/halide/Halide
    ```

3. Build a project for RISC-V CPU:

    ```bash
    export PATH=$HOME/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.6.1/bin/:$PATH

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_TOOLCHAIN_FILE=$HOME/halide_riscv/riscv64-071.toolchain.cmake \
        -DHalide_INCLUDE_DIRS=$HOME/Halide/src/runtime \
        -S halide_riscv -B build_rv64

    cmake --build build_rv64 -j$(nproc --all)
    ```

4. Transfer build directory to the RISC-V board and run `test_algo` (accuracy tests) or `perf_algo` (performance tests).

    ```bash
    scp test_algo perf_algo libalgos.so opencv-prefix/src/opencv-build/lib/* sipeed@x.x.x.x:/home/sipeed/
    ```

    ```bash
    export LD_LIBRARY_PATH=./
    ./test_algo
    ./perf_algo
    ```

## Performance results

HW: Sipeed Lichee RV Dock (Allwinner D1 aka XuanTie C906 CPU)

OS: [20211230_LicheeRV_debian_d1_hdmi_8723ds](https://mega.nz/folder/lx4CyZBA#PiFhY7oSVQ3gp2ZZ_AnwYA/folder/xtxkABIB)

| BGR2Gray<br>input: 1080x1920| Median time |
|---|---|
| Reference (interleaved) | 37.80ms |
| OpenCV (interleaved), no RVV | 32.18ms |
| Halide (interleaved) | 48.74ms |
| Halide (planar) | 6.65ms |

| Box filter<br>input: 1080x1920<br>output: 1078x1918| Median time |
|---|---|
| OpenCV, no RVV | 75.17ms |
| Halide | 62.89ms |

| Histogram<br>input: 1080x1920x3<br>output: 256x3| Median time |
|---|---|
| Reference | 72.06ms |
| OpenCV, no RVV | 57.35ms |
| Halide | 92.44ms |

| Convolution FP32<br>input: 1x16x128x128<br>kernel: 32x16x3x3| Layout | Median time |
|---|---|---|
| OpenCV, no RVV | NCHW | 829.13ms |
| Halide | NCHW | 1612.78ms |
| Halide | NHWC | 629.96ms |

## Generate AOT kernels

If you want regenerate AOT artifacts or add new algorithms, build the project on x86:

1. Build LLVM from https://github.com/dkurt/llvm-rvv-071/tree/rvv-071

    ```bash
    cmake -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_ENABLE_PROJECTS="clang;lld" \
      -DLLVM_TARGETS_TO_BUILD="RISCV" \
      -DLLVM_ENABLE_TERMINFO=OFF -DLLVM_ENABLE_ASSERTIONS=ON \
      -DLLVM_ENABLE_EH=ON -DLLVM_ENABLE_RTTI=ON -DLLVM_BUILD_32_BITS=OFF \
      -GNinja \
      -S llvm-project/llvm -B llvm-build

    cmake --build llvm-build -j4
    ```

2. Build Halide with the following patch (tested on revision https://github.com/halide/Halide/commit/7963cd4e3c23856b82567c99e0a3d16035ffe895):

    ```patch
    diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
    index 4f4b8e532..8f401c442 100644
    --- a/src/CMakeLists.txt
    +++ b/src/CMakeLists.txt
    @@ -540,7 +540,7 @@ endif ()

    if (BUILD_SHARED_LIBS)
        message(STATUS "Building autoschedulers enabled")
    -    add_subdirectory(autoschedulers)
    +    # add_subdirectory(autoschedulers)
    else ()
        message(STATUS "Building autoschedulers disabled (static Halide)")
    endif ()
    diff --git a/src/CodeGen_RISCV.cpp b/src/CodeGen_RISCV.cpp
    index ba9abe04d..454558d11 100644
    --- a/src/CodeGen_RISCV.cpp
    +++ b/src/CodeGen_RISCV.cpp
    @@ -151,6 +151,7 @@ string CodeGen_RISCV::mattrs() const {
                arch_flags += ",+zvl" + std::to_string(target.vector_bits) + "b";
            }
    #endif
    +        arch_flags += ",-zve64x";
        }
        return arch_flags;
    }
    ```

    ```bash
    export LLVM_ROOT=$HOME/llvm-build

    cmake -DLLVM_DIR=$LLVM_ROOT/lib/cmake/llvm \
        -DClang_DIR=$LLVM_ROOT/lib/cmake/clang \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_TESTS=OFF \
        -DWITH_TUTORIALS=OFF \
        -DWITH_PYTHON_BINDINGS=OFF \
        -S Halide -B halide-build

    cmake --build halide-build -j4
    ```

3. Build a project on x86

    ```bash
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DHalide_LIB=$HOME/halide-build/src/libHalide.so \
        -DHalide_INCLUDE_DIRS=$HOME/halide-build/include \
        -S halide_riscv -B build

    cmake --build build -j$(nproc --all)
    ```

4. Run `perf_algo` once and find the generated `*.h` and `*.s` files in the working directory.
