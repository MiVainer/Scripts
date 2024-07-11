#!/bin/bash

# Исходная и целевая директории
source_directory="$HOME/source_directory"
target_directory="$HOME/target_directory"

# Лог-файл
log_file="$HOME/rsync_log.txt"

# Запуск синхронизации
rsync -av --delete "$source_directory/" "$target_directory/" >> "$log_file" 2>&1

# Проверка результата синхронизации
if [ $? -eq 0 ]; then
    echo "Синхронизация завершена успешно: $(date)" >> "$log_file"
else
    echo "Ошибка синхронизации: $(date)" >> "$log_file"
fi

echo "Синхронизация завершена. Подробности в лог-файле $log_file"
