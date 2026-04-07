resource "aws_instance" "instance" {
  ami = "ami-0b4f379183e5706b9"
  instance_type = var.instance_type
  vpc_security_group_ids = ["sg-0d386c7e59b2416fe"]
  tags = {
    Name = "${var.component_name}-${var.env}"
  }
}

