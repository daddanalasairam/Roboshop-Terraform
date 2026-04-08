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
  ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "${var.component_name}-${var.env}"
  }
}

provisioner "local_exec" {
  command = <<EOL
  cd /home/ec2-user/roboshop-ansible
  command = "ansible-playbook -i ${self.private_ip}, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e app_name=${var.component_name} -e env=${var.env} roboshop.yml"
  EOL
}