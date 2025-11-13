#!/usr/bin/env bash
set -euo pipefail
AWS_REGION=${1:-ap-south-1}
ACCOUNT=${2:-<AWS_ACCOUNT_ID>}


echo "Logging into ECR for account ${ACCOUNT} in ${AWS_REGION}"
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com
