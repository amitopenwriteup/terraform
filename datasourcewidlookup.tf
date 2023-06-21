provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
variable "desired_architecture" {
  type    = string
  default = "x86_64"
}

data "aws_ami" "example_ami" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "architecture"
    values = [var.desired_architecture]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "example" {
  ami           = lookup(data.aws_ami.example_ami,"image_id", "ami-not-found")
  instance_type = "t2.micro"
  # other instance configuration...
}
output "available_amis" {
  value = data.aws_ami.example_ami
}
