output "instance_ids" {
  value = aws_instance.nginx[*].id
}
output "private_ips" {
  value = aws_instance.nginx[*].private_ip
}
output "security_group_id" {
  value       = aws_security_group.ec2_sg.id
}
