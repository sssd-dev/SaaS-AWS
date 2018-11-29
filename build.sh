#!/usr/bin/env bash
set -e

docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
   --mount type=bind,source=$PWD/,target=/tmp \
   -i -t hashicorp/terraform:light init /tmp/eks/terraform
docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
   --mount type=bind,source=$PWD/,target=/tmp \
   -i -t hashicorp/terraform:light validate /tmp/eks/terraform
docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
    --mount type=bind,source=$PWD/,target=/tmp \
    -i -t hashicorp/terraform:light plan /tmp/eks/terraform
docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
    --mount type=bind,source=$PWD/,target=/tmp \
    -i -t hashicorp/terraform:light apply -auto-approve /tmp/eks/terraform