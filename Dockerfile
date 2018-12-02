FROM resin/rpi-raspbian:stretch
#RUN echo 'Acquire::http { Proxy "http://apt-cache-server.local:3142"; };' | tee  /etc/apt/apt.conf.d/01proxy
RUN apt-get update && apt-get install -y \
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
    wget unzip ccache byobu \
  &&  rm -rf /var/lib/apt/lists/*


