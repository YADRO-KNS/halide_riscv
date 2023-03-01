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

#include <opencv2/ts.hpp>

#include "algos.hpp"

using namespace cv;

const int width = 1920;
const int height = 1080;

CV_TEST_MAIN("")

TEST(histogram, opencv) {
    Mat src(height, width, CV_8UC3), dst(3, 256, CV_32F), ref(3, 256, CV_32S);
    randu(src, 0, 256);

    histogram_opencv(src, dst);
    histogram_ref(src.ptr<uint8_t>(), ref.ptr<int32_t>(), src.rows, src.cols);

    ref.convertTo(ref, CV_32F);
    ASSERT_EQ(countNonZero(dst != ref), 0);
}

TEST(histogram, halide)
{
    Mat src(height, width, CV_8UC3), dst(3, 256, CV_32S), ref(3, 256, CV_32S);
    randu(src, 0, 256);

    histogram_halide(src.ptr<uint8_t>(), dst.ptr<int32_t>(), src.rows, src.cols);
    histogram_ref(src.ptr<uint8_t>(), ref.ptr<int32_t>(), src.rows, src.cols);

    ASSERT_EQ(countNonZero(dst != ref), 0);
}

TEST(bgr2gray, opencv) {
    Mat src(height, width, CV_8UC3), dst(height, width, CV_8U), ref(height, width, CV_8U);
    randu(src, 0, 256);

    bgr2gray_opencv(src, dst);
    bgr2gray_ref(src.ptr<uint8_t>(), ref.ptr<uint8_t>(), src.rows, src.cols);

    ASSERT_LE(norm(ref, dst, NORM_INF), 1);
}

TEST(bgr2gray_interleaved, halide) {
    Mat src(height, width, CV_8UC3), dst(height, width, CV_16U), ref(height, width, CV_8U);
    randu(src, 0, 256);
    Mat src16;
    src.convertTo(src16, CV_16UC3);

    bgr2gray_interleaved_halide(src16.ptr<uint16_t>(), dst.ptr<uint16_t>(), src.rows, src.cols);
    bgr2gray_ref(src.ptr<uint8_t>(), ref.ptr<uint8_t>(), src.rows, src.cols);

    ref.convertTo(ref, CV_16U);
    ASSERT_LE(norm(ref, dst, NORM_INF), 0);
}

TEST(bgr2gray_planar, halide) {
    Mat src(height, width, CV_8UC3), dst(height, width, CV_8U), ref(height, width, CV_8U);
    randu(src, 0, 256);
    Mat planar(height * 3, width, CV_8U);

    std::vector<cv::Mat> channels(3);
    channels[0] = planar.rowRange(0, height);
    channels[1] = planar.rowRange(height, height * 2);
    channels[2] = planar.rowRange(height * 2, height * 3);
    cv::split(src, channels);

    bgr2gray_ref(src.ptr<uint8_t>(), ref.ptr<uint8_t>(), src.rows, src.cols);
    bgr2gray_planar_halide(planar.ptr<uint8_t>(), dst.ptr<uint8_t>(), src.rows, src.cols);

    ASSERT_LE(norm(ref, dst, NORM_INF), 0);
}

TEST(boxFilter, halide) {
    Mat src(height, width, CV_8U), dst(height - 2, width - 2, CV_16U), ref(height, width, CV_8U);
    randu(src, 0, 256);
    Mat src16;
    src.convertTo(src16, CV_16U);

    boxFilter_halide(src16.ptr<uint16_t>(), dst.ptr<uint16_t>(), src.rows, src.cols);
    boxFilter_opencv(src, ref);

    ref = ref.rowRange(1, height - 1).colRange(1, width - 1);
    ref.convertTo(ref, CV_16U);
    ASSERT_LE(norm(ref, dst, NORM_INF), 1);
}

TEST(convolution_nchw, halide) {
    static const int ic = 16;
    static const int oc = 32;
    static const int height = 128;
    static const int width = 128;
    Mat src({1, ic, height, width}, CV_32F);
    Mat kernel({oc, ic, 3, 3}, CV_32F);
    Mat ref({1, oc, height - 2, width - 2}, CV_32F);
    Mat dst({1, oc, height - 2, width - 2}, CV_32F);
    randn(src, 0, 1);
    randn(kernel, 0, 1);

    convolution_opencv(src, kernel, ref, ic, oc);
    convolution_nchw_halide(src.ptr<float>(), kernel.ptr<float>(), dst.ptr<float>(),
                            ic, oc, height, width);

    ASSERT_LE(norm(ref, dst, NORM_INF), 4e-5f);
}

TEST(convolution_nhwc, halide) {
    static const int ic = 16;
    static const int oc = 32;
    static const int height = 128;
    static const int width = 128;
    Mat src_nchw({1, ic, height, width}, CV_32F);
    Mat kernel_oihw({oc, ic, 3, 3}, CV_32F);
    Mat ref({1, oc, height - 2, width - 2}, CV_32F);
    Mat dst_nhwc({1, height - 2, width - 2, oc}, CV_32F);
    randn(src_nchw, 0, 1);
    randn(kernel_oihw, 0, 1);

    convolution_opencv(src_nchw, kernel_oihw, ref, ic, oc);

    Mat kernel_ihwo, src_nhwc;
    cv::transpose(kernel_oihw.reshape(1, oc), kernel_ihwo);
    cv::transpose(src_nchw.reshape(1, ic), src_nhwc);

    convolution_nhwc_halide(src_nhwc.ptr<float>(), kernel_ihwo.ptr<float>(), dst_nhwc.ptr<float>(),
                            ic, oc, height, width);

    Mat dst;
    cv::transpose(dst_nhwc.reshape(1, dst_nhwc.size[1] * dst_nhwc.size[2]), dst);

    ASSERT_LE(norm(ref.reshape(1, 1), dst.reshape(1, 1), NORM_INF), 4e-5f);
}
