terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-batch-fctp"
    key    = "compute/Day-04/remote-exec/terraform.tfstate"
    region = "ap-south-1"
  }
}
