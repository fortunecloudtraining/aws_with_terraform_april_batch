terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-batch-fctp"
    key    = "Storage/s3-bucket/dev/test/terraform.tfstate"
    region = "ap-south-1"
  }
}
