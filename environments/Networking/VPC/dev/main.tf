# module "vpc_module" {
# source = "../../../../modules/Networking/VPC"



#   vpc_name   = var.vpc_name
#   enable_dns_hostnames = var.enable_dns_hostnames
#   enable_dns_support = var.enable_dns_support
#   Environment = var.Environment
#   vpc_cidr = var.vpc_cidr
#   public_subnet_01_cidr = var.public_subnet_01_cidr
#   public_subnet_01_name = var.public_subnet_01_name
#   private_subnet_01_cidr = var.private_subnet_01_cidr
#   private_subnet_01_name = var.private_subnet_01_name
#   igw_name = var.igw_name
#   public_rt_name = var.public_rt_name
#   private_rt_name = var.private_rt_name

# subnet_availability_zone_01=var.subnet_availability_zone_01
# public_subnet_cidr_02=var.public_subnet_cidr_02
# subnet_availability_zone_02=var.subnet_availability_zone_02
# public_subnet_02_name=var.public_subnet_02_name
# public_subnet_cidr_03=var.public_subnet_cidr_03
# subnet_availability_zone_03=var.subnet_availability_zone_03
# public_subnet_03_name=var.public_subnet_03_name
# private_subnet_cidr_02=var.private_subnet_cidr_02
# private_subnet_02_name=var.private_subnet_02_name
# private_subnet_cidr_03=var.private_subnet_cidr_03
# private_subnet_03_name=var.private_subnet_03_name
# }


module "network" {

  source = "../../../../modules/Networking/VPC"

  #################################################
  # ENVIRONMENT
  #################################################

  environment = var.environment

  cluster_name = var.cluster_name


  #################################################
  # PROJECT
  #################################################

  project_name = var.project_name

  #################################################
  # NETWORKING
  #################################################

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  #################################################
  # SUBNETS
  #################################################

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets
}