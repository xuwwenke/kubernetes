#!/bin/bash

set -ex

docker build --network=host -t docker-registry:81/cube-studio/mlflow:20260126 -f Dockerfile .
docker push docker-registry:81/cube-studio/mlflow:20260126