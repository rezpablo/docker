FROM rezpablo/debian_base
MAINTAINER Pablo Rezende Silva <rezpablo@gmail.com>

RUN apt-get install -y \
    wget \
    unzip

RUN cd /opt && \
    wget https://services.gradle.org/distributions/gradle-2.10-all.zip && \
    unzip gradle-2.10-all.zip && \
    mv gradle-2.10 gradle && \
    rm gradle-2.10-all.zip

ENV GRADLE_HOME=/opt/gradle
ENV PATH=$PATH:$GRADLE_HOME/bin

VOLUME /opt/gradle
