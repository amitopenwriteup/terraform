provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
variable "instance_types" {
  type = list(string)
  default = ["t2.micro", "m5.large", "c5.xlarge"]
}
resource "aws_instance" "exae" {
  ami           = "ami-0b8987a72eee28c3d"   # Replace with your desired AMI ID
  count         = length(var.instance_types)
  instance_type = var.instance_types[count.index]
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair name

  tags = {
    Name        = "ExampleInstance"
    Environment = "Production"
  }
}