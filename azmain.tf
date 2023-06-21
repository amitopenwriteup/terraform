provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
/*
resource "aws_instance" "example" {
  ami           = "ami-0b8987a72eee28c3d"   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair nam
  tags = {
    Name        = "instance1"
  }
}
*/
data "aws_availability_zones" "available" {
  state = "available"

  filter {
    name   = "zone-type"
    values = ["availability-zone"]
  }
}

output "available_zones" {
  value = data.aws_availability_zones.available.names
}