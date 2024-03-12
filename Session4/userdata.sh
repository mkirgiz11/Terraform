#!/bin/bash
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo echo '${env} instance is running' >> /var/www/html/index.html