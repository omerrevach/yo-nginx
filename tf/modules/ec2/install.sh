#!/bin/bash
set -e

# Update system
yum update -y

# Install Docker
amazon-linux-extras install docker -y

# Start and enable Docker
systemctl enable docker
systemctl start docker

# Add users to docker group
usermod -aG docker ec2-user || true
usermod -aG docker ssm-user || true

# Apply group change for current session
echo 'newgrp docker' >> /home/ssm-user/.bashrc || true
echo 'newgrp docker' >> /home/ec2-user/.bashrc || true

# Pull and run container
docker run -d -p 80:80 rebachi/nginx-assignment:latest
