#!/bin/bash

# Локальная директория для синхронизации
LOCAL_DIR="/path/to/local/dir"

# Удалённый сервер и директория
REMOTE_USER="user"
REMOTE_SERVER="server.com"
REMOTE_DIR="/path/to/remote/dir"

# Синхронизация с удалённым сервером
rsync -avz $LOCAL_DIR $REMOTE_USER@$REMOTE_SERVER:$REMOTE_DIR

# Вывод сообщения о завершении
echo "Синхронизация завершена!"
