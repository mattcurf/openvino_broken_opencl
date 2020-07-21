FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
 
# Install a few minimal prerequisites 
RUN apt-get update && apt-get install -y --no-install-recommends \
      software-properties-common \
      wget \
      cpio \
      lsb-release && \
    add-apt-repository ppa:intel-opencl/intel-opencl && apt-get update && \
    apt-get install -y --no-install-recommends intel-opencl-icd clinfo 
 
# Install OpenVino 2020.4
ARG DOWNLOAD_LINK=http://registrationcenter-download.intel.com/akdlm/irc_nas/16803/l_openvino_toolkit_p_2020.4.287.tgz
RUN mkdir -p /tmp/openvino_installer && cd /tmp/openvino_installer && \
    wget -c $DOWNLOAD_LINK && \
    tar xf l_openvino_toolkit*.tgz && \
    cd l_openvino_toolkit* && \
    sed -i 's/decline/accept/g' silent.cfg && \
    ./install.sh -s silent.cfg
