#!/bin/bash

docker create -it \
	-v /demo \
	--name projects \
	rezpablo/projects
