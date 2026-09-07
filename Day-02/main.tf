resource "aws_instance" "web_app" {
  ami = var.ami_id
  subnet_id = var.subnet_id
  instance_type = var.instance_type
#   count = var.instance_count
  associate_public_ip_address = var.public_ip


  tags = {
    Name = "web-app"
  }
}

output "instace_public_ip" {
  description = "this for the aws ec2 public ip"
  value = aws_instance.web_app.public_ip
}

output "instace_private_ip" {
  description = "this for the aws ec2 public ip"
  value = aws_instance.web_app.private_ip
}

output "instace_private_dns" {
  description = "this for the aws ec2 public ip"
  value = aws_instance.web_app.private_dns
}