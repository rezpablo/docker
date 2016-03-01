#!/bin/bash

sudo rm -R /opt/gradle
docker rm -f gradle

docker run -it -d\
        --volumes-from java8 \
        --restart=always \
        --name gradle \
        -e JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
        rezpablo/gradle

_OPT_GRADLE=$(docker inspect --format '{{ range .Mounts }}{{ if eq .Destination "/opt/gradle-2.10" }}{{ .Source }}{{ end }}{{ end }}' gradle)
sudo ln -s $_OPT_GRADLE /opt/gradle
