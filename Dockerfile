#FROM balenalib/rpi-raspbian:stretch
FROM balenalib/rpi-raspbian:buster

ARG http_proxy
ENV http_proxy=${http_proxy:-"http://192.168.22.152:3142"}
RUN apt-get update && apt upgrade -y \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential cmake pkg-config \
    libjpeg-dev libtiff5-dev libpng-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev \
    libgtk2.0-dev libgtk-3-dev \
    libcanberra-gtk* \
    gfortran \
    python2.7-dev python3-dev \
    libavresample-dev libtesseract-dev libleptonica-dev \
    libgstreamer1.0-dev  libgstreamer-plugins-base1.0-dev libhdf5-dev \
    libatlas-base-dev liblapacke-dev \
    python3-numpy python-numpy libjasper-dev \
    wget unzip \
&& rm -rf /var/lib/apt/lists/*
