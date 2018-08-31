#!/bin/sh -xe

# This script starts docker

docker run --privileged --detach --tty --interactive --env "container=docker" \
       --volume /sys/fs/cgroup:/sys/fs/cgroup \
       --volume `pwd`:/coreclr:rw  \
       centos:centos7 \
       /usr/sbin/init

DOCKER_CONTAINER_ID=$(docker ps | grep centos | awk '{print $1}')
docker logs $DOCKER_CONTAINER_ID
docker exec --tty --interactive $DOCKER_CONTAINER_ID \
       /bin/bash -xec "bash -xe /coreclr/build.sh;
       echo -ne \"------\nEND CORECLR build\n\";"

docker ps -a
docker stop $DOCKER_CONTAINER_ID
docker rm -v $DOCKER_CONTAINER_ID

