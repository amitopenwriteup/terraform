variable "ec2_instance" {
  default = {
    instance_type = "t2.micro"
    ami_id        = "ami-066fdb387a3b86d3d"
    subnet_id     = "subnet-0e09953db95a5ac65"
    tags          = {
      Name        = "MyEC2Instance"
      Environment = "Production"
    }
    security_groups = ["launch-wizard-3", "launch-wizard-1"]
  }
}