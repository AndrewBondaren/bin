#!/bin/bash
POD=$1
USER=$2
LOGDIR="~/logs"

function checkDir () { 
 if [ -d "$LOGDIR" ];
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
 if [ ! -d "$DIR" ];
  then
   echo $DIR
   rm -r $DIR
  else
   echo $DIR
   mkdir $DIR
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

