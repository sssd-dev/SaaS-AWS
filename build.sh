#!/usr/bin/env bash
set -e

cd $PWD/eks/terraform

echo $PWD

docker run --name terraform -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -i -t hashicorp/terraform:light validate $PWD
docker run --name terraform -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -i -t hashicorp/terraform:light plan $PWD
docker run --name terraform -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -i -t hashicorp/terraform:light apply -auto-approve $PWD