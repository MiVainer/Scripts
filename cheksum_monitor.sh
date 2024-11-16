#!/bin/bash

# Директория для мониторинга
WATCH_DIR="/etc/myapp/config"

# Файл для хранения контрольных сумм
CHECKSUM_FILE="$HOME/config_checksums.txt"

# Получение текущих контрольных сумм файлов
find "$WATCH_DIR" -type f -exec sha256sum {} \; > "$CHECKSUM_FILE.new"

# Проверка на изменения
if [ -f "$CHECKSUM_FILE" ]; then
  CHANGES=$(diff "$CHECKSUM_FILE" "$CHECKSUM_FILE.new")
  if [ -n "$CHANGES" ]; then
    echo "Конфигурационные файлы изменены!" | mail -s "Уведомление: изменения конфигурации" your_email@example.com
  fi
fi

# Обновление файла контрольных сумм
mv "$CHECKSUM_FILE.new" "$CHECKSUM_FILE"
