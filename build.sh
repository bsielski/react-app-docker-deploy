#!/bin/bash
set -o errexit
APP_DIR=app
BUILD_DIR=build

. .env.repo-link
. ./build-docker/.env

echo "-------------------------------------"
echo "Script 'build.sh', step 1/3"
if [[ ! -d "./$APP_DIR" ]]
then
    echo "'$APP_DIR' directory doesn't exist."
    mkdir $APP_DIR
    echo "'$APP_DIR' directory created."
    git clone $REPO_LINK $APP_DIR
    echo "Repository cloned to $APP_DIR directory."
else
    echo "'$APP_DIR' directory exists."
    git -C $APP_DIR pull
    echo "Repository pulled."
fi

echo "-------------------------------------"
echo "Script 'build.sh', step 2/3"
if [[ ! -d "./$BUILD_DIR" ]]
then
    echo "'$BUILD_DIR' directory doesn't exist."
    mkdir $BUILD_DIR
    echo "'$BUILD_DIR' directory created."
fi
echo "Building..."
echo "pwd!!!!!!!!!!!!!!!!!!!"
pwd
CURRENT_USER="${CURRENT_USER}" DOCKERFILE="${DOCKERFILE}" docker-compose -p "${COMPOSE_PROJECT_NAME}" -f "./build-docker/docker-compose.yml" run build

echo "-------------------------------------"
echo "Script 'build.sh', step 3/3"
echo "Delete temporary stuff if you want to save a disk space."
docker system prune -a
