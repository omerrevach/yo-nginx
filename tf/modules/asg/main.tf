resource "aws_security_group" "asg_sg" {
  name   = "asg_sg"
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

resource "aws_launch_template" "asg_lt" {
  name_prefix   = "asg-nginx-"
  image_id      = var.linux_ami
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.instance_profile_name
  }

  user_data = base64encode(templatefile("${path.module}/install.sh", {
    ECR_REPO_URL = var.ecr_repo_url
  }))

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.asg_sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "nginx-asg-instance"
    }
  }
}

resource "aws_autoscaling_group" "asg" {
  name                = "asg-nginx"
  max_size            = length(var.subnet_ids)
  min_size            = length(var.subnet_ids)
  desired_capacity    = length(var.subnet_ids)
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.asg_lt.id
    version = "$Latest"
  }

  target_group_arns = [var.alb_target_group_arn]

  health_check_type         = "EC2"
  health_check_grace_period = 60

  tag {
    key                 = "Name"
    value               = "asg-nginx"
    propagate_at_launch = true
  }
}