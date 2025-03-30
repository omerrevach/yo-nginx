#!/bin/bash

yum update -y

yum install -y yum-utils

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user || true
usermod -aG docker ssm-user || true

echo 'newgrp docker' >> /home/ssm-user/.bashrc || true
echo 'newgrp docker' >> /home/ec2-user/.bashrc || true

docker run -d -p 80:80 rebachi/nginx-assignment:latest
