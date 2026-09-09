terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-batch-fctp"
    key    = "compute/Day-04/local-provisinor/terraform.tfstate"
    region = "ap-south-1"
  }
}
