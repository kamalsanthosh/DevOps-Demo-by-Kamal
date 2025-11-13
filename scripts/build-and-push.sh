#!/usr/bin/env bash
set -euo pipefail
AWS_REGION=${1:-ap-south-1}
ACCOUNT=${2:-<AWS_ACCOUNT_ID>}
TAG=${3:-latest}
REPO=${ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/devops-demo-app


./scripts/ecr-login.sh ${AWS_REGION} ${ACCOUNT}


docker build -t devops-demo-app:${TAG} ./app/service


docker tag devops-demo-app:${TAG} ${REPO}:${TAG}


docker push ${REPO}:${TAG}
