module "vpc" {
  source = "../../modules/vpc"
  cidr   = "10.0.0.0/16"
}

module "eks" {
  source       = "../../modules/eks"
  cluster_name = "dev-eks"
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.public_subnets
}
