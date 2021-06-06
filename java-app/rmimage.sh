#!/bin/bash

BASE_DIR=`cd $(dirname $0)/./; pwd`
IMAGE_NAME=itest-cloud/e2e
ID=itest-cloud-e2e


CONTAINERS=`docker ps|grep ${IMAGE_NAME}|awk '{print $NF}'|xargs`
if [[ ${CONTAINERS} != '' ]]; then
    docker stop ${CONTAINERS}
fi

CONTAINERS=`docker ps -a|grep ${IMAGE_NAME}|awk '{print $NF}'|xargs`
if [[ ${CONTAINERS} != '' ]]; then
    docker rm ${CONTAINERS}
fi

docker rmi ${IMAGE_NAME}

