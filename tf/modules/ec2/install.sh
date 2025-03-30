#!/bin/bash

sudo yum update -y
sudo yum install -y amazon-linux-extras
sudo amazon-linux-extras install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ssm-user
sudo docker run -d -p 80:80 rebachi/nginx-assignment:latest
newgrp docker