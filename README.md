# openvino_broken_opencl

When using a Dell Inc. XPS 13 7390 2-in-1/06CDVY Laptop, BIOS 1.0.13 09/17/2019, the OpenVino 2020.4 installs a media SDK /opt/intel/mediasdk/lib64/libigdgmm.so.11 library.  This library version breaks OpenCL NEO from working correctly.

When running 'clinfo', it reports 'Number of platforms 0' with the conflicting library.  With the workaround in place, 'clinfo' correctly displays the capabilities of the OpenCL NEO GPU.

See 'run.sh' for the steps to reproduce this defect, and the workaround to restore OpenCL operation
