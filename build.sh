#!/bin/bash

## Managing default directories, args etc...

ORIGIN=$(pwd)

EXEC_NAME="prog"
CMAKE_BUILD_DIR="bin"
BUILD_SUBDIR_NAME=".build_files"

## Making directories

mkdir -p ${ORIGIN}/${CMAKE_BUILD_DIR}/{release,debug}

## BUILD

# Release
cd ${ORIGIN}/${CMAKE_BUILD_DIR}/release
cmake -DCMAKE_BUILD_TYPE=Release -G Ninja ${ORIGIN}
ninja
objdump -dC ${EXEC_NAME} > ${EXEC_NAME}.asm

# Debug
cd ${ORIGIN}/${CMAKE_BUILD_DIR}/debug
cmake -DCMAKE_BUILD_TYPE=Debug -G Ninja ${ORIGIN}
ninja
objdump -dC ${EXEC_NAME} > ${EXEC_NAME}.asm
