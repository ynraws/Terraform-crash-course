

resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file("dovekey.pub")
}


resource "aws_instance" "dove_instence" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = ["sg-00314af27c6b53087"]
  tags = {
    Name    = "Terrafrom_server-01"
    project = "Terraform project"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }


  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("dovekey")
    host        = self.public_ip
  }
}
