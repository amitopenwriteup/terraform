provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "web-server-1"
}

resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = "ami-0b8987a72eee28c3d"
    subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair" # Replace with your desired key pair name

  tags = {
    Name = var.instance_name
  }
}

output "instance_type" {
  value = split("-", aws_instance.example.tags.Name)[0]
}

output "instance_number" {
  value = split("-", aws_instance.example.tags.Name)[2]
}
