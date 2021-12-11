#!/bin/bash
sleep 60s

yum -y install mariadb-server mariadb expect

# Start MySQL
service mariadb start

sleep 10s

SECURE_MYSQL=$(expect -c "
 
set timeout 10
spawn mysql_secure_installation
 
expect \"Enter current password for root (enter for none):\"
send \"\r\"
 
expect \"Change the root password?\"
send \"y\r\"
expect \"New password:\"
send \"root123\r\"
expect \"Re-enter new password:\"
send \"root123\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
 
expect \"Disallow root login remotely?\"
send \"n\r\"
 
expect \"Remove test database and access to it?\"
send \"y\r\"
 
expect \"Reload privilege tables now?\"
send \"y\r\"
 
expect eof
")

sleep 30s

cat <<EOF > /root/.my.cnf
[client]
password="root123"
user=root
[mysqld]
EOF

sleep 10s

mysql -u root -proot123 -e "create database wp_db"
mysql -u root -proot123 -e "create user 'wp_user'@'%' identified by 'wp123'"
mysql -u root -proot123 -e "GRANT ALL ON wp_db.* TO 'wp_user'@'%'"
mysql -u root -proot123 -e "FLUSH PRIVILEGES"
