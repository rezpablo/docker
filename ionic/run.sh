#!/bin/bash

docker run -it \
	--name ionic \
        --volumes-from projects \
        --link intellij:resthost \
        -p 8100:8100 \
        -p 35729:35729 \
	-p 3000:3000 \
	rezpablo/ionic
