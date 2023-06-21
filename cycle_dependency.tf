terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
resource "aws_instance" "a" {
  ami           = "ami-066fdb387a3b86d3d"   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair name
  private_ip    = aws_instance.b.private_ip
  tags = {
    Name        = "ExampleInstance"
    Environment = "Production"
  }
}
resource "aws_instance" "b" {
  ami           = "ami-066fdb387a3b86d3d"   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair name
  vpc_security_group_ids = [aws_instance.a.security_groups[0].id]
  tags = {
    Name        = "ExampleInstance"
    Environment = "Production"
  }

}