terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-batch-fctp"
    key    = "Compute/ec2/dev/test/terraform.tfstate"
    region = "ap-south-1"
  }
}
