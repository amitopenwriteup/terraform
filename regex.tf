provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
variable "instance_names" {
  description = "List of EC2 instance names"
  type        = list(string)
  default     = ["web-server-1", "web-server-2", "db-server-1"]
}
resource "aws_instance" "example" {
  count         = length(var.instance_names)
  ami           = "ami-0b8987a72eee28c3d"   # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e09953db95a5ac65"     # Replace with your desired subnet ID
  key_name      = "my-key-pair"             # Replace with your desired key pair name

  tags = {
    Name = var.instance_names[count.index]
  }
}
output "matching_instances" {
  value = [for inst in aws_instance.example : inst.tags.Name if regex(".*web-server.*", inst.tags.Name) == true]
}
