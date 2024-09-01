#!/bin/bash

# Настройки
LOG_DIR="/var/log/myapp"
BACKUP_DIR="$HOME/log_backups"
REMOTE_USER="remote_user"
REMOTE_HOST="remote_host"
REMOTE_DIR="/path/to/remote/backup"
TIMESTAMP=$(date +"%F")
ARCHIVE_NAME="logs_$TIMESTAMP.tar.gz"

# Создание директории для резервных копий, если она не существует
mkdir -p "$BACKUP_DIR"

# Сжатие логов
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" .

# Отправка архива на удалённый сервер
scp "$BACKUP_DIR/$ARCHIVE_NAME" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

# Уведомление о завершении
echo "Логи из $LOG_DIR были сжаты и отправлены на $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/$ARCHIVE_NAME"
