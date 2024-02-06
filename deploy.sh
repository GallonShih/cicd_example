#!/bin/bash

IMAGE_INFO=$1
TEMPLATE_FILE=docker-compose.yaml
OUTPUT_FILE=docker-compose.yaml

sed "s|image: gallonshih/cicd_example.*|image: $IMAGE_INFO|g" $TEMPLATE_FILE > $OUTPUT_FILE

cat $OUTPUT_FILE
