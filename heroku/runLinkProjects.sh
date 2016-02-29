#!/bin/bash

docker  run -it --rm \
        --volumes-from projects \
	--name heroku \
        rezpablo/heroku bash	
