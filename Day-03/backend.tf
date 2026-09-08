terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-batch-fctp"
    key    = "compute/Day-03/terraform.tfstate"
    region = "ap-south-1"
  }
}
