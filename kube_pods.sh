#!/bin/bash
USER=$1
if [ -z "$USER" ]
  then
    USER="bondarenko"
    echo USER=$USER
fi

export KUBECONFIG=~/minikube/$USER/config
kubectl get pods
echo done
