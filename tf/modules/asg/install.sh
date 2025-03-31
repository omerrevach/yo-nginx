#!/bin/bash

sudo yum update -y
sudo yum install -y amazon-linux-extras
sudo amazon-linux-extras install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ssm-user

aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin ${ECR_REPO_URL}
docker pull ${ECR_REPO_URL}:latest
docker run -d -p 80:80 ${ECR_REPO_URL}:latest

newgrp docker
