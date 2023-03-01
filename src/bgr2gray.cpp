// Copyright (C), 2023, KNS Group LLC (YADRO)

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//     http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <opencv2/opencv.hpp>

#ifdef __riscv
#include <HalideBuffer.h>
#include "bgr2gray_interleaved.h"
#include "bgr2gray_planar.h"

using namespace Halide::Runtime;

#else

#include <Halide.h>

using namespace Halide;

#endif


void bgr2gray_interleaved_halide(uint16_t* src, uint16_t* dst, int height, int width) {
    auto input = Buffer<uint16_t>::make_interleaved(src, width, height, 3);
    Buffer<uint16_t> output(dst, {width, height});
#ifdef __riscv
    bgr2gray_interleaved(input, output);
#else
    static Func f("bgr2gray");
    if (!f.defined()) {
        uint16_t R2GRAY = 77, G2GRAY = 150, B2GRAY = 29;

        Var x("x"), y("y");
        Buffer<uint16_t> scales(3);
        scales(0) = B2GRAY;
        scales(1) = G2GRAY;
        scales(2) = R2GRAY;

        // RDom helps prevent adding vl4r.v instructions
        RDom r(0, 3);
        Expr res = sum(input(x, y, r) * scales(r)) >> 8;
        f(x, y) = res;

        // Schedule
        int factor = 8;
        f.vectorize(x, factor);

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = factor * sizeof(uint16_t) * 8;

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;
        f.print_loop_nest();

        // Dump AOT code
        f.compile_to_header("bgr2gray_interleaved.h", {input}, "bgr2gray_interleaved", target);
        f.compile_to_assembly("bgr2gray_interleaved.s", {input}, "bgr2gray_interleaved", target);
    }
#endif
}

void bgr2gray_planar_halide(uint8_t* src, uint8_t* dst, int height, int width) {
    Buffer<uint8_t> input(src, width, height, 3);
    Buffer<uint8_t> output(dst, {width, height});
#ifdef __riscv
    bgr2gray_planar(input, output);
#else
    static Func f("bgr2gray");
    if (!f.defined()) {
        uint16_t R2GRAY = 77, G2GRAY = 150, B2GRAY = 29;

        Var x("x"), y("y");
        Expr b = cast<uint16_t>(input(x, y, 0));
        Expr g = cast<uint16_t>(input(x, y, 1));
        Expr r = cast<uint16_t>(input(x, y, 2));
        f(x, y) = cast<uint8_t>((R2GRAY * r + G2GRAY * g + B2GRAY * b) >> 8);

        // Schedule
        int factor = 16;
        f.vectorize(x, factor);

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = factor * sizeof(uint8_t) * 8;

        // Tested XuanTie C906 has 128-bit vector unit
        CV_Assert(target.vector_bits <= 128);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;
        f.print_loop_nest();

        // Dump AOT code
        f.compile_to_header("bgr2gray_planar.h", {input}, "bgr2gray_planar", target);
        f.compile_to_assembly("bgr2gray_planar.s", {input}, "bgr2gray_planar", target);
    }
#endif
}

void bgr2gray_opencv(const cv::Mat& src, cv::Mat& dst) {
    cv::cvtColor(src, dst, cv::COLOR_BGR2GRAY);
}

void bgr2gray_ref(const uint8_t* src, uint8_t* dst, int height, int width) {
    uint16_t red, green, blue, R2GRAY = 77, G2GRAY = 150, B2GRAY = 29;

    for (int y = 0; y < height; ++y) {
        const uint8_t* srcData = src + y * width * 3;
        uint8_t* dstData = dst + y * width;
        for (int x = 0; x < width; ++x) {
            blue = static_cast<uint16_t>(srcData[x * 3]);
            green = static_cast<uint16_t>(srcData[x * 3 + 1]);
            red = static_cast<uint16_t>(srcData[x * 3 + 2]);
            dstData[x] = static_cast<uint8_t>((R2GRAY * red + G2GRAY * green + B2GRAY * blue) >> 8);
        }
    }
}
