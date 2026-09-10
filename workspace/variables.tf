variable "ami_id" {
  type = string

}


variable "subnet_id" {
  type = string

  description = "this for the aws subnet id"
}

variable "instance_type" {
  type = string

  description = "this for the instance type"
}

variable "instance_count" {
  type = number
  default = 1
}

variable "public_ip" {
  type = bool
  default = true
  description = "this for public ip"
}

variable "tags" {
  type = string
}

variable "sg_tag" {
  type = string
}