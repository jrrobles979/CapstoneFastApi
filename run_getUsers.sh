#!/usr/bin/env bash
PORT=8000
echo "Port: $PORT"
curl -X GET http://localhost:$PORT/api/v1/users -H 'accept: application/json'