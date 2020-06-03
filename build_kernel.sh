#!/bin/bash

export CROSS_COMPILE=/home/firemax13/mykernel/toolchain/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export ARCH=arm64

mkdir out

BUILD_CROSS_COMPILE=/home/firemax13/mykernel/toolchain/aarch64-linux-android-4.9/bin/aarch64-linux-android-
KERNEL_LLVM_BIN=/home/firemax13/mykernel/toolchain/Clang/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

make -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE r1q_eur_open_defconfig
make -j64 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE
cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
