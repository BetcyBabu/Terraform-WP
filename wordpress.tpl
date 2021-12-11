#!/bin/bash

db_username=wp_user
db_user_password=wp123
db_name=wp_db

yum install -y httpd
systemctl start  httpd
systemctl enable  httpd

amazon-linux-extras install php7.4

# Download wordpress package and extract
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/

cd /var/www/html
cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$db_name/g" wp-config.php
sed -i "s/username_here/$db_username/g" wp-config.php
sed -i "s/password_here/$db_user_password/g" wp-config.php
sed -i "s/localhost/${db_host}/g" wp-config.php

chown -R apache:apache /var/www/html

systemctl restart httpd.service