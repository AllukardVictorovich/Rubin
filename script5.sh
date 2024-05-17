#!/bin/bash

export MYSQL_PWD="1"

BACKUP_DIR="/home/mironovad/PR08"
DB_NAME="Bd"

latest_backup=$(ls -t "$BACKUP_DIR"/*.sql | head -n 1)
BACKUP_DIR="/home/mironovad/PR08"

mysqladmin create $DB_NAME
mysql -uroot $DB_NAME < "$latest_backup"
