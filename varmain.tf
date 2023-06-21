provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
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
