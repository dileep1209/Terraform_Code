provider "aws" {
  region     = var.region
  access_key = "AKIAZWO563KPTTCENP4G"
  secret_key = "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"
}

resource "aws_instance" "Jenkins_Server" {
  count = 3
  ami = var.aws_ami
  instance_type = var.instance_type
  key_name = "TF_Key"
  security_groups = [aws_security_group.TF_SG.name]
  tags = {
    Name = "Jenkins_Server-${count.index}"
    //Name = "Jenkins_Server-${count.index + 1}"
  }
}

resource "aws_key_pair" "TF_Key" {
  key_name = "TF_Key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "local_file" "TF_Key" {
  content = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}
