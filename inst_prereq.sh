#!/bin/sh

# Everything else needs to be run as root
if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root. \n"
  exit 1
fi

#
apt-get update
apt-get install -y qemu-user-static binfmt-support
