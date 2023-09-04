#!/bin/bash

export KUBECONFIG=./kubeconfig

kubectl config set-cluster kubernetes --server=https://$kubernetes_api_address:6443
