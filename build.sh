#!/bin/bash

mkdir -p cmake-build-$1
rm -rf cmake-build-$1/*

if [ "$1" = "Asan" ]; then
    cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -fsanitize=address,undefined -fno-omit-frame-pointer" -S . -B cmake-build-$1
else
    cmake -DCMAKE_BUILD_TYPE=$1 -S . -B cmake-build-$1
fi

cmake --build cmake-build-$1
