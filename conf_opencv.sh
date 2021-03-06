#!/bin/sh

if [ -z "$1" ]; then
  printf "OpenCV version, please\n"
  exit 1
fi

OPENCV_VERSION=$1
cmake -DCMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D CMAKE_SHARED_LINKER_FLAGS='-latomic' \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${OPENCV_VERSION}/modules \
    -D ENABLE_VFPV3=ON \
    -D ENABLE_NEON=ON \
    -D BUILD_TESTS=OFF \
    -D WITH_TBB=OFF \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_SKIP_PYTHON_LOADER=ON \
    -D OPENCV_PYTHON2_INSTALL_PATH=/usr/local/lib/python2.7/dist-packages \
    -D OPENCV_PYTHON3_INSTALL_PATH=/usr/local/lib/python3.7/dist-packages \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D BUILD_EXAMPLES=ON ..

