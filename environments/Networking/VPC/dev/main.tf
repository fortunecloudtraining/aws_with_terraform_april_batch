module "vpc_module" {
source = "../../../../modules/Networking/VPC"



  vpc_name   = var.vpc_name
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
  Environment = var.Environment
  vpc_cidr = var.vpc_cidr
  public_subnet_01_cidr = var.public_subnet_01_cidr
  public_subnet_01_name = var.public_subnet_01_name
  private_subnet_01_cidr = var.private_subnet_01_cidr
  private_subnet_01_name = var.private_subnet_01_name
  igw_name = var.igw_name
  public_rt_name = var.public_rt_name
  private_rt_name = var.private_rt_name
}
