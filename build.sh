#!/usr/bin/env bash
set -e

docker run --name terraform -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
   --mount type=bind,source=$PWD/,target=/tmp \
   -d -t hashicorp/terraform:light init /tmp/eks/terraform
docker run --name terraform -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
   --mount type=bind,source=$PWD/,target=/tmp \
   -d -t hashicorp/terraform:light validate /tmp/eks/terraform
docker run --name terraform -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
    --mount type=bind,source=$PWD/,target=/tmp \
    -d -t hashicorp/terraform:light plan /tmp/eks/terraform
docker run --name terraform -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
    --mount type=bind,source=$PWD/,target=/tmp \
    -d -t hashicorp/terraform:light apply -auto-approve /tmp/eks/terraform