# output "vpc_id" {
#   value = module.vpc_module.vpc_id
# }
# output "public_subnet_01_id" {
#     value = module.vpc_module.public_subnet_01_id
# }

# output "private_subnet_01_id" {
#     value = module.vpc_module.private_subnet_01_id
# }


# output "igw_id" {
#   value = module.vpc_module.igw_id
# }


output "vpc_id" {

  value = module.network.vpc_id
}

output "public_subnet_ids" {

  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {

  value = module.network.private_subnet_ids
}

output "nat_gateway_ids" {

  value = module.network.nat_gateway_ids
}

# output "eks_cluster_sg_id" {

#   value = module.network.eks_cluster_sg_id
# }

# output "eks_node_sg_id" {

#   value = module.network.eks_node_sg_id
# }