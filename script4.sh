#!/bin/bash

export MYSQL_PWD="1"

DB_NAME="Bd"
BACKUP_DIR="/home/mironovad/PR08"
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).sql"

mkdir -p "$BACKUP_DIR"

mysqldump -uroot "$DB_NAME" > "$BACKUP_FILE"
