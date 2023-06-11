provider "aws" {
  access_key = "AKIA43KKKGRBXH7S5HHU"
  secret_key = "t+BbkEPyYnZGA1Na40st1zRf5aMOWt2iH9aEHQK8"
  region     = "us-west-2"   # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  ami           = var.ec2_instance["ami_id"]  # Replace with your desired AMI ID
  instance_type = var.ec2_instance["ami_id"]
  subnet_id     = var.ec2_instance["subnet_id"]    # Replace with your desired subnet ID
  key_name      = "my-key-pair"            # Replace with your desired key pair name

    tags = var.ec2_instance["tags"]

  security_groups = [var.ec2_instance.security_groups[0]]

