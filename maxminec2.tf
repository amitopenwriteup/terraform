provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 3
}

variable "max_instance_count" {
  description = "Maximum number of EC2 instances allowed"
  type        = number
  default     = 5
}


resource "aws_instance" "exae" {
  count         =  min(var.instance_count, var.max_instance_count)
  ami           = "ami-0b8987a72eee28c3d"   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair" # Replace with your desired key pair name
}
~
