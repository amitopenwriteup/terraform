provider "aws" {
  access_key = "AKIA43KKKGRBXH7S5HHU"
  secret_key = "t+BbkEPyYnZGA1Na40st1zRf5aMOWt2iH9aEHQK8"
  region     = "us-west-2"   # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  ami           = var.ami_id   # Replace with your desired AMI ID
  instance_type = var.instance_type
  subnet_id     = var.subnet_id     # Replace with your desired subnet ID
  key_name      = var.key_pair_name             # Replace with your desired key pair name

  tags = {
    Name        = "ExampleInstance"
    Environment = "Production"
  }
}
