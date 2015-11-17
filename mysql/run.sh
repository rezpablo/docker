#!/bin/bash

docker run -ti \
  	   --restart=always \
	   -d \
 	   --name mysql \
	   -e MYSQL_ROOT_PASSWORD=dbuser \
           -e MYSQL_USER=dbuser \
           -e MYSQL_PASSWORD=dbuser \
           -e MYSQL_DATABASE=bstok \
           -v `pwd`/datadir:/var/lib/mysql \
           mysql

