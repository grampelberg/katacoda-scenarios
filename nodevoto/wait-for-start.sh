#!/bin/bash

echo "Starting Kubernetes, please wait ..."
while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
  printf "."
done

echo "Kubernetes Started"
