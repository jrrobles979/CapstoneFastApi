#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub


# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=jrrobles/fastapiusers


# Step 2:  
# Authenticate & tag
#docker login --username $1 --password $2
echo "$2" | docker login --username $1 --password-stdin
docker tag fastapiusers $dockerpath
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath