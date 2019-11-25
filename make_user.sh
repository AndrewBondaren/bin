#!/bin/bash
USER=$1

cd $K8SREPOSITORY

if [ -z "$USER" ];
  then
     ./devserver/bin/make_user.sh $KUBEUSER "db domains custom"
  else
     ./devserver/bin/make_user.sh $USER "db domains custom"
fi
echo done
