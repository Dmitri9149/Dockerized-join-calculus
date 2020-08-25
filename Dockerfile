FROM ubuntu:16.04
RUN ln -sf /bin/bash /bin/sh
RUN useradd -ms /bin/bash  join
WORKDIR /home/join/JoCaml
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get update && apt-get install -y libpthread-stubs0-dev
RUN apt-get update && apt-get install -y wget
RUN wget http://jocaml.inria.fr/pub/distri/jocaml-4.01/jocaml-4.01.0.tar.gz
RUN mkdir ./JoCaml_files && tar -xf jocaml-4.01.0.tar.gz -C ./JoCaml_files

