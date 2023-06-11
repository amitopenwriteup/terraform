terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  access_key = "AKIA43KKKGRBXH7S5HHU"
  secret_key = "t+BbkEPyYnZGA1Na40st1zRf5aMOWt2iH9aEHQK8"
  region     = "us-west-2"   # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0b8987a72eee28c3d"   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair name

  tags = {
    Name        = "ExampleInstance"
    Environment = "Production"
  }
}
output "instance_ip" {
  value = aws_instance.example.public_ip
}
