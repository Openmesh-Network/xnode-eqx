#!/bin/bash

export KUBECONFIG=./kubeconfig

kubectl config set-cluster kubernetes --server=https://$kubernetes_api_address:6443

ATTEMPTS=0
ROLLOUT_STATUS_CMD=$command
until $ROLLOUT_STATUS_CMD || [ $ATTEMPTS -eq 60 ]; do
  $ROLLOUT_STATUS_CMD
  ATTEMPTS=$((attempts + 1))
  sleep 10
done
