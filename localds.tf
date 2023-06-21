provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
locals {
  instance_count = 2
  instance_type  = "t2.micro"
  instance_tags  = {
    Environment = "production"
    Owner       = "ow"
  }
}
resource "aws_instance" "exae" {
  count         = local.instance_count
  ami           = "ami-0b8987a72eee28c3d"   # Replace with your desired AMI ID
  instance_type = local.instance_type
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair" # Replace with your desired key pair name
  tags         = local.instance_tags
}
output "instance_names" {
  value = [for i in range(local.instance_count) : "instance-${i+1}"]
}