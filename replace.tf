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
  ami           = "ami-12345678"
  subnet_id     = "subnet-12345678"
  tags = {
    Name = var.instance_name
  }
}

output "modified_instance_name" {
  value = replace(aws_instance.example.tags.Name, "web", "app")
}
