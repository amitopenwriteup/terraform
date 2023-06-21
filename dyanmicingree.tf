provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Example security group"

  dynamic "ingress" {
    for_each = [443, 80, 8080]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}