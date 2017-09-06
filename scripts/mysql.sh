#!/usr/bin/env bash
mysql_root_pwd=$1

sudo apt-get -y install zsh htop
sudo echo "mysql-servermysql-server/root_password password $mysql_root_pwd" | sudo debconf-set-selections
sudo echo "mysql-server mysql-server/root_password_again password $mysql_root_pwd" | sudo debconf-set-selections
sudo apt-get -y install mysql-server
sudo apt-get update > /dev/null
/usr/bin/mysqld_safe &
sleep 5

echo "CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'secret';" | mysql --user=root --password=$mysql_root_pwd=$1

echo "CREATE DATABASE IF NOT EXISTS micro_service_1 DEFAULT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci';" | mysql --user=root --password=$mysql_root_pwd

echo "CREATE DATABASE IF NOT EXISTS micro_service_2 DEFAULT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci';" | mysql --user=root --password=$mysql_root_pwd

echo "GRANT SELECT, LOCK TABLES, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON micro_service_1.* TO 'testuser'@'localhost';" | mysql --user=root --password=$mysql_root_pwd

echo "GRANT SELECT, LOCK TABLES, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON micro_service_2.* TO 'testuser'@'localhost';" | mysql --user=root --password=$mysql_root_pwd


