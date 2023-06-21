provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
variable "instance_count" {
  description = "Number of EC2 instances to create"
  default     = 3
}

resource "aws_instance" "example" {
   count = var.instance_count
  ami           = "ami-0b8987a72eee28c3d"   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair name

  tags = {
    Name        = "example-instance-${count.index}"
  }
}
