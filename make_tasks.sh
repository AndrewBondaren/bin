#!/bin/bash
#It's horrible, I know.
#But it just works.
TASK=$1
REPOSITORY=$2
SERVICE=$3

cd $REPOSITORY/devserver/tasks

if [ $SERVICE == monolith ];
  then
    echo "monolith:" >> $TASK.yaml
    echo "   git_branch: \"$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICE == admin-documents-front ];
  then
    echo "admin_documents_front:" >> $TASK.yaml
    echo "  nginx_image: \"nexus.carprice.ru/$SERVICE:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICE == bpm-exchanger ];
  then
    echo "bpm_exchanger:" >> $TASK.yaml
    echo "  fpm_image: \"nexus.carprice.ru/$SERVICE/php:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICE == bpm-docflow ];
  then
    echo "bpm-docflow:" >> $TASK.yaml
    echo "  fpm_image: \"nexus.carprice.ru/$SERVICE/fpm:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICE == papi-dev ];
  then
    echo "papi_dev:" >> $TASK.yaml
    echo "  fpm_image: \"nexus.carprice.ru/papi/fpm:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICE == services ];
  then
    function pollworker() {
        echo "  yandex:" >> $TASK.yaml
        echo "    poll_worker_enabled: true" >> $TASK.yaml
    }
    echo "services:" >> $TASK.yaml
    echo "  image: \"nexus.carprice.ru/go/$SERVICE:$TASK\"" >> $TASK.yaml
    read -p "Do you wish yandex poll_worker to be enabled? yn" yn
    case $yn in
        [Yy]* ) pollworker; break;;
        * ) echo "poll_worker is disabled!";;
    esac
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICE == accounts ];
  then
    echo "accounts:" >> $TASK.yaml
    echo "  image: \"nexus.carprice.ru/go/accounts:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICE == waystatus ];
  then
    echo "waystatus:" >> $TASK.yaml
    echo "  fpm_image: \"nexus.carprice.ru/waystatus/fpm:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICE == client-api ];
  then
    echo "client_api:" >> $TASK.yaml
    echo "  fpm_image: \"nexus.carprice.ru/client-api/fpm:$TASK\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
if [ $SERVICE == core-api ];
  then
    echo "core_api:" >> $TASK.yaml
    echo "  fpm_image: \"nexus.carprice.ru/core-api/php-fpm:$TASK\"" >> $TASK.yaml
    echo "  cron_image: \"nexus.carprice.ru/core-api/php-cron:$TASK\"" >> $TASK.yaml
    echo "  nginx_image: \"nexus.carprice.ru/nginx:1.16.0\"" >> $TASK.yaml
    echo "  redis_image: \"nexus.carprice.ru/redis:redis4\"" >> $TASK.yaml
    echo ""
    echo $TASK.yaml
    cat $TASK.yaml
    echo ""
fi
