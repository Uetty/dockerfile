#!/bin/bash

BASE_DIR=`cd $(dirname $0)/./; pwd`

ARCHIVE_PATH=${BASE_DIR}/../target/itest-e2e-1.0.0.jar
IMAGE_NAME=itest-cloud/e2e
ID=itest-cloud-e2e
DEFAULT_PORT=9091

VOLUMES_BASE_DIR=/var/log/app

# ---------------- 上面是根据不同程序进行修改的变量 -------------------
# 读取参数
PROFILE=
TYPE=
PORT=
EXT_OPT=
# option 表示不能跟参数，option: 表示必须跟参数，option:: 表示可选参数， ,作为多个参数名的分隔字符
# -o 是短选项，--long 是长选项
# 短选项传参：可用空格分隔开参数，或无空格直接紧跟参数，可选参数时必须无空格
# 长选项传参：可用空格或等号分隔开参数，可选参数时必须用等号
# 可选参数传参必须用等号，否则认为无参
params=$(getopt -o p:t:P:E: --long port:,type:,ext-opt:,profile: -- "$@")
echo $0 $params
eval set -- "$params"
while true; do
    case "$1" in
        -p|--port)
            PORT=$2
            shift 2
            ;;
        -t|--type)
            TYPE=$2
            shift 2
            ;;
        -P|--profile)
            PROFILE=$2
            shift 2
            ;;
        -E|--ext-opt)
            EXT_OPT=$2
            shift 2
            ;;
        --)
            shift
            break
            ;;
    esac
done

cd $BASE_DIR
if [[ `docker images|grep $IMAGE_NAME` == '' ]]; then
    cp $ARCHIVE_PATH $BASE_DIR/app.jar
    echo -e "\033[31mBUILD IMAGE $IMAGE_NAME \033[0m"
    docker build -t $IMAGE_NAME .
fi

NAME=$ID
if [[ $TYPE != 'master' ]]; then
    NAME=$NAME"-"$((`docker ps|grep $ID|wc -l` + 1))
else
    NAME=$NAME"-master"
fi

if [ ! -d $VOLUMES_BASE_DIR ]; then
    mkdir $VOLUMES_BASE_DIR
fi

if [ ! -d $VOLUMES_BASE_DIR/$NAME ]; then
    mkdir $VOLUMES_BASE_DIR/$NAME
fi

if [[ `docker ps|grep $NAME` == '' ]]; then
    if [[ `docker ps -a|grep $NAME` != '' ]]; then
        echo -e "\033[31m$NAME CONTAINER EXISTS, STARTUP CONTAINER\033[0m"
        docker start $NAME
        exit
    fi

    echo -e "\033[31mRUN IMAGE $IMAGE_NAME TO NAME $NAME\033[0m"


    DOCKER_OPT="-d"
    DOCKER_OPT="$DOCKER_OPT --env IMAGE_NAME=$IMAGE_NAME"
    if [[ $PROFILE != '' ]]; then
        DOCKER_OPT="$DOCKER_OPT --env PROFILE=$PROFILE"
    fi
    if [[ $EXT_OPT != '' ]]; then
        DOCKER_OPT="$DOCKER_OPT --env EXT_JAVA_OPT=$EXT_OPT"
    fi
    DOCKER_OPT="$DOCKER_OPT --name=$NAME"
    DOCKER_OPT="$DOCKER_OPT -v $VOLUMES_BASE_DIR/$NAME:/opt/app/logs"
    if [[ $PORT != '' ]]; then
        # 使用指定的端口
        DOCKER_OPT="$DOCKER_OPT -p $PORT:9090"
    else
        if [[ $TYPE == 'master' ]]; then
            # 使用默认的端口
            DOCKER_OPT="$DOCKER_OPT -p $DEFAULT_PORT:9090"
        else
            # 随机端口
            DOCKER_OPT="$DOCKER_OPT -p 9090"
        fi
    fi
    DOCKER_OPT="$DOCKER_OPT -it $IMAGE_NAME"
    docker run $DOCKER_OPT
    exit
fi

echo -e "\033[31m$NAME HAD STARTUP\033[0m"

