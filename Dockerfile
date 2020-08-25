FROM ubuntu:16.04
RUN ln -sf /bin/bash /bin/sh
RUN useradd -ms /bin/bash  join
WORKDIR /home/join
RUN mkdir JoCaml
COPY jocaml-4.01.0.tar.gz ./JoCaml
