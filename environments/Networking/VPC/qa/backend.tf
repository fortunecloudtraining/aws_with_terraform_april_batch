terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-batch-fctp"
    key    = "Networking/vpc/qa/terraform.tfstate"
    region = "ap-south-1"
  }
}
