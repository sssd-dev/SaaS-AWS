#!/usr/bin/env bash
set -e

cd $PWD/eks/terraform

/opt/terraform init

/opt/terraform validate

/opt/terraform plan

/opt/terraform apply -auto-approve

aws --version

cluster_name=`terraform output clustername`

aws eks update-kubeconfig --name $cluster_name

kubectl get nodes

/opt/terraform destroy -auto-approve