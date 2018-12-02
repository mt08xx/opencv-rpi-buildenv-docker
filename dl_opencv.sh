#!/bin/sh

if [ -z "$1" ]; then
  printf "OpenCV version, please\n"
  printf "ex) $0 4.0.0\n"
  exit 1
fi

OPENCV_VERSION=$1

wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip -O opencv-${OPENCV_VERSION}.zip
if [ ! $? ]; then
  rm opencv-${OPENCV_VERSION}.zip
  printf "Download error\n"
  exit 1
fi

wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip -O opencv_contrib-${OPENCV_VERSION}.zip

unzip opencv-${OPENCV_VERSION}.zip
unzip opencv_contrib-${OPENCV_VERSION}.zip
