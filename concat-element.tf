provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
variable "subnets" {
  type    = list(string)
  default = ["subnet-12345678", "subnet-87654321"]
}

variable "additional_subnets" {
  type    = list(string)
  default = ["subnet-98765432", "subnet-56789012"]
}

locals {
  all_subnets = concat(var.subnets, var.additional_subnets)
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = element(local.all_subnets, count.index)
  count         = length(local.all_subnets)
}