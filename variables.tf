variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_ami" {

  default = "ami-06a0b4e3b7eb7a300"
}
