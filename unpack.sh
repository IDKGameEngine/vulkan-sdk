#!/bin/bash
set -e

THIS_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

SDK_VERSION="1.4.357.1"
SDK_ARCHIVE="vulkansdk-linux-x86_64-$SDK_VERSION.tar.xz"

mkdir -p $THIS_DIR/{dist,sdk} && cd $THIS_DIR/dist
wget -N "https://sdk.lunarg.com/sdk/download/1.4.357.1/linux/${SDK_ARCHIVE}"
tar -xf $SDK_ARCHIVE -C $THIS_DIR/sdk/ --strip-components=1 --skip-old-files

# cd $THIS_DIR/sdk
./vulkansdk --maxjobs vulkan-headers vulkan-loader volk VulkanMemoryAllocator
# cp -R ./x86_64/* "$INSTALL_PREFIX/"

