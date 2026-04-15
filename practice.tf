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

variable "names" {
  default = ["frontend", "backend"]
}

resource "aws_instance" "instance" {
  count = 2

  ami = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = var.names[count.index]
  }
}

resource "aws_instance" "instance" {
  for_each = {
    frontend = "t2.micro"
    backend = "t2.micro"

    ami = var.ami_id

    tags = {
      Name = each.key
    }
  }
}