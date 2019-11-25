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

if [ $POD == services ];
  then
    kubectl logs -f  $(kube_pods.sh $USER | grep $POD | awk '{print $1}')
elif [ $POD == monolith ];
  then
   kubectl logs -f $(kube_pods.sh $USER | grep $POD | awk '{print $1}') -c php
  else
   kubectl logs -f $(kube_pods.sh $USER | grep $POD | awk '{print $1}') -c fpm
fi
