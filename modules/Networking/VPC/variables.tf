# variable "vpc_name" {
#   type = string
# }

# variable "Environment" {
#  type = string
# }

# variable "vpc_cidr" {
#   type = string
# }

# variable "enable_dns_hostnames" {
#   type = bool
# }

# variable "enable_dns_support" {
#   type = bool
# }

# variable "public_subnet_01_cidr" {
#   type = string
# }
# variable "public_subnet_01_name" {
#   type = string
# }

# variable "private_subnet_01_cidr" {
#   type = string
# }
# variable "private_subnet_01_name" {
#   type = string
# }

# variable "igw_name" {
#   type = string
# }

# variable "public_rt_name" {
  
# }

# variable "private_rt_name" {
  
# }


# variable "subnet_availability_zone_01" {
  
# }

# variable "public_subnet_cidr_02" {
  
# }

# variable "subnet_availability_zone_02" {
  
# }

# variable "public_subnet_02_name" {
  
# }


# variable "public_subnet_cidr_03" {
  
# }

# variable "subnet_availability_zone_03" {
  
# }

# variable "public_subnet_03_name" {
  
# }

# variable "private_subnet_cidr_02" {
  
# }

# variable "private_subnet_02_name" {
  
# }

# variable "private_subnet_cidr_03" {
  
# }

# variable "private_subnet_03_name" {
  
# }

#################################################
# ENVIRONMENT
#################################################

variable "environment" {

  type = string
}

#################################################
# PROJECT
#################################################

variable "project_name" {

  type = string
}

variable "managed_by" {

  type = string

  default = "Terraform"
}

#################################################
# EKS
#################################################

variable "cluster_name" {

  type = string
}

#################################################
# VPC
#################################################

variable "vpc_cidr" {

  type = string
}

#################################################
# SUBNETS
#################################################

variable "public_subnets" {

  type = list(string)
}

variable "private_subnets" {

  type = list(string)
}

#################################################
# AZS
#################################################

variable "availability_zones" {

  type = list(string)
}

#################################################
# SECURITY
#################################################

variable "admin_access_cidr" {

  type = string

  default = "0.0.0.0/0"
}

variable "aws_region" {
  default = "ap-south-1"
}