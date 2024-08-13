#!/bin/sh
echo "${DOCKERHUB_TOKEN}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
