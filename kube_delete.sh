#!/bin/bash
POD=$1
USER=$2
if [ -z "$USER" ]
  then
    USER=$KUBEUSER
    echo USER=$USER
fi
if [ "$POD" = "" ]
  then
    echo "Empty pod!"
    exit 3
fi

export KUBECONFIG=$CONFREP/$USER/config
echo kubectl delete pod $POD --grace-period=0 --force --namespace default
kubectl delete pod $POD --grace-period=0 --force --namespace default
echo done
