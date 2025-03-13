resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file("key.pub")
}

resource "aws_instance" "dove-inst" {
  ami           = var.AMIS[var.REGION]
  instance_type = "t2.micro"
  #   availability_zone      = var.ZONE1
  key_name               = aws_key_pair.dove-key.key_name
  subnet_id              = aws_subnet.dove-pub-1.id
  vpc_security_group_ids = [aws_security_group.dove_stack_sg.id]
  tags = {
    Name    = "dovetf1"
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
    type        = "ssh"
    user        = var.USER
    private_key = file("key")
    host        = self.public_ip
  }

}

resource "aws_ebs_volume" "vol_4_dove" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    name = "extr-vol-4-dove"
  }
}

resource "aws_volume_attachment" "atch-dove" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_dove.id
  instance_id = aws_instance.dove-inst.id
}

output "PublicIP" {
  value = aws_instance.dove-inst.public_ip
}

output "PrivateIP" {
  value = aws_instance.dove-inst.private_ip
}