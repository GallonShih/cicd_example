#!/bin/bash

IMAGE_NAME=$1
IMAGE_TAG=$2

if [ "${IMAGE_NAME}" == "" ]; then
  echo "Error: Need an image name."
  exit 1
fi

if [ "${IMAGE_TAG}" == "" ]; then
  echo "Error: Need an image tag."
  exit 1
fi

docker_image="${IMAGE_NAME}:${IMAGE_TAG}"
echo "docker_image: ${docker_image}"

# 检查映像是否存在
if docker image inspect ${docker_image} > /dev/null 2>&1; then
    echo "Image ${docker_image} already exists locally."
else
    echo "Image ${docker_image} does not exist. Attempting to pull..."
    if docker pull ${docker_image}; then
        echo "Pulled Docker Image: ${docker_image}"
    else
        echo "Error: Docker pull failed"
        exit 1
    fi
fi

docker run --rm --entrypoint=pytest ${docker_image} -vv
