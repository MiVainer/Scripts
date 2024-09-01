#!/bin/bash

# Путь к отслеживаемому каталогу
WATCHED_DIR="/path/to/watched/directory"

# Путь для сохранения резервных копий
BACKUP_DIR="/path/to/backup/directory"

# Функция для создания резервной копии
backup() {
  TIMESTAMP=$(date +%Y%m%d_%H%M%S)
  tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" -C "$WATCHED_DIR" .
  echo "Backup created at $BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
}

# Использование inotifywait для мониторинга изменений в каталоге
inotifywait -m -r -e modify -e move -e create -e delete "$WATCHED_DIR" --format '%T %w %f %e' --timefmt '%Y-%m-%d %H:%M:%S' |
while read date time dir file event
do
  echo "Detected $event on $file at $date $time"
  backup
done
