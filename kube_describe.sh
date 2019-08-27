#!/bin/bash
PODID=$1
USER=$2
if [ -z "$USER" ]
  then
    USER=bondarenko
    echo USER=$USER
fi
if [ "$PODID" = "" ]
  then
    echo "Empty pod!"
    exit 1
fi



export KUBECONFIG=~/minikube/$USER/config
kubectl describe pods "$PODID"
echo done

