#!/bin/bash

docker run /
	--restart=always /
        -d /
        --name mysql /
        -e MYSQL_ROOT_PASSWORD=dbuser /
        -e MYSQL_USER=dbuser /
        -e MYSQL_PASSWORD=dbuser /
        -e MYSQL_DATABASE=databasename /
        rezpablo/mysql
