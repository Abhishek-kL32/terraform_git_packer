#!/bin/bash


echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
systemctl restart sshd.service

yum install httpd php -y
systemctl restart php-fpm httpd.service
systemctl enable php-fpm  httpd.service

sudo cp -r /tmp/website/* /var/www/html/
sudo chown -R apache:apache /var/www/html/*
sudo rm -rf /tmp/website

