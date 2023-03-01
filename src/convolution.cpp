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
  #include "convolution_nchw.h"
  #include "convolution_nhwc.h"
  using namespace Halide::Runtime;
#else
  #include <Halide.h>
  using namespace Halide;
#endif

static const int batch = 1;
static const int kW = 3;
static const int kH = 3;
static const int stride = 1;

void convolution_nchw_halide(float* src, float* kernel, float* dst,
                             int inpChannels, int outChannels, int height, int width) {
    Buffer<float> input(src, {width, height, inpChannels, batch});
    Buffer<float> weights(kernel, {kW, kH, inpChannels, outChannels});
    Buffer<float> output(dst, {width - 2, height - 2, outChannels, batch});
#ifdef __riscv
    convolution_nchw(input, weights, output);
#else
    static Func conv("convolution_nchw");
    if (!conv.defined()) {
        Halide::Var x("x"), y("y"), c("c"), n("n");
        Halide::RDom r(0, kW, 0, kH, 0, inpChannels);
        Halide::Expr kx = x * stride + r.x;
        Halide::Expr ky = y * stride + r.y;
        Halide::Expr kc = r.z;

        conv(x, y, c, n) = sum(input(kx, ky, kc, n) *
                               weights(r.x, r.y, r.z, c));

        // Schedule
        conv.bound(x, 0, width - 2)
            .bound(y, 0, height - 2)
            .bound(c, 0, outChannels)
            .bound(n, 0, batch);

        int factor = 4;
        conv.vectorize(x, factor);

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = factor * sizeof(float) * 8;

        // Tested XuanTie C906 has 128-bit vector unit
        CV_Assert(target.vector_bits <= 128);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;
        conv.print_loop_nest();

        // Dump AOT code
        std::string prefix = "convolution_nchw";
        conv.compile_to_header(prefix + ".h", {input, weights}, prefix, target);
        conv.compile_to_assembly(prefix + ".s", {input, weights}, prefix, target);
    }
#endif
}

void convolution_nhwc_halide(float* src, float* kernel, float* dst,
                             int inpChannels, int outChannels, int height, int width) {
    Buffer<float> input(src, {inpChannels, width, height, batch});
    Buffer<float> weights(kernel, {outChannels, kW, kH, inpChannels});
    Buffer<float> output(dst, {outChannels, width - 2, height - 2, batch});
#ifdef __riscv
    convolution_nhwc(input, weights, output);
#else
    static Func conv("convolution_nhwc");
    if (!conv.defined()) {
        Halide::Var x("x"), y("y"), c("c"), n("n");
        Halide::RDom r(0, kW, 0, kH, 0, inpChannels);
        Halide::Expr kx = x * stride + r.x;
        Halide::Expr ky = y * stride + r.y;
        Halide::Expr kc = r.z;

        conv(c, x, y, n) = sum(input(kc, kx, ky, n) *
                               weights(c, r.x, r.y, r.z));

        // Schedule
        conv.bound(x, 0, width - 2)
            .bound(y, 0, height - 2)
            .bound(c, 0, outChannels)
            .bound(n, 0, batch);

        int factor = 4;
        conv.vectorize(c, factor);

        // Compile
        Target target;
        target.os = Target::OS::Linux;
        target.arch = Target::Arch::RISCV;
        target.bits = 64;
        target.vector_bits = factor * sizeof(float) * 8;

        // Tested XuanTie C906 has 128-bit vector unit
        CV_Assert(target.vector_bits <= 128);

        std::vector<Target::Feature> features;
        features.push_back(Target::RVV);
        features.push_back(Target::NoAsserts);
        features.push_back(Target::NoRuntime);
        target.set_features(features);

        std::cout << target << std::endl;
        conv.print_loop_nest();

        // Dump AOT code
        std::string prefix = "convolution_nhwc";
        conv.compile_to_header(prefix + ".h", {input, weights}, prefix, target);
        conv.compile_to_assembly(prefix + ".s", {input, weights}, prefix, target);
    }
#endif
}

void convolution_opencv(const cv::Mat& src, const cv::Mat& weights, cv::Mat& dst,
                        int inpChannels, int outChannels) {
    static cv::dnn::Net net;
    if (net.empty()) {
        cv::dnn::LayerParams lp;
        lp.set("num_output", outChannels);
        lp.set("kernel_w", kW);
        lp.set("kernel_h", kH);
        lp.set("stride", 1);
        lp.set("pad", 0);
        lp.set("bias_term", false);
        lp.type = "Convolution";
        lp.name = "testConv";
        lp.blobs.push_back(weights);
        net.addLayerToPrev(lp.name, lp.type, lp);
    }
    net.setInput(src);
    dst = net.forward();
}
