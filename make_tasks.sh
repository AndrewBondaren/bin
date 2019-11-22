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
if [ $SERVICES == admin-documents-front ];
  then
    echo "admin_documents_front:" >> $TASK.yaml
    echo "  nginx_image: \"nexus.carprice.ru/admin-documents-front:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICES == bpm-exchanger ];
  then
    echo "bpm_exchanger:" >> $TASK.yaml
    echo "  fpm_image: \"nexus.carprice.ru/bpm-exchanger/php:$TASK\"" >> $TASK.yaml
    echo "  nginx_image: \"nexus.carprice.ru/bpm-exchanger/nginx:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICES == bpm-docflow ];
  then
    echo "bpm-docflow:" >> $TASK.yaml
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
    echo "  nginx_image: \"nexus.carprice.ru/papi/nginx:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICES == services ];
  then
    echo "services:" >> $TASK.yaml
    echo "  image: \"nexus.carprice.ru/go/services:$TASK\"" >> $TASK.yaml
    echo "  yandex:" >> $TASK.yaml
    #TODO
    echo "    poll_worker_enabled: true" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICES == accounts ];
  then
    echo "accounts:" >> $TASK.yaml
    echo "  image: \"nexus.carprice.ru/go/accounts:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
