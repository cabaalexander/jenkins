#!/bin/bash

VOLUME_PATH="$(pwd)/home"
CONTAINER=$(docker ps -aq --filter "name=jenkins")
FLAG=$1

[ ! -d "${VOLUME_PATH}" ] && mkdir -p ${VOLUME_PATH}


if [ -n "${CONTAINER}" ]
then
  [ "${FLAG}" == "-f" ] && docker rm ${CONTAINER}

  docker start -i ${CONTAINER}
  exit 0
fi

docker run \
  -p 8080:8080 \
  -p 50000:50000 \
  --name jenkins \
  -v ${VOLUME_PATH}:/var/jenkins_home \
  jenkins/jenkins:lts-alpine

