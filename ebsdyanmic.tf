provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
resource "aws_instance" "example" {
  ami           = "ami-0b8987a72eee28c3d" # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65" # Replace with your desired subnet ID
  key_name      = "my-key-pair"              # Replace with your desired key pair name

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_devices
    content {
      device_name           = ebs_block_device.value.device_name
      volume_type           = ebs_block_device.value.volume_type
      volume_size           = ebs_block_device.value.volume_size
      delete_on_termination = ebs_block_device.value.delete_on_termination
    }
  }
}