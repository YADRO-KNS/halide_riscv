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
  #include "histogram.h"
  using namespace Halide::Runtime;
#else
  #include <Halide.h>
  using namespace Halide;
#endif

void histogram_ref(const uint8_t* src, int32_t* dst, int height, int width) {
    const int plane = height * width;
    int32_t* dst_offsets[] = {dst, dst + 256, dst + 512};
    for (int i = 0; i < 256 * 3; ++i) {
        dst[i] = 0;
    }
    for (int i = 0; i < plane; ++i) {
        for (int c = 0; c < 3; ++c) {
            uint8_t val = src[i * 3 + c];
            dst_offsets[c][val] += 1;
        }
    }
}

void histogram_opencv(const cv::Mat& src, cv::Mat& dst) {
    int histSize[] = {256};
    float colorRanges[] = { 0, 256 };
    const float* ranges[] = { colorRanges };

    for (int i = 0; i < 3; ++ i) {
        int channels[] = {i};
        calcHist(&src, 1, channels, cv::Mat(), dst.row(i).reshape(1, 256), 1, histSize, ranges);
    }
}

void histogram_halide(uint8_t* src, int32_t* dst, int height, int width) {
    auto input = Buffer<uint8_t>::make_interleaved(src, width, height, 3);
    Buffer<int32_t> output(dst, {256, 3});
#ifdef __riscv
    histogram(input, output);
#else
    static Func f("hist");
    if (!f.defined()) {
        // Define function
        Var c("c"), i("i");
        RDom r(0, width, 0, height);

        f(i, c) = 0;
        Expr lum = clamp(input(r.x, r.y, c), 0, 255);
        f(lum, c) += 1;

        // Schedule
        f.bound(i, 0, 256).bound(c, 0, 3);

        int factor = 8;
        f.vectorize(i, factor);
        f.update(0).unscheduled();

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = factor * sizeof(uint16_t) * 8;

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
        f.compile_to_header("histogram.h", {input}, "histogram", target);
        f.compile_to_assembly("histogram.s", {input}, "histogram", target);
    }
#endif
}
