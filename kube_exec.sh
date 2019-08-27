#!/bin/bash
POD=$1
USER=$2
 
function exec () { 
 if [ "$POD" = "monolith" ]
  then
   kubectl exec -it $(kube_pods.sh $USER | grep $POD | awk '{print $1}') -c php -- bash
  else
   kubectl exec -it $(kube_pods.sh $USER | grep $POD | awk '{print $1}') -c fpm -- bash
 fi 
}

if [ -z "$USER" ];
  then
    USER=bondarenko
    echo USER=$USER
    exec
  else 
    echo USER=$USER
    export KUBECONFIG=~/minikube/$USER/config
    exec
fi



