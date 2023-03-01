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

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

set(CMAKE_C_COMPILER riscv64-unknown-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER riscv64-unknown-linux-gnu-g++)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -march=rv64gcv0p7 -mabi=lp64d")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=rv64gcv0p7 -mabi=lp64d")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=rv64gcv0p7 -mabi=lp64d")
