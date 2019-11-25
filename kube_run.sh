#!/bin/bash
NS="default"
REPOSITORY=$(echo $K8SREPOSITORY)
SERVICES=$1
TASK=$2
USER=$3

if [ -z "$1" ] || [ -z "$2" ]
  then
    echo 'No task or service!'
    exit 3
fi

if [ -z "$USER" ];
  then
    USER=$KUBEUSER
    echo USER=$USER
    export KUBECONFIG=$CONFREP/$USER/config
  else
    echo USER=$USER
    export KUBECONFIG=$CONFREP/$USER/config
fi


cd $REPOSITORY
echo $REPOSITORY

#TODO
if [ $TASK != empty ]
  then
   rm $REPOSITORY/devserver/tasks/$TASK.yaml
    if [ $? -ne 0 ];
      then
        echo "old yaml file is deleted"
    fi
     for svc in $SERVICES; do
       make_tasks.sh $TASK $REPOSITORY $svc
     done;
fi

echo devserver/bin/deploy.sh $NS "$SERVICES" $USER $TASK run
devserver/bin/deploy.sh $NS "$SERVICES" $USER $TASK run
until [ $(kubectl get pods | grep -v STATUS | grep -v Running | wc -l) -eq 0 ];do sleep 15; done
echo $SERVICES running
