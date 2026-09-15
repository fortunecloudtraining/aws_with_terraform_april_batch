terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-batch-fctp"
    key    = "Networking/vpc/dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
