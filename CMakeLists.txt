cmake_minimum_required(VERSION 2.8.9)
project(ProjectName)

#	Optimization

IF(CMAKE_COMPILER_IS_GNUCC)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0")
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3")
    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O3")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3")
ENDIF(CMAKE_COMPILER_IS_GNUCC)

#	Includes & Linking

#include_directories
#link_libraries

#	Build

file(GLOB_RECURSE SOURCES "src/*")

add_executable(prog ${SOURCES})