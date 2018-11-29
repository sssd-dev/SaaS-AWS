#!/usr/bin/env bash
set -e

cd /eks/terraform

terraform init

terraform validate

terraform plan

terraform apply -auto-approve