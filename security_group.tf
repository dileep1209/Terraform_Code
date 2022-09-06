resource "aws_security_group" "TF_SG" {
  name = "New Terraform Security Group"
  description = "This is New Terraform Security Group"
  vpc_id = "vpc-0dbbaa563808f6e5c"

ingress {
  description = "HTTPS"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}

ingress {
  description = "HTTP"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}
ingress {
  description = "SSH"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}

egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}

tags = {
  name = "TF_SG"
}
}
