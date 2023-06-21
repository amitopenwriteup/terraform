provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
resource "aws_instance" "example" {
  ami           = "ami-0b8987a72eee28c3d"   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair name
  depends_on = [aws_security_group.example_sg]
}
resource "aws_security_group" "example_sg" {
  name        = "example_sg"
  description = "Example security group"

  # Security group rules...

  depends_on = [aws_vpc.example_vpc]
}

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"

  # VPC configurations...
}
