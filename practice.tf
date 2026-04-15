variable "key_name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "display_name" {}

resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = var.display_name
  }
}