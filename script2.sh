#!/bin/bash

export MYSQL_PWD="1"

do_mysql() {
	mysql -uroot -e "$1"
}

do_mysql "update Bd.Users set password = AES_ENCRYPT(password, 'key');"
