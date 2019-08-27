#!/bin/bash
POD=$1
USER=$2
HOME=echo whoami
LOGDIR="$HOME/logs"

function checkDir () { 
 cd $LOGDIR
 if [ $? -ne 0 ]
  then
    mkdir $LOGDIR
 fi
}

function copyFromMonolith () {
 manageDir
 kubectl cp default/$(kube_pods.sh $USER | grep $POD | awk '{print $1}'):/home/carprice/logs ~/logs/$POD/
}
function copyFromPod () {
 manageDir
 kubectl cp default/$(kube_pods.sh $USER | grep $POD | awk '{print $1}'):/home/carprice/source/storage/logs ~/logs/$POD/
}
function copyLogs () {
 if [ "$POD" = "monolith" ];
  then
   copyFromMonolith
  else
   copyFromPod
 fi
}
function manageDir() {
 local DIR="$LOGDIR/$POD"
 cd $DIT
 if [ $? -ne 0 ]
  then
   mkdir $DIR
   echo makedir
  else
   rm -r $DIR
   echo remove
 fi
}


if [ -z "$USER" ];
 then
    USER="bondarenko"
    echo USER=$USER
    checkDir
    copyLogs
 else
    echo USER=$USER
    checkDir
    copyLogs
fi

