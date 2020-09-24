#!/bin/bash

docker build -t test .
docker build -t test:20.04 -f Dockerfile:20.04 .

# OpenCL is broken on a Dell Inc. XPS 13 7390 2-in-1/06CDVY Laptop (code named Ice Lake) 
docker run -it --rm --device /dev/dri:/dev/dri test clinfo
docker run -it --rm --device /dev/dri:/dev/dri test:20.04 clinfo

# OpenCL works when removing the conflicting Media SDK userspace driver library
docker run -it --rm --device /dev/dri:/dev/dri test rm /etc/ld.so.conf.d/intel-mediasdk.conf && clinfo
docker run -it --rm --device /dev/dri:/dev/dri test:20.04 rm /etc/ld.so.conf.d/intel-mediasdk.conf && clinfo
