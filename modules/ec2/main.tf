resource "aws_security_group" "sg" {
  name        = "${var.component_name}-${var.env}-sg"
  description = "Inbound allow for ${var.component_name}"

  # inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # allow SSH from anywhere
  }

  ingress {
    from_port   = var.app_port #80
    to_port     = var.app_port #80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # allow HTTP from anywhere
  }

  # outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # all protocols
    cidr_blocks = ["0.0.0.0/0"]  # allow all outbound
  }
}


resource "aws_instance" "instance" {
  ami = "ami-0b4f379183e5706b9"
  instance_type = var.instance_type
  vpc_security_group_ids = ["sg-0d386c7e59b2416fe"]
  tags = {
    Name = "${var.component_name}-${var.env}"
  }
}

