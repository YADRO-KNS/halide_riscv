# Copyright (C), 2023, KNS Group LLC (YADRO)

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cmake_minimum_required(VERSION 3.21)

project(halide_riscv)

include(ExternalProject)

set(CROSS_COMPILE_FLAGS "")
if("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "riscv64")
  list(APPEND CROSS_COMPILE_FLAGS
    "-DCMAKE_TOOLCHAIN_FILE=<SOURCE_DIR>/platforms/linux/riscv64-gcc.toolchain.cmake"
    "-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}"
    "-DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}"
  )
endif()

# OpenCV's flags
ExternalProject_Add(opencv
  SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}/3rdparty/opencv"
  CMAKE_ARGS
    "-DCMAKE_BUILD_TYPE=Release"
    "-DCMAKE_INSTALL_PREFIX=<BINARY_DIR>/install/"
    ${CROSS_COMPILE_FLAGS}
    "-DBUILD_LIST=ts,core,imgproc,dnn"
    "-DWITH_WEBP=OFF"
    "-DWITH_ZLIB=OFF"
    "-DWITH_OPENEXR=OFF"
    "-DWITH_FFMPEG=OFF"
    "-DWITH_IPP=OFF"
    "-DWITH_JASPER=OFF"
    "-DWITH_QUIRC=OFF"
    "-DWITH_ITT=OFF"
    "-DWITH_ADE=OFF"
    "-DWITH_OPENCL=OFF"
    "-DWITH_TIFF=OFF"
    "-DBUILD_ZLIB=OFF"
    "-DBUILD_PERF_TESTS=OFF"
    "-DWITH_JASPER=OFF"
    "-DBUILD_opencv_apps=OFF"
)

ExternalProject_Get_Property(opencv binary_dir)
set(OpenCV_INCLUDE_DIRS
  "${binary_dir}/install/include/opencv4"
  "${binary_dir}/install/include/opencv4/opencv2"
  "${CMAKE_CURRENT_LIST_DIR}/3rdparty/opencv/modules/ts/include"
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")

file(GLOB SOURCES src/*.cpp)
if("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "riscv64")
  file(GLOB ASM aot/*.s)
  list(APPEND SOURCES ${ASM})
endif()

add_library(algos SHARED ${SOURCES})

if("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "riscv64")
  enable_language(ASM)
  target_include_directories(algos PRIVATE "${CMAKE_CURRENT_LIST_DIR}/aot")
else()
  find_package(Halide REQUIRED)
  target_link_libraries(algos
    Halide::Halide
  )
endif()

add_dependencies(algos opencv)

target_include_directories(algos PRIVATE
  ${Halide_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
  "include"
)

target_link_libraries(algos
  "${binary_dir}/install/lib/libopencv_core.so"
  "${binary_dir}/install/lib/libopencv_imgproc.so"
  "${binary_dir}/install/lib/libopencv_dnn.so"
)


# Performance tests
file(GLOB PERF_SOURCES perf/*.cpp)
add_executable(perf_algo ${PERF_SOURCES})
target_link_libraries(perf_algo
  algos
  "${binary_dir}/lib/libopencv_ts.a"
  pthread
)
target_include_directories(perf_algo PUBLIC
  ${OpenCV_INCLUDE_DIRS}
  "include"
)

# Accuracy tests
file(GLOB PERF_SOURCES test/*.cpp)
add_executable(test_algo ${PERF_SOURCES})
target_link_libraries(test_algo
  algos
  "${binary_dir}/lib/libopencv_ts.a"
  pthread
)
target_include_directories(test_algo PUBLIC
  ${OpenCV_INCLUDE_DIRS}
  "include"
)
