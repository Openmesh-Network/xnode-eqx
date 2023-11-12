#!/bin/bash

export KUBECONFIG=./kubeconfig

attempts=0
rollout_status_cmd=$command
until $rollout_status_cmd || [ $attempts -gt 60 ]; do
  $rollout_status_cmd
  attempts=$((attempts + 1))
  sleep 10
done
