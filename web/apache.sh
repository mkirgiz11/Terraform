#!/bin/bash
sudo dnf install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Mithat's task is done!!!!</h1>" >> /var/www/html/index.html
sudo systemctl restart httpd
