#!/bin/sh -xe

# This script starts docker
ROOT=$(pwd)
DOCKER_ARGS="run -i --rm -v ${ROOT}:/mnt/coreclr -w /mnt/coreclr  microsoft/dotnet-buildtools-prereqs:centos-7-b46d863-20180719033416"
docker ${DOCKER_ARGS} /mnt/coreclr/build.sh
docker ${DOCKER_ARGS} /mnt/coreclr/build-test.sh
