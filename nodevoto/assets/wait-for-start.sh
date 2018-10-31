#!/bin/bash

echo "Waiting for Kubernetes"
while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
  printf "."
done

sleep 2
echo ""
echo "Kubernetes Started"
