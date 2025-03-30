output "instance_id" {
  value       = aws_instance.nginx.id
}

output "private_ip" {
  value       = aws_instance.nginx.private_ip
}

output "security_group_id" {
  value       = aws_security_group.ec2_sg.id
}
