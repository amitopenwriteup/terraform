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

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = "ami-0b8987a72eee28c3d"   # Replace with your desired AMI ID
  instance_type = var.instance_type
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair name

  tags = {
    Name        = "ExampleInstance"
    Environment = "Production"
  }
}
