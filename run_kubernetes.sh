#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=jrrobles/fastapiusers

# Step 2
# Run the Docker Hub container with kubernetes
minikube kubectl -- create deployment fastapi-users --image=docker.io/jrrobles/fastapiusers

# Step 3:
# List kubernetes pods
minikube kubectl -- get pods

# Step 4:
# Forward the container port to a host
export POD_NAME=$(minikube kubectl -- get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo POD_NAME: $POD_NAME
minikube kubectl -- expose deployment/fastapi-users --type="NodePort" --port 80

#wait for 5m
echo 'waiting to pod status is running...'
sleep 300
minikube kubectl -- port-forward pod/$POD_NAME 80:80