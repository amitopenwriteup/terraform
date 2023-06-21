provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
variable "instance_type" {
  type    = string
  default = "t1.cro"
}

variable "ami_map" {
  type = map(string)
  default = {
    "t2.micro"  = "ami-0b8987a72eee28c3d"
    "t2.nano"   = "ami-0b8987a72eee28c3d"
    "t3.micro"  = "ami-0b8987a72eee28c3d"
    "t3.nano"   = "ami-0b8987a72eee28c3d"
  }
}

resource "aws_instance" "example" {
  ami           = lookup(var.ami_map, var.instance_type, "ami-not-found")
  instance_type = var.instance_type
  # other instance configuration...
}
