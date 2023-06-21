provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
locals {
  instance_type_map = {
    "web"     = "t2.micro"
    "database" = "t3.medium"
    "cache"    = "r5.large"
  }

  instance_tags = {
    Name        = "MyInstance"
    Environment = "Production"
    Project     = "MyProject"
  }
}

resource "aws_instance" "web_instance" {
  ami           = "ami-0b8987a72eee28c3d"
  instance_type = local.instance_type_map["web"]
  subnet_id     = "subnet-0e09953db95a5ac65"
  tags          = local.instance_tags
}

resource "aws_instance" "database_instance" {
  ami           = "ami-0b8987a72eee28c3d"
  instance_type = local.instance_type_map["database"]
  subnet_id     = "subnet-0e09953db95a5ac65"
  tags          = local.instance_tags
}

resource "aws_instance" "cache_instance" {
  ami           = "ami-0b8987a72eee28c3d"
  instance_type = local.instance_type_map["cache"]
  subnet_id     = "subnet-0e09953db95a5ac65"
  tags          = local.instance_tags
}
