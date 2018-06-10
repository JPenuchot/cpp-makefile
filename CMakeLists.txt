cmake_minimum_required(VERSION 2.8.9)
project(Proj)

# Adding compiler optimizations

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -fPIC")

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} \
  -O0")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} \
  -O3 -mavx2 -mfma -DNDEBUG")

# Adding includes

include_directories(
  "include/"
)

# Adding sources

file(GLOB_RECURSE SOURCES "src/*.cpp")
add_executable(prog ${SOURCES})
