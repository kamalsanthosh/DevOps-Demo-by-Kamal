module "vpc" {
source = "terraform-aws-modules/vpc/aws"
version = "~> 4.0"


name = "devops-demo-vpc"
cidr = "10.0.0.0/16"
azs = ["${var.aws_region}a", "${var.aws_region}b"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}


module "ecr" {
source = "terraform-aws-modules/ecr/aws"
version = "~> 2.0"


name = "devops-demo-app"
image_tag_mutability = "MUTABLE"
}


module "eks" {
source = "terraform-aws-modules/eks/aws"
version = "~> 19.0"


cluster_name = var.cluster_name
cluster_version = "1.27"
subnets = module.vpc.private_subnets
vpc_id = module.vpc.vpc_id


node_groups = {
ng1 = {
desired_capacity = 2
instance_types = ["t3.medium"]
}
}
}
provider "aws" {
  region = var.aws_region
}

# Create ECR repo
resource "aws_ecr_repository" "app" {
  name = "devops-demo-app"
  image_scanning_configuration { scan_on_push = true }
  image_tag_mutability = "MUTABLE"
}

# Create EKS cluster (using eks module recommended)
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 18.0.0"
  cluster_name = "devops-demo-cluster"
  cluster_version = "1.27"
  subnets = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
  node_groups = {
    ng1 = {
      desired_capacity = 2
      instance_types = ["t3.medium"]
    }
  }
}

# VPC via aws-vpc module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name = "devops-demo-vpc"
  cidr = "10.0.0.0/16"
  azs  = ["${var.aws_region}a","${var.aws_region}b"]
  private_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  public_subnets = ["10.0.3.0/24","10.0.4.0/24"]
}
