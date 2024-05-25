FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -qq -y \
    x11-apps \
    x11-xserver-utils \
    iproute2 \
    iputils-ping \
    net-tools \
    traceroute \
    && apt-get clean

CMD [ "/bin/bash" ]
