resource "aws_instance" "my-first-aws-instance" {
  ami = lookup(var.AMIS, var.AWS_REGION_SINGAPORE)
  instance_type = "t4g.nano"
  key_name = aws_key_pair.mykey.key_name

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }

  connection {
    user = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
    host = self.public_ip
  }

}

resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}