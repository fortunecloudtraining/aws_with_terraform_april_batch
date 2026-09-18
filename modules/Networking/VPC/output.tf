# output "vpc_id" {
#   value = aws_vpc.main.id
# }

# output "vpc_cidr" {
#   value = aws_vpc.main.cidr_block
# }

# output "public_subnet_01_id" {
#   value = aws_subnet.public_subnet_01.id
# }

# output "private_subnet_01_id" {
#   value = aws_subnet.private_subnet_01.id
# }

# output "igw_id" {
#   value = aws_internet_gateway.fctp_igw.id
# }


output "vpc_id" {

  value = module.vpc.vpc_id
}

output "public_subnet_ids" {

  value = module.subnets.public_subnet_ids
}

output "private_subnet_ids" {

  value = module.subnets.private_subnet_ids
}

output "internet_gateway_id" {

  value = module.igw.igw_id
}

output "nat_gateway_ids" {

  value = module.nat.nat_gateway_ids
}

output "public_route_table_id" {

  value = module.route_tables.public_route_table_id
}

output "private_route_table_ids" {

  value = module.route_tables.private_route_table_ids
}

# output "alb_sg_id" {

#   value = module.security_groups.alb_sg_id
# }

# output "eks_cluster_sg_id" {

#   value = module.security_groups.eks_cluster_sg_id
# }

# output "eks_node_sg_id" {

#   value = module.security_groups.eks_node_sg_id
# }

# output "bastion_sg_id" {

#   value = module.security_groups.bastion_sg_id
# }