output "cluster_name" {
value = module.eks.cluster_id
}


output "kubeconfig" {
value = module.eks.kubeconfig
sensitive = true
}


output "ecr_repository_url" {
value = module.ecr.repository_url
}
