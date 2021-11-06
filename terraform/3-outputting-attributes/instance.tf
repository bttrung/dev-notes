resource "aws_instance" "my-first-aws-instance" {
  ami = lookup(var.AMIS, var.AWS_REGION_SINGAPORE)
  instance_type = "t4g.nano"


  provisioner "local-exec" {
    command = "echo ${aws_instance.my-first-aws-instance.private_ip} >> private_ips.txt"
  }
}

output "ip" {
  value = aws_instance.my-first-aws-instance.public_ip
}

output "cpu_core_count" {
  value = aws_instance.my-first-aws-instance.cpu_core_count
}