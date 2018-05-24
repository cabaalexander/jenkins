#!/bin/bash

. ~/bin/io.sh

DEFAULT_MESSAGE="SAVE"
DEFAULT_TAG="latest"

REPOSITORY="cabaalexander/jenkins"

read -p "Container ($(echo_red Required)): " CONTAINER
[ -z "${CONTAINER}" ] && die "You didn't pass the container :'/"

read -p "Message (${DEFAULT_MESSAGE}): " MESSAGE

read -p "Tag (${DEFAULT_TAG}): " TAG

docker commit \
  --author "Alexander Caba cabaalexander321@gmail.com" \
  --message "${MESSAGE:-${DEFAULT_MESSAGE}}" \
  ${CONTAINER} \
  ${REPOSITORY}:${TAG:-${DEFAULT_TAG}}

