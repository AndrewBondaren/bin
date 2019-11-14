#!/bin/bash
#TODO
TASK=$1
REPOSITORY=$2
SERVICES=$3

cd $REPOSITORY/devserver/tasks

if [ $SERVICES == monolith ];
  then
    echo "monolith:" >> $TASK.yaml
    echo "   git_branch: \"$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICES == admin-documents-front ];
  then
    echo "admin_documents_front:" >> $TASK.yaml
    echo "  nginx_image: \"nexus.carprice.ru/admin-documents-front:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICES == bpm-docflow ];
  then
    echo "bpm_docflow:" >> $TASK.yaml
    echo "  fpm_image: \"nexus.carprice.ru/bpm-docflow/fpm:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICES == papi-dev ];
  then
    echo "papi_dev:" >> $TASK.yaml
    echo "  fpm_image: \"nexus.carprice.ru/papi/fpm:$TASK\"" >> $TASK.yaml
    echo "  nginx_image: \"nexus.carprice.ru/papi/nginx::$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi


