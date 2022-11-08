#!/bin/bash

#installing apache webserver
sudo yum install httpd -y

#opening 80 http port in firewall
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

#starting apache
sudo systemctl start httpd

#changing apache webpage content
sudo chown -R $USER:$USER /usr/share/httpd/noindex/
sudo echo Ivan Panas > /usr/share/httpd/noindex/index.html
sudo systemctl restart httpd
