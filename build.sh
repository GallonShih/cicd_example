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

DOCKERFILE_DIR="."

if docker build -t "${docker_image}" "${DOCKERFILE_DIR}"; then
    echo "Built Docker Image: ${docker_image}"
else
    echo "Error: Docker build failed"
    exit 1
fi

if docker push "${docker_image}"; then
    echo "Push Docker Image: ${docker_image}"
else
    echo "Error: Docker push failed"
    exit 1
fi

echo "docker_image=${docker_image}" > image_info.txt
