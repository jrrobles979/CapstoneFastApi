#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=jrrobles/apiusers

# Step 2
# Run the Docker Hub container with kubernetes
minikube kubectl -- create deployment api-users --image=docker.io/jrrobles/apiusers

# Step 3:
# List kubernetes pods
minikube kubectl -- get pods

# Step 4:
# Forward the container port to a host
export POD_NAME=$(minikube kubectl -- get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo POD_NAME: $POD_NAME
minikube kubectl -- expose deployment/api-users --type="NodePort" --port 8000

#wait for 5m
sleep 300
minikube kubectl -- port-forward pod/$POD_NAME 8000:8000