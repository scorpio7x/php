#!/bin/sh
#sed -i -e 's/\r$//' your_script.sh
#sudo apt-get install systemd -y

#install library and nginx
sudo apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev unzip

sudo wget https://github.com/scorpio7x/nginx/raw/master/nginx-1.15.5.tar.gz

sudo tar -xvzf nginx-1.15.5.tar.gz

cd nginx-1.15.5

sudo ./configure

sudo make

sudo make install

cd ..

sudo rm -rfv nginx-1.15*

sudo mkdir /usr/local/nginx/conf.d

sudo wget https://raw.githubusercontent.com/scorpio7x/nginx/master/server.conf

sudo mv -fv server.conf /usr/local/nginx/conf.d/

sudo wget https://raw.githubusercontent.com/scorpio7x/nginx/master/nginx.conf

sudo rm -rfv /usr/local/nginx/conf/nginx.conf

sudo mv -fv nginx.conf /usr/local/nginx/conf/

sudo /usr/local/nginx/sbin/nginx

sudo wget https://raw.githubusercontent.com/scorpio7x/nginx/master/nginx-service.sh

sudo mv -fv nginx-service.sh /etc/init.d/nginx
 
sudo chmod +x /etc/init.d/nginx

sudo /usr/sbin/update-rc.d -f nginx defaults

sudo service nginx reload


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


#install mariadb-server mysql on Ubuntu 14
sudo apt-get install software-properties-common -y

apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
	
add-apt-repository 'deb http://download.nus.edu.sg/mirror/mariadb/repo/10.3/ubuntu trusty main'
	
apt-get update

apt-get install mariadb-server -y

mysql_secure_installation


#install phpmyadmin
sudo wget https://github.com/scorpio7x/php/raw/master/phpMyAdmin-4.8.3-all-languages.zip

sudo unzip phpMyAdmin-4.8.3-all-languages.zip

sudo mv -fv phpMyAdmin-4.8.3-all-languages phpmyadmin

sudo mv -fv phpmyadmin /usr/share/

sudo rm -rfv phpMyAdmin-4.8.3-all-languages.zip

sudo wget https://raw.githubusercontent.com/scorpio7x/php/master/config.inc.php

sudo mv -fv config.inc.php /usr/share/phpmyadmin/

sudo ln -s /usr/share/phpmyadmin /usr/local/nginx/html

mkdir /usr/share/phpmyadmin/tmp

chmod -R 777 /usr/share/phpmyadmin/tmp

clear && echo && echo 'Install successful !'

