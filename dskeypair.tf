provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
data "aws_key_pair" "example" {
  key_name           = "my-key-pair"
  include_public_key = true
  filter {
    name   = "key-name"
    values = ["my-key-pair"]
  }
}

output "fingerprint" {
  value = data.aws_key_pair.example.fingerprint
}

output "name" {
  value = data.aws_key_pair.example.key_name
}

output "id" {
  value = data.aws_key_pair.example.id
}