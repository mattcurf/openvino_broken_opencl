FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
 
# Install a few minimal prerequisites 
RUN apt-get update && apt-get install -y --no-install-recommends \
      software-properties-common \
      ca-certificates \
      wget \
      cpio \
      gnupg-agent \
      lsb-release 

# Install OpenCL
RUN wget -qO - https://repositories.intel.com/graphics/intel-graphics.key | apt-key add - && \
echo "deb [arch=amd64] https://repositories.intel.com/graphics/ubuntu bionic main" > /etc/apt/sources.list.d/intel-graphics.list && \ 
   apt-get update && apt-get install -y --no-install-recommends \
      intel-opencl \
      clinfo

# Install OpenVino 2021.1
ARG DOWNLOAD_LINK=https://registrationcenter-download.intel.com/akdlm/irc_nas/17504/l_openvino_toolkit_p_2021.2.185.tgz
RUN mkdir -p /tmp/openvino_installer && cd /tmp/openvino_installer && \
    wget -c $DOWNLOAD_LINK && \
    tar xf l_openvino_toolkit*.tgz && \
    cd l_openvino_toolkit* && \
    sed -i 's/decline/accept/g' silent.cfg && \
    ./install.sh -s silent.cfg

