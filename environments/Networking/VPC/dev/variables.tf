variable "vpc_name" {
  type = string
}

variable "Environment" {
 type = string
}

variable "vpc_cidr" {
  type = string
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "enable_dns_support" {
  type = bool
}



variable "public_subnet_01_cidr" {
  type = string
}

variable "public_subnet_01_name" {
  type = string
}

variable "private_subnet_01_cidr" {
  type = string
}
variable "private_subnet_01_name" {
  type = string
}

variable "igw_name" {
  type = string
}

variable "public_rt_name" {
  
}