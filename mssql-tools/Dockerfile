FROM ubuntu:16.04

ENV ACCEPT_EULA=Y 

RUN apt-get update && apt-get install -y curl apt-transport-https

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list

RUN apt-get update && apt-get install -y mssql-tools

RUN apt-get install -y python

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8 && update-locale

RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

ENV SA_PASSWORD 'pablo@2017'
