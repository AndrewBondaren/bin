#!/bin/bash
USER=$1
if [ -z "$USER" ]
  then
    USER=$KUBEUSER
    echo USER=$USER
fi

export KUBECONFIG=$CONFREP/$USER/config
kubectl get pods
echo done
