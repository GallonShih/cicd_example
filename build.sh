#!/bin/bash

IMAGE_NAME=$1
IMAGE_TAG=$2

if [ "${IMAGE_NAME}" == "" ]; then
  echo "Error: Need a image name."
  exit 1
fi

if [ "${IMAGE_TAG}" == "" ]; then
  echo "Error: Need a image tag."
  exit 1
fi

docker_image="${IMAGE_NAME}:${IMAGE_TAG}"
echo "docker_image: ${docker_image}"

DOCKERFILE_DIR="."

if docker build -t ${docker_image} ${DOCKERFILE_DIR}; then
    echo "Built Docker Image: ${docker_image}"
else
    echo "Error: Docker build failed"
    exit 1
fi

if docker push ${docker_image}; then
    echo "Push Docker Image: ${docker_image}"
else
    echo "Error: Docker push failed"
    exit 1
fi

echo "docker_image=${docker_image}" > image_info.txt
