#!/usr/bin/env bash
set -euo pipefail
REGION=${1:-ap-south-1}
CLUSTER=${2:-devops-demo-cluster}


aws eks update-kubeconfig --region ${REGION} --name ${CLUSTER}
