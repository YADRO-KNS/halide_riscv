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
#include "box_filter.h"

using namespace Halide::Runtime;

#else

#include <Halide.h>

using namespace Halide;

#endif

void boxFilter_halide(uint16_t* src, uint16_t* dst, int height, int width) {
    Buffer<uint16_t> input(src, {width, height});
    Buffer<uint16_t> output(dst, {width - 2, height - 2});
#ifdef __riscv
    box_filter(input, output);
#else
    static Func f("box_filter");
    if (!f.defined()) {
        // Func padded = BoundaryConditions::constant_exterior(input, 0);

        Var x("x"), y("y"), c("c");

        RDom r(0, 3, 0, 3);
        Expr s = sum(input(x + r.x, y + r.y));
        f(x, y) = s / 9;

        // Schedule
        f.bound(x, 0, width - 2).bound(y, 0, height - 2);

        int factor = 8;
        f.vectorize(x, factor);

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
        f.compile_to_header("box_filter.h", {input}, "box_filter", target);
        f.compile_to_assembly("box_filter.s", {input}, "box_filter", target);
    }
#endif
}

void boxFilter_opencv(const cv::Mat& src, cv::Mat& dst) {
    cv::blur(src, dst, cv::Size(3, 3));
}
