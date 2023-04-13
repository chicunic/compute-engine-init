#!/bin/bash

echo $HOSTNAME
hostname=$HOSTNAME

# change timezone to Japan
timedatectl set-timezone Asia/Tokyo

# update yum/dnf packages
dnf update -y
dnf install epel-release yum-utils -y

# install sysstat, htop, unzip, wget
dnf install sysstat htop unzip wget bash-completion nc -y
systemctl enable --now sysstat

# install gh
yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
dnf install gh -y

# change network policy
echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' >> /etc/sysctl.conf
sysctl -p

# clear history
history -c; exit
