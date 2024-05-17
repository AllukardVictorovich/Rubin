#!/bin/bash

export MYSQL_PWD="1"

generate_password() {
	password=$(LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c 5)
	echo "$password"
}

do_mysql() {
	mysql -uroot -e "$1"
}

do_mysql "drop database if exists Bd;"
do_mysql "flush privileges;"
do_mysql "create database if not exists Bd;"
do_mysql "create table if not exists Bd.Users ( id integer primary key auto_increment, username varchar(64) not null, password blob not null);"

for ((i=1; i<=10; i++))
do
	username="user$i"
	password=$(generate_password)
	dbname="db$i"
	
	do_mysql "drop user if exists '$username'@'%';"
	do_mysql "CREATE USER IF NOT EXISTS '$username'@'%' IDENTIFIED BY '$password';"
	echo "Created user $username with password: $password"
	do_mysql "create database if not exists $dbname; "
	echo "Database $dbname created"
	do_mysql "GRANT ALL PRIVILEGES ON $dbname.* TO '$username'@'%'";
	echo "Privileges granted to user $username on $dbname"
	do_mysql "insert into Bd.Users (username, password) values ('$username', '$password');"
	echo "User $username inserted into Bd.users"
done

do_mysql "flush privileges;";
