resource "aws_security_group" "ec2_sg" {
  name   = "ec2_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nginx" {
  ami                         = var.linux_ami
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  iam_instance_profile = var.instance_profile_name
  associate_public_ip_address = false
  
  user_data = templatefile("${path.module}/install.sh", {})
}
