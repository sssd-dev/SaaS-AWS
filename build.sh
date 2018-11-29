#!/usr/bin/env bash
set -e

cd $PWD/eks/

docker run --name terraform -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -i -t hashicorp/terraform:light validate
docker run --name terraform -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -i -t hashicorp/terraform:light plan
docker run --name terraform -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -i -t hashicorp/terraform:light apply -auto-approve