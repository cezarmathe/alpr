#!/usr/bin/env bash

sudo mkdir /var/www/alppr
sudo chown ${USER} /var/www/alppr
sudo chgrp ${USER} /var/www/alppr
sudo ln -s "$(pwd)/alppr-fileserver.conf" /etc/nginx/conf.d/
sudo systemctl restart nginx
