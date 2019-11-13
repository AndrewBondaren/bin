#!/bin/bash
#TODO
TASK=$1
REPOSITORY=$2

cd $REPOSITORY/devserver/tasks

rm $1.yaml
if [ $? -ne 0 ];
  then
    echo "old yaml file is deleted"
  else
    echo "new yaml file will be created"
fi


if [ $TASK="monolith" ];
  then
    echo "monolith:" >> $TASK.yaml
    echo "   git_branch: \"$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi


