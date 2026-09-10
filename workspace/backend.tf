terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-batch-fctp"
    key    = "compute/dev-workspace/file-provisinor/terraform.tfstate"
    region = "ap-south-1"
  }
}
