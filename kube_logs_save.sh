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
   rm ~/$POD.log
   echo $(kubectl logs $(kube_pods.sh $USER | grep $POD | awk '{print $1}')) >> ~/$POD.log
   echo ~/$POD.log
elif [ $POD == monolith ];
  then
   rm ~/$POD.log
   echo $(kubectl logs $(kube_pods.sh $USER | grep $POD | awk '{print $1}') -c php) >> ~/$POD.log
   echo ~/$POD.log
  else
   rm ~/$POD.log
   echo $(kubectl logs $(kube_pods.sh $USER | grep $POD | awk '{print $1}') -c fpm) >> ~/$POD.log
   echo ~/$POD.log
fi
