#!/bin/bash

# update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

# nginx
sudo apt-get install nginx -y

# npm
sudo apt-get install npm -y

# node js
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# pm2
sudo npm install -g pm2


npm install ~/project/app


sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/backup

sudo echo "server {
    listen 80;

    server_name _;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}" | sudo tee /etc/nginx/sites-available/default


sudo systemctl restart nginx

sudo apt-get install tmux -y
