#!/bin/bash

docker  run \
        --restart=always \
	--name postgres \
	-e POSTGRES_USER=mbsoxwpbqbjkbe \
	-e POSTGRES_PASSWORD=j5y9OTvuJsruG5Tfft-GgaelZv \
	-e POSTGRES_DB=daneudmnlqabnq \
	-p 5432:5432 \
	-d \
	rezpablo/postgres

# -e PGDATA=/myPgDataPath \


