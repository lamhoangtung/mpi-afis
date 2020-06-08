FROM ubuntu:18.04

RUN apt update && \
    apt install -y libomp-dev wget tar g++ gcc

RUN apt install -y make

RUN wget https://download.open-mpi.org/release/open-mpi/v1.8/openmpi-1.8.7.tar.gz && \
    tar -xvf openmpi-1.8.7.tar.gz && \
    cd openmpi-1.8.7 && \
    mkdir build && cd build && \
    ../configure && \
    make -j 4 all && \
    make install

COPY . /root/mpi-afis
RUN ldconfig && cd /root/mpi-afis && make

ENTRYPOINT [ "/bin/bash" ]
