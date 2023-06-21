provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
data "aws_ami" "ubuntu_ami" {
  most_recent = true

  owners = ["099720109477"]  # Canonical owner ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}
resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu_ami.id   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair name

  tags = {
    "Name" = format("MyInstance-%s", formatdate("YYYYMMDD", timestamp()))
  }
}
output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu_ami.id
}
