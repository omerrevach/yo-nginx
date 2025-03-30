output "ssm_endpoint_id" {
  value = aws_vpc_endpoint.ssm.id
}

output "ssmmessages_endpoint_id" {
  value = aws_vpc_endpoint.ssmmessages.id
}

output "ec2messages_endpoint_id" {
  value = aws_vpc_endpoint.ec2messages.id
}

output "endpoint_sg_id" {
  value = aws_security_group.endpoint_sg.id
}
