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

void histogram_ref(const uint8_t* src, int32_t* dst, int height, int width);
void histogram_halide(uint8_t* src, int32_t* dst, int height, int width);
void histogram_opencv(const cv::Mat& src, cv::Mat& dst);

void bgr2gray_ref(const uint8_t* src, uint8_t* dst, int height, int width);
void bgr2gray_interleaved_halide(uint16_t* src, uint16_t* dst, int height, int width);
void bgr2gray_planar_halide(uint8_t* src, uint8_t* dst, int height, int width);
void bgr2gray_opencv(const cv::Mat& src, cv::Mat& dst);

void boxFilter_halide(uint16_t* src, uint16_t* dst, int height, int width);
void boxFilter_opencv(const cv::Mat& src, cv::Mat& dst);

void convolution_nchw_halide(float* src, float* kernel, float* dst,
                             int inpChannels, int outChannels, int height, int width);
void convolution_nhwc_halide(float* src, float* kernel, float* dst,
                             int inpChannels, int outChannels, int height, int width);
void convolution_opencv(const cv::Mat& src, const cv::Mat& weights, cv::Mat& dst,
                        int inpChannels, int outChannels);
