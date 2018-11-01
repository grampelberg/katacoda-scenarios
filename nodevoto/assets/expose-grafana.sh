#!/bin/bash

kubectl -n linkerd patch deploy grafana --patch "$(cat fix-grafana.yml)"
kubectl -n linkerd rollout status deploy/grafana
kubectl -n linkerd port-forward svc/grafana 9092:3000 >/dev/null &
