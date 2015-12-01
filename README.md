# Docker

### Structure Imagens

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

(https://hub.docker.com/_/debian/)
  rezpablo
  |---- debian_base

(https://hub.docker.com/_/mysql/)
  rezpablo
  |---- mysql

```

### Content Imagens


|                  | ubuntu_base | ubuntu_dev     | ubuntu_java7   | ubuntu_java8   | intellij:15.1              |
|:-----------------| :---------- |:--------------:| --------------:| --------------:| --------------------------:|
| *ubuntu_base*    | vim         | vim            | vim            | vim            | vim                        |
|                  | zip unzip   | zip unzip      | zip unzip      | zip unzip      | zip unzip                  |
|                  | wget        | wget           | wget           | wget           | wget                       |
|                  | curl        | curl           | curl           | curl           | curl                       |
| *ubuntu_dev*     |             | git            | git            | git            | git                        |
|                  |             | nodejs npm     | nodejs npm     | nodejs npm     | nodejs npm                 |
|                  |             | yo bower grunt | yo bower grunt | yo bower grunt | yo bower grunt             |
|                  |             | gradle-2.5     | gradle-2.5     | gradle-2.5     | gradle-2.5                 |
| *oracle-java7*   |             |                | oracle-java7   |                |                            |
| *oracle-java8*   |             |                |                | oracle-java8   | oracle-java8               |
| *intellij:15.1*  |             |                |                |                | software-properties-common |
|                  |             |                |                |                | libxext-dev libxrender-dev |
|                  |             |                |                |                | libxtst-dev libgtk2.0-0    |
|                  |             |                |                |                | libcanberra-gtk-module     |
|                  |             |                |                |                | ideaIU-15.0.1              |


### Pull Imagens

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

### Run Containers
Intellij IDEA
``` shellscript
docker run -ti --rm \
          -e DISPLAY=$DISPLAY \
          -v /tmp/.X11-unix:/tmp/.X11-unix \
          -v `pwd`:/workspace \
          rezpablo/intellij:15.1
```

MYSQL - Host database
``` shellscript
docker run -ti \
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
docker run -ti \
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
