#!/bin/bash

echo $HOSTNAME
hostname=$HOSTNAME

# install docker & docker-compose
dnf install yum-utils -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# start and enable docker
systemctl start docker
systemctl enable docker

# clear history
history -c; exit
