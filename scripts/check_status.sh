#!/bin/bash

export KUBECONFIG=./kubeconfig

ATTEMPTS=0
ROLLOUT_STATUS_CMD=$command
until $ROLLOUT_STATUS_CMD || [ $ATTEMPTS -gt 60 ]; do
  $ROLLOUT_STATUS_CMD
  ATTEMPTS=$((attempts + 1))
  sleep 10
done
