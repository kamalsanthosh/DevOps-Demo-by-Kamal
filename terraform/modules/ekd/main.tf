module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.3"

  cluster_name = var.cluster_name
  vpc_id       = var.vpc_id
  subnet_ids   = var.subnets

  node_groups = {
    ng1 = {
      desired_capacity = 2
      instance_types   = ["t3.medium"]
    }
  }
}
