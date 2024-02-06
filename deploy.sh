#!/bin/bash

IMAGE_INFO=$1
EC2_USER=$2
EC2_HOST=$3
TEMPLATE_FILE=docker-compose.template.yaml
OUTPUT_FILE=docker-compose.yaml

sed "s|image: gallonshih/cicd_example.*|image: $IMAGE_INFO|g" $TEMPLATE_FILE > $OUTPUT_FILE.tmp
sed "s|- IMAGE=gallonshih/cicd_example.*|- IMAGE=$IMAGE_INFO|g" $OUTPUT_FILE.tmp > $OUTPUT_FILE
rm $OUTPUT_FILE.tmp

echo "Updated docker-compose.yaml:"
cat $OUTPUT_FILE

# SSH to EC2, execute docker-compose down
if ! ssh -o StrictHostKeyChecking=no $EC2_USER@$EC2_HOST "docker-compose -f docker-compose.yaml down"; then
    echo "Failed to execute docker-compose down. Exiting."
    exit 1
fi

# Copy docker-compose.yaml to EC2
if ! scp -o StrictHostKeyChecking=no $OUTPUT_FILE $EC2_USER@$EC2_HOST:docker-compose.yaml; then
    echo "Failed to copy docker-compose.yaml to EC2. Exiting."
    exit 1
fi

# SSH to EC2, execute docker-compose up -d
if ! ssh -o StrictHostKeyChecking=no $EC2_USER@$EC2_HOST "docker-compose -f docker-compose.yaml up -d"; then
    echo "Failed to execute docker-compose up -d. Exiting."
    exit 1
fi
