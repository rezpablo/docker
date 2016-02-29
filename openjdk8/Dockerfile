FROM rezpablo/debian_base
MAINTAINER Pablo Rezende Silva <rezpablo@gmail.com>

RUN echo "deb http://http.debian.net/debian/ jessie-backports main contrib non-free" >> /etc/apt/sources.list && \
    apt-get update

RUN apt-get install -y openjdk-8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

vOLUME /usr/lib/jvm/java-8-openjdk-amd64
