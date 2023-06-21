provider "aws" {
  access_key = "<provide access key>"
  secret_key = "<provide secret key>"
  region     = "us-west-2"   # Replace with your desired AWS region
}
resource "aws_iam_policy" "custom_policy" {
  name        = "my-custom-policy"
  description = "Custom IAM policy"
  policy      = file("pol.json")
}
resource "aws_iam_role" "custom_role" {
  name               = "my-custom-role"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
  EOF
}

resource "aws_iam_role_policy_attachment" "custom_role_attachment" {
  role       = aws_iam_role.custom_role.name
  policy_arn = aws_iam_policy.custom_policy.arn
}