FROM rezpablo/ubuntu_java8:latest 

MAINTAINER rezpablo@gmail.com

RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --force-yes ant libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 qemu-kvm kmod
RUN apt-get clean

RUN wget http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz -O /tmp/android-sdk_r24.3.4-linux.tgz -q
RUN mkdir -p /opt/android-sdk-linux && \
    tar -zxvf /tmp/android-sdk_r24.3.4-linux.tgz --strip-components=1 -C /opt/android-sdk-linux && \ 
    rm /tmp/android-sdk_r24.3.4-linux.tgz

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN echo ANDROID_HOME="${ANDROID_HOME}" >> /etc/environment

RUN echo y | android update sdk --filter platform-tools,build-tools-21.1.2,android-19,addon-google_apis_x86-google-19,extra-android-support,extra-android-m2repository,extra-google-m2repository,sys-img-x86-android-21 --no-ui --force
