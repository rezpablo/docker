#!/bin/bash

docker run -ti --rm \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/pablo/rezpablo@gmail.com/scripts:/scripts \
	-e DISPLAY=unix$DISPLAY \
	--privileged \
	--name dbeaver \
    rezpablo/dbeaver

