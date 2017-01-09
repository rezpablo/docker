#!/bin/bash

docker build -t rezpablo/mssql-tools .
apt-get install -f dialog
