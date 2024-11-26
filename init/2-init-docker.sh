#!/bin/bash

echo $HOSTNAME
hostname=$HOSTNAME

# install docker & docker-compose
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# start and enable docker
systemctl start docker
systemctl enable docker

# add current user to docker group
# sudo usermod -aG docker $USER

# clear history
history -c; exit
