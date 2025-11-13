variable "aws_region" {
description = "AWS region"
type = string
default = "ap-south-1"
}


variable "cluster_name" {
description = "EKS cluster name"
type = string
default = "devops-demo-cluster"
}


variable "aws_account_id" {
description = "AWS account ID"
type = string
}
