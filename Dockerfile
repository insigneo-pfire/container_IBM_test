# Dockerfile for the pFire software
#
# Insigneo Institute for in silico medicine
# University of sheffield, UK
# Author: Daniele Tartarini. d.tartarini@sheffield.ac.uk
#
# Run instructions:
#     docker run -ti  image:tag  bash
#
# Continuous integration
#
################################################################################

#### Choose base image #########################################################
FROM centos as dev_sysop_image


LABEL maintainer="Daniele Tartarini <d.tartarini@sheffield.ac.uk>"
LABEL description="Development and Continuous integration environment"

#### Update images #############################################################
RUN yum install -y epel-release && \
    yum upgrade -y

#### Install dependencies
RUN yum install -y   make gcc-gfortran gcc-c++ wget curl valgrind-devel \
boost-devel.x86_64  gcc  python3 wget vim cmake3  glibc-langpack-en \
git wget valgrind python2 diffutils bzip2 unzip blas

#openmpi-devel
#openmpi   petsc-openmpi-devel    hdf5-openmpi-devel



#### Environment variables #####################################################
ENV  OPENBLAS_NUM_THREADS=1  \
	 OPENBLAS_VERBOSE=0 \
	 PETSC_VERSION=3.10.5 \
	 HDF5_VERSION=1.10.5

ENV PATH=$PATH:/usr/lib64/openmpi/bin/
ENV CPATH=$CPATH:/usr/include/openmpi-x86_64/
ENV CPATH=$CPATH:/usr/include/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/openmpi/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/
