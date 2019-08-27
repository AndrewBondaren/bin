#!/bin/bash
POD=$1
USER=$2
if [ -z "$USER" ]
  then
    USER=bondarenko
    echo USER=$USER
fi

export KUBECONFIG=~/minikube/$USER/config
echo kubectl delete pod $POD --grace-period=0 --force --namespace default
kubectl delete pod $POD --grace-period=0 --force --namespace default
echo done
