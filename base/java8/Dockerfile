FROM rezpablo/ubuntu_dev

MAINTAINER rezpablo@gmail.com

RUN add-apt-repository ppa:webupd8team/java -Y
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer
 
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
