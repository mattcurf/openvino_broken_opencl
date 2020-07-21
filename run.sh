#!/bin/bash

docker build -t test .

# OpenCL is broken on Intel(R) 10th Generation Core i5 (code named Ice Lake) 
docker run -it --rm --device /dev/dri:/dev/dri test clinfo

# OpenCL works when removing the conflicting Media SDK userspace driver library
docker run -it --rm --device /dev/dri:/dev/dri test rm /etc/ld.so.conf.d/intel-mediasdk.conf && clinfo
