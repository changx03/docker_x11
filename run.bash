#!/bin/bash

docker buildx build -t ubuntu-2004-x11 --file ./basic.Dockerfile .

echo "DISPLAY=$DISPLAY"
echo "HOSTNAME=$HOSTNAME"
echo "XAUTHORITY=$XAUTHORITY"

docker run --rm -it \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --name x11-con \
    ubuntu-2004-x11
