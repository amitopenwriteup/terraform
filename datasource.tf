data "aws_instance" "myinstance" {
  filter {
    name   = "tag:Name"
    values = ["instance1"]
  }
  depends_on = [
    aws_instance.example
  ]
}
output "myoutput" {
value = data.aws_instance.myinstance.public_ip
}