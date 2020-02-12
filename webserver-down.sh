#!/bin/bash
. ./webserver-docker/.env
docker-compose -p $COMPOSE_PROJECT_NAME -f webserver-docker/docker-compose.yml down
