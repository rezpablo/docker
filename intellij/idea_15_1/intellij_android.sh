#!/bin/bash

docker run -it --rm \
          -e DISPLAY=$DISPLAY \
          -v /tmp/.X11-unix:/tmp/.X11-unix \
          --volumes-from android_container \
          -e ANDROID_HOME=/opt/android-sdk-linux \
          -e PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools \
          -v `pwd`:/workspace \
          rezpablo/intellij:15.1