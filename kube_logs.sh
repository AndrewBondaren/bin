#!/bin/bash
POD=$1
USER=$2

if [ -z "$USER" ];
  then
    USER=$KUBEUSER
    echo USER=$USER
    export KUBECONFIG=~/minikube/$USER/config
  else
    echo USER=$USER
    export KUBECONFIG=~/minikube/$USER/config
fi

kubectl logs $(kube_pods.sh $USER | grep $POD | awk '{print $1}')

