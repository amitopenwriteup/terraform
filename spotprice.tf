provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
data "aws_ec2_spot_price" "example" {
  instance_type     = "t3.medium"
  availability_zone = "us-west-2a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}
output "spot_price" {
  value = data.aws_ec2_spot_price.example.spot_price
}
