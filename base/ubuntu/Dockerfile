FROM ubuntu:14.04

MAINTAINER rezpablo@gmail.com

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update && apt-get install -y software-properties-common

RUN apt-get install -y vim zip unzip wget curl
