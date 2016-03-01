#!/bin/bash

echo "===>"
echo "Removendo containers, e links anteriores"  

#sudo update-alternatives --remove /usr/bin/java java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java 1071
sudo update-alternatives --remove-all java
sudo rm -R /opt/java_home
sudo rm -R /usr/lib/jvm/java-8-openjdk-amd64
docker rm -f java8


echo "==============>"
echo "Iniciando contaier jdk8"

docker create \
        -it \
        --name java8 \
        rezpablo/openjdk8

echo "============================>"
echo "Definindo Versao do JAVA"

DIR=$(docker inspect -f '{{ (index .Mounts 0).Source }}' java8)
sudo ln -s $DIR /opt/java_home
sudo ln -s $DIR /usr/lib/jvm/java-8-openjdk-amd64
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java 1071
#sudo  update-alternatives --config java

echo "=================================================>"
java -version
echo "JAVA_HOME: $JAVA_HOME"
