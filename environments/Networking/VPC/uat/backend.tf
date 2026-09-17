terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-batch-fctp"
    key    = "Networking/vpc/uat/terraform.tfstate"
    region = "ap-south-1"
  }
}
