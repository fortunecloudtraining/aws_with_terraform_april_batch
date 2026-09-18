# resource "aws_vpc" "main" {
#   cidr_block       = var.vpc_cidr
#   enable_dns_hostnames = var.enable_dns_hostnames
#   enable_dns_support = var.enable_dns_support
#   tags = {
#     Name = var.vpc_name
#     Environment = var.Environment
#   }
# }



# resource "aws_subnet" "public_subnet_01" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.public_subnet_01_cidr
#   availability_zone = var.subnet_availability_zone_01
#   map_public_ip_on_launch = true

#   tags = {
#     Name = var.public_subnet_01_name
#   }
# }

# resource "aws_subnet" "public_subnet_02" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.public_subnet_cidr_02
#   availability_zone = var.subnet_availability_zone_02
#   map_public_ip_on_launch = true

#   tags = {
#     Name = var.public_subnet_02_name
#   }
# }


# resource "aws_subnet" "public_subnet_03" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.public_subnet_cidr_03
#   availability_zone = var.subnet_availability_zone_03
#   map_public_ip_on_launch = true

#   tags = {
#     Name = var.public_subnet_03_name
#   }
# }
# resource "aws_subnet" "private_subnet_01" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.private_subnet_01_cidr

#   tags = {
#     Name = var.private_subnet_01_name
#   }
# }

# resource "aws_subnet" "private_subnet_02" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.private_subnet_cidr_02
#   availability_zone = var.subnet_availability_zone_02


#   tags = {
#     Name = var.private_subnet_02_name
#   }
# }


# resource "aws_subnet" "private_subnet_03" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.private_subnet_cidr_03
#   availability_zone = var.subnet_availability_zone_03
  

#   tags = {
#     Name = var.private_subnet_03_name
#   }
# }



# resource "aws_internet_gateway" "fctp_igw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = var.igw_name
#   }
# }

# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.fctp_igw.id
#   }


#   tags = {
#     Name = var.public_rt_name
#   }
# }

# resource "aws_route_table_association" "public_rt" {
#   for_each = {
#     public_subnet_01 = aws_subnet.public_subnet_01.id
#     public_subnet_02 = aws_subnet.public_subnet_02.id
#     public_subnet_03 = aws_subnet.public_subnet_03.id
#   }

#   subnet_id      = each.value
#   route_table_id = aws_route_table.public_rt.id
# }
# resource "aws_eip" "lb" {
#   domain   = "vpc"
# }


# resource "aws_nat_gateway" "fctp_nat" {
#   allocation_id = aws_eip.lb.id
#   subnet_id     = aws_subnet.public_subnet_01.id

#   tags = {
#     Name = "fctp-nat-tf"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.fctp_igw]
# }

# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.fctp_nat.id
#   }


#   tags = {
#     Name = var.private_rt_name
#   }
# }

# resource "aws_route_table_association" "private_rt" {
#    for_each = {
#     private_subnet_01 = aws_subnet.private_subnet_01.id
#     private_subnet_02 = aws_subnet.private_subnet_02.id
#     private_subnet_03 = aws_subnet.private_subnet_03.id
#   }

#   subnet_id      = each.value
#   route_table_id = aws_route_table.private_rt.id
# }


locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = var.managed_by
  }
}

module "vpc" {

  source = "./vpc"

  vpc_cidr = var.vpc_cidr

  environment = var.environment

  common_tags = local.common_tags
}

module "igw" {

  source = "./igw"

  vpc_id = module.vpc.vpc_id

  environment = var.environment

  common_tags = local.common_tags
}

module "subnets" {

  source = "./subnets"

  vpc_id = module.vpc.vpc_id

  environment = var.environment

  cluster_name = var.cluster_name

  availability_zones = var.availability_zones

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets

  common_tags = local.common_tags
}

module "nat" {

  source = "./nat"

  environment = var.environment

  igw_id = module.igw.igw_id

  public_subnet_ids = module.subnets.public_subnet_ids

  common_tags = local.common_tags
}

module "route_tables" {

  source = "./route_table"

  vpc_id = module.vpc.vpc_id

  igw_id = module.igw.igw_id

  nat_gateway_ids = module.nat.nat_gateway_ids

  public_subnet_ids = module.subnets.public_subnet_ids

  private_subnet_ids = module.subnets.private_subnet_ids
}
module "nacl" {
  source = "./nacl"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.subnets.private_subnet_ids
}



# module "security_groups" {

#   source = "./security-groups"

#   vpc_id = module.vpc.vpc_id

#   environment = var.environment

#   admin_access_cidr = var.admin_access_cidr

#   common_tags = local.common_tags
#   vpc_cidr    = var.vpc_cidr
# }

# module "endpoints" {

#   source = "./endpoints"

#   vpc_id = module.vpc.vpc_id

#   private_subnet_ids = module.subnets.private_subnet_ids

#   private_route_table_ids = module.route_tables.private_route_table_ids

#   endpoint_security_group_id = module.security_groups.vpce_sg_id

#   aws_region = var.aws_region

#   common_tags = local.common_tags
# }
