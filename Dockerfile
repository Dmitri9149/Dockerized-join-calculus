FROM ubuntu:16.04
RUN ln -sf /bin/bash /bin/sh
WORKDIR /home/join/JoCaml_files
RUN apt-get update && \
    apt-get install -y apt-utils libpthread-stubs0-dev wget sudo && \
    wget http://jocaml.inria.fr/pub/distri/jocaml-4.01/jocaml-4.01.0.tar.gz && \
    tar -xf jocaml-4.01.0.tar.gz && \
    rm /home/join/JoCaml_files/jocaml-4.01.0.tar.gz && \
    apt-get autoremove --purge -y wget
WORKDIR /home/join/JoCaml_files/jocaml-4.01.0
RUN apt-get update && apt-get install build-essential -y && \
    gcc --version && \
    ./configure && \
    make world && \
    make bootstrap && \
    make opt && \
    make opt.opt && \
    umask 022 && \
    make install && \
    make clean

WORKDIR /home/join
RUN addgroup --system group
RUN adduser --disabled-password --system join  && \
    adduser join group
RUN chown --recursive join:group /home/join

USER join


CMD ["/bin/bash"]
