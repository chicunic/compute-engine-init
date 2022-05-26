#!/bin/bash

echo $HOSTNAME
hostname=$HOSTNAME

# change timezone to Japan
timedatectl set-timezone Asia/Tokyo

# update yum packages
yum update -y
yum install epel-release yum-utils -y

# install sysstat, htop, unzip, wget
yum install sysstat htop unzip wget bash-completion nc -y
systemctl enable --now sysstat

# install gh
yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
yum install gh -y

# install puppet agent
rpm -Uvh https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
yum install puppet-agent -y
sudo ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet

# change network policy
echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' >> /etc/sysctl.conf
sysctl -p

# clear history
history -c; exit
