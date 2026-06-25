#!/bin/bash
sudo apt-get update

sudo apt-get install nginx stress-ng -y

sudo tee /etc/nginx/sites-available/default > /dev/null << 'EOF'
server {
    listen 80;
    server_name localhost;

    location / {
        default_type text/plain;
        return 200 "Server IP: $server_addr\n";
    }
}
EOF

sudo nginx -t

sudo systemctl restart nginx

