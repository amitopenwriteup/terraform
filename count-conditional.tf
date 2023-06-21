provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
variable "environment" {
  type    = string
  default = "development"
}
variable "create_instance" {
  type    = bool
  default = "true"
}

resource "aws_instance" "exae" {
  count         = var.create_instance ? 1 : 0
  ami           = "ami-0b8987a72eee28c3d"   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair name

  tags = {
    Environment = var.environment == "Production" ? "prod" : "dev"
  }
}