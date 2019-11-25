#!/bin/bash
NS="default"
REPOSITORY=$(echo $K8SREPOSITORY)
SERVICES=$1
TASK=$2
USER=$3

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
