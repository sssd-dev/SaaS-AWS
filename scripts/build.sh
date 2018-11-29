#!/usr/bin/env bash
set -e

cd /eks/terraform

/opt/terraform init

/opt/terraform validate

/opt/terraform plan

/opt/terraform apply -auto-approve