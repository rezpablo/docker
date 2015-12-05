# Docker

### Structure Images

```
(https://hub.docker.com/_/ubuntu/)
  rezpablo
  |---- ubuntu_base
      |
      |---- ubuntu_dev
          |
          |---- ubuntu_java7
          |---- ubuntu_java8
              |
              |---- intellij:15.1
              |---- android_dev

(https://hub.docker.com/_/debian/)
  rezpablo
  |---- debian_base

(https://hub.docker.com/_/mysql/)
  rezpablo
  |---- mysql

```

### Content Imagens


|                  | ubuntu_base | ubuntu_dev     | ubuntu_java7   | ubuntu_java8   | intellij:15.1              | android_dev            |
|:-----------------| :---------- |:--------------:| --------------:| --------------:| --------------------------:|-----------------------:|
| *ubuntu_base*    | vim         | vim            | vim            | vim            | vim                        | vim                    |
|                  | zip unzip   | zip unzip      | zip unzip      | zip unzip      | zip unzip                  | zip unzip              |
|                  | wget        | wget           | wget           | wget           | wget                       | wget                   |
|                  | curl        | curl           | curl           | curl           | curl                       | curl                   |
| *ubuntu_dev*     |             | git            | git            | git            | git                        | git                    |
|                  |             | nodejs npm     | nodejs npm     | nodejs npm     | nodejs npm                 | nodejs npm             |
|                  |             | yo bower grunt | yo bower grunt | yo bower grunt | yo bower grunt             | yo bower grunt         |
|                  |             | gradle-2.5     | gradle-2.5     | gradle-2.5     | gradle-2.5                 | gradle-2.5             |
| *oracle-java7*   |             |                | oracle-java7   |                |                            |                        |
| *oracle-java8*   |             |                |                | oracle-java8   | oracle-java8               | oracle-java8           |
| *intellij:15.1*  |             |                |                |                | software-properties-common |                        |
| *android_dev*    |             |                |                |                | libxext-dev libxrender-dev | android-sdk_r24.3.4    |
|                  |             |                |                |                | libxtst-dev libgtk2.0-0    | architecture i386      |
|                  |             |                |                |                | libcanberra-gtk-module     | ant libc6-i386         |
|                  |             |                |                |                | ideaIU-15.0.1              | lib32stdc++6 lib32gcc1 |
|                  |             |                |                |                |                            | lib32ncurses5 lib32z1  |
|                  |             |                |                |                |                            | qemu-kvm kmod          |


### Pull Images

[Docker-Hub rezpablo repository](https://hub.docker.com/u/rezpablo/)

``` shellscript
docker pull rezpablo/ubuntu_base
```

``` shellscript
docker pull rezpablo/ubuntu_dev
```

``` shellscript
docker pull rezpablo/ubuntu_java7
```

``` shellscript
docker pull rezpablo/ubuntu_java8
```

``` shellscript
docker pull debian_base
```

``` shellscript
docker pull rezpablo/intellij:15.1
```

``` shellscript
docker pull rezpablo/mysql
```

``` shellscript
docker pull rezpablo/android_dev
```

### Run Containers
Intellij IDEA
``` shellscript
docker run -it --rm \
          -e DISPLAY=$DISPLAY \
          -v /tmp/.X11-unix:/tmp/.X11-unix \
          -v `pwd`:/workspace \
          rezpablo/intellij:15.1
```

MYSQL - Host database
``` shellscript
docker run -it \
          --restart=always \
          -d \
          --name mysql \
          -e MYSQL_ROOT_PASSWORD=dbuser \
          -e MYSQL_USER=dbuser \
          -e MYSQL_PASSWORD=dbuser \
          -e MYSQL_DATABASE=databasename \
          -v `pwd`/datadir:/var/lib/mysql \
          -p 3306:3306 \
          rezpablo/mysql

```

MYSQL - Container database
``` shellscript
docker run -it \
          --restart=always \
          -d \
          --name mysql \
          -e MYSQL_ROOT_PASSWORD=dbuser \
          -e MYSQL_USER=dbuser \
          -e MYSQL_PASSWORD=dbuser \
          -e MYSQL_DATABASE=databasename \
          -p 3306:3306 \
          rezpablo/mysql
```

ADROID - writeable container (never started) - You can then use the `$ docker start android_container` to run container
``` shellscript
docker create -it \
          --name android_container \
          -v /opt/android-sdk-linux \
          rezpablo/android_dev
```

ADROID - runnable container
``` shellscript
docker run -it \
          --name android_container \
          -v /opt/android-sdk-linux \
          rezpablo/android_dev
```

HOW TO use android enviroments on Intellij container
``` shellscript
docker run -it --rm \
          -e DISPLAY=$DISPLAY \
          -v /tmp/.X11-unix:/tmp/.X11-unix \
          --volumes-from android_container \
          -e ANDROID_HOME=/opt/android-sdk-linux \
          -e PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools \
          -v `pwd`:/workspace \
          rezpablo/intellij:15.1
```
