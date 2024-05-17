#!/bin/bash

export MYSQL_PWD="1"

do_mysql() {
	mysql -uroot -e "$1"
}

do_mysql "select username, CAST(AES_DECRYPT(password, 'key') AS CHAR) as password from Bd.Users;"
