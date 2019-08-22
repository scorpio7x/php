#!/bin/sh
#sed -i -e 's/\r$//' your_script.sh
#sudo apt-get install systemd -y

#install php5
sudo apt-get install python-software-properties -y

sudo add-apt-repository ppa:ondrej/php

sudo apt-get update

sudo apt-get install php5 php5-fpm php5-cgi php5-common php5-mysql php5-curl php5-cli php5-intl php5-gd php5-cgi php5-mcrypt php5-xmlrpc -y

sudo wget https://raw.githubusercontent.com/scorpio7x/php/master/php.ini

sudo rm -fv /etc/php5/fpm/php.ini

sudo mv -fv php.ini /etc/php5/fpm

sudo wget https://raw.githubusercontent.com/scorpio7x/php/master/www.conf

sudo rm -fv /etc/php5/fpm/pool.d/www.conf

sudo mv -fv www.conf /etc/php5/fpm/pool.d

sudo wget https://raw.githubusercontent.com/scorpio7x/php/master/info.php

sudo mv -fv info.php /usr/local/nginx/html/

sudo service nginx restart





