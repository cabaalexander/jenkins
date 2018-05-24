#!/bin/bash

VOLUME_PATH="$(pwd)/home"

[ ! -d "${VOLUME_PATH}" ] && mkdir -p ${VOLUME_PATH}

docker run \
  -p 8080:8080 \
  -p 50000:50000 \
  --name jenkins \
  -v ${VOLUME_PATH}:/var/jenkins_home \
  jenkins/jenkins:lts-alpine

