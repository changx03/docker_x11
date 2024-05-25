FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
    x11-apps \
    x11-xserver-utils \
    iproute2 \
    iputils-ping \
    net-tools \
    traceroute \
    && apt-get clean

# Set environment variables
ENV GDK_PIXBUF_DISABLE_MITSHM=1

CMD [ "/bin/bash" ]
