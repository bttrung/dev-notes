resource "aws_instance" "my-first-aws-instance" {
  ami = lookup(var.AMIS, var.AWS_REGION_SINGAPORE)
  instance_type = "t4g.nano"
}

output "ip" {
  value = aws_instance.my-first-aws-instance.public_ip
}

output "cpu_core_count" {
  value = aws_instance.my-first-aws-instance.cpu_core_count
}