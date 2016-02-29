#!/bin/bash

docker create -it \
          --name android_container \
          -v /opt/android-sdk-linux \
          rezpablo/android_dev
