#!/bin/bash

## Managing default directories, args etc...

ORIGIN=$(pwd)

DEFAULT_CMAKE_BUILD_DIR="bin"
BUILD_SUBDIR_NAME=".build_files"

EXEC_NAME="prog"

CMAKE_BUILD_DIR=${1}
OUTPUT_DIR=${2}

## Making directories

mkdir -p ${ORIGIN}/${CMAKE_BUILD_DIR}/{release,debug}

## BUILD

# Release
cd ${ORIGIN}/&{CMAKE_BUILD_DIR}/release
mkdir -p ${BUILD_SUBDIR_NAME}
cd ${BUILD_SUBDIR_NAME}
cmake -DCMAKE_BUILD_TYPE=Release ${ORIGIN}
make
mv ${EXEC_NAME} ..
cd ..
objdump -dC ${EXEC_NAME} > ${EXEC_NAME}.asm

# Debug
cd ${ORIGIN}/&{CMAKE_BUILD_DIR}/debug
mkdir -p ${BUILD_SUBDIR_NAME}
cd ${BUILD_SUBDIR_NAME}
cmake -DCMAKE_BUILD_TYPE=Debug ${ORIGIN}
make
mv ${EXEC_NAME} ..
cd ..
objdump -dC ${EXEC_NAME} > ${EXEC_NAME}.asm
