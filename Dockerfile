FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
 
# Install a few minimal prerequisites 
RUN apt-get update && apt-get install -y --no-install-recommends \
      software-properties-common \
      ca-certificates \
      wget \
      gnupg-agent \
      lsb-release 

# Install OpenCL
RUN echo "deb [trusted=yes arch=amd64] https://repositories.intel.com/graphics/ubuntu bionic main" > /etc/apt/sources.list.d/intel-graphics.list && \ 
   apt-get update && apt-get install -y --no-install-recommends \
      intel-opencl 

# Install OpenVino 2020.4
ARG DOWNLOAD_LINK=http://registrationcenter-download.intel.com/akdlm/irc_nas/16803/l_openvino_toolkit_p_2020.4.287.tgz
RUN mkdir -p /tmp/openvino_installer && cd /tmp/openvino_installer && \
    wget -c $DOWNLOAD_LINK && \
    tar xf l_openvino_toolkit*.tgz && \
    cd l_openvino_toolkit* && \
    sed -i 's/decline/accept/g' silent.cfg && \
    ./install.sh -s silent.cfg

