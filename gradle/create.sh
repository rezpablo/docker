#!/bin/bash

sudo rm -R /opt/gradle
docker rm -f gradle

docker create -it \
        --volumes-from java8 \
        --name gradle \
        rezpablo/gradle

_OPT_GRADLE=$(docker inspect --format '{{ range .Mounts }}{{ if eq .Destination "/opt/gradle" }}{{ .Source }}{{ end }}{{ end }}' gradle)
sudo ln -s $_OPT_GRADLE /opt/gradle

# Gradle host enviroments variables
#export GRADLE_HOME=/opt/gradle
#export PATH=$PATH:$GRADLE_HOME/bin
#export GRADLE_OPTS="-Dorg.gradle.daemon=true"
#export GRADLE_OPTS="-Dorg.gradle.daemon=true, -Dorg.gradle.parallel=true"

#export GRADLE_USER_HOME=USER_HOME/.gradle
