#!/bin/bash

DOCKERHUB_USERNAME=$1
FULL_REPO_NAME=$2
IMAGE_TAG=$3

REPO_NAME=$(echo "${FULL_REPO_NAME}" | cut -d'/' -f2 | tr '[:upper:]' '[:lower:]')

if [ "${DOCKERHUB_USERNAME}" == "" ]; then
  echo "Error: Need a docker username."
  exit 1
fi

if [ "${REPO_NAME}" == "" ]; then
  echo "Error: Need a repository name."
  exit 1
fi

if [ "${IMAGE_TAG}" == "" ]; then
  echo "Error: Need a image tag."
  exit 1
fi

docker_image="${DOCKERHUB_USERNAME}/${REPO_NAME}:${IMAGE_TAG}"
echo "docker_image: ${docker_image}"

# 检查映像是否存在
if docker image inspect "${docker_image}" > /dev/null 2>&1; then
    echo "Image ${docker_image} already exists locally."
else
    echo "Image ${docker_image} does not exist. Attempting to pull..."
    if docker pull "${docker_image}"; then
        echo "Pulled Docker Image: ${docker_image}"
    else
        echo "Error: Docker pull failed"
        exit 1
    fi
fi

docker run --rm --entrypoint=pytest "${docker_image}" -vv
