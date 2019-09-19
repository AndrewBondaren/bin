#!/bin/bash
POD=$1
USER=$2
if [ -z "$USER" ]
  then
    USER=bondarenko
    echo USER=$USER
fi
if [ "$POD" = "" ]
  then
    echo "Empty pod!"
    exit 1
fi

export KUBECONFIG=~/minikube/$USER/config
kubectl describe pods $(kube_pods.sh $USER | grep $POD | awk '{print $1}')
echo done

