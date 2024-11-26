#!/bin/bash

echo $HOSTNAME
hostname=$HOSTNAME

# change timezone to Japan
timedatectl set-timezone Asia/Tokyo

# update yum/dnf packages
dnf update -y
dnf install -y epel-release yum-utils

# install sysstat, htop, unzip, wget
dnf install -y sysstat htop unzip wget bash-completion nc
systemctl enable --now sysstat

# install gh
yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
dnf install -y gh

# change network policy
# echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
# echo 'net.ipv6.conf.all.forwarding = 1' >> /etc/sysctl.conf
# sysctl -p

# clear history
history -c; exit
