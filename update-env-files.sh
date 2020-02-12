#!/bin/bash

set -o errexit
. env-constants

printf "REPO_LINK=${REPO_LINK}\n" > .env.repo-link

printf "COMPOSE_PROJECT_NAME=${BUILD_COMPOSE_PROJECT_NAME}
DOCKERFILE=${DOCKERFILE}
CURRENT_USER=${CURRENT_USER}\n" > build-docker/.env

printf "REACT_APP_API_HOST=${REACT_APP_API_HOST}\n" > build-docker/.env.app

printf "COMPOSE_PROJECT_NAME=${WEBSERVER_COMPOSE_PROJECT_NAME}\n" > webserver-docker/.env

printf "VIRTUAL_HOST=${VIRTUAL_HOST}\n" > webserver-docker/.env.webserver
