#!/bin/bash
NS="default"
REPOSITORY=~/k8s-helm/

SERVICES=$1
USER=$3
TASK=$2

if [ -z "$USER" ];
  then
    USER="bondarenko"
    echo USER=$USER
    export KUBECONFIG=~/minikube/$USER/config
  else 
    echo USER=$USER
    export KUBECONFIG=~/minikube/$USER/config
fi

cd $REPOSITORY
echo $REPOSITORY

echo devserver/bin/deploy.sh $NS "$SERVICES" $USER $TASK run
devserver/bin/deploy.sh $NS "$SERVICES" $USER $TASK run
echo done
