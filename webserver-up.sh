#!/bin/bash
set -o errexit
BUILD_DIR=build
. ./webserver-docker/.env

if [[ ! -d "./$BUILD_DIR" ]]
then
    echo "'$BUILD_DIR' directory doesn't exist."
    mkdir $BUILD_DIR
    echo "'$BUILD_DIR' directory created."
fi

docker-compose -p $COMPOSE_PROJECT_NAME -f webserver-docker/docker-compose.yml up -d
