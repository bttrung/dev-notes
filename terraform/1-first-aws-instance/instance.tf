resource "aws_instance" "my-first-aws-instance" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t4g.nano"
}