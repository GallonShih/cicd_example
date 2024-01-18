#!/bin/bash

IMAGE_NAME="gallonshih/python-base"
IMAGE_TAG="3.9.18"

# current: 0.0.1
version=$1

if [ "${version}" == "" ]; then
  echo "Error: Need a version parameter."
  exit 1
fi

docker_image="${IMAGE_NAME}:${IMAGE_TAG}-${version}"
echo "docker_image: ${docker_image}"

DOCKERFILE_DIR="."

# 尝试构建 Docker 映像并捕获可能的错误
if docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKERFILE_DIR}; then
    echo "Built Docker Image: ${IMAGE_NAME}:${IMAGE_TAG}"
else
    echo "Error: Docker build failed"
    exit 1
fi
