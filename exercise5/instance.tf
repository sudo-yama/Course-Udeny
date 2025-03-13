resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey1"
  public_key = file("key.pub")
}

resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.dove-key.key_name
  subnet_id              = "subnet-07f2476268f1434ca"
  vpc_security_group_ids = ["sg-0d7e44796d6ef429c"]
  tags = {
    Name    = "dovetf"
    Project = "test-tf"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo bash /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("key")
    host        = self.public_ip
  }
}

output "PublicIP" {
  value = aws_instance.dove-inst.public_ip
}

output "PrivateIP" {
  value = aws_instance.dove-inst.private_ip
}