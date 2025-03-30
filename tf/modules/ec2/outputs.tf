output "instance_ids" {
  value = { for k, inst in aws_instance.nginx : k => inst.id }
}

output "private_ips" {
  value = { for k, inst in aws_instance.nginx : k => inst.private_ip }
}

output "security_group_id" {
  value       = aws_security_group.ec2_sg.id
}
