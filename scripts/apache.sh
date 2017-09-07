#!/usr/bin/env bash

sudo apt-get install --yes --force-yes php5 libapache2-mod-php5 php5-mysql
sudo apt-get install --yes apache2
sudo apt-get update > /dev/null
sudo rm -f /var/www/html/index.html
sudo cp /tmp/index.html /var/www/html/.
sudo update-rc.d apache2 defaults