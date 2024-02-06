#!/bin/bash

IMAGE_INFO=$1
TEMPLATE_FILE=docker-compose.template.yaml
OUTPUT_FILE=docker-compose.yaml

sed "s|image: gallonshih/cicd_example.*|image: $IMAGE_INFO|g" $TEMPLATE_FILE > $OUTPUT_FILE

echo "Updated docker-compose.yaml:"
cat $OUTPUT_FILE
