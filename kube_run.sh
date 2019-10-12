#!/bin/bash
NS="default"
REPOSITORY=~/k8s-helm/

SERVICES=$1
USER=$3
TASK=$2

if [ -z "$USER" ];
  then
    USER=$KUBEUSER
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
until [ $(kubectl get pods | grep -v STATUS | grep -v Running | wc -l) -eq 0 ];do sleep 15; done
echo $SERVICES running

