#!/bin/bash

# Параметры базы данных
db_name="mydatabase"
db_user="myuser"
db_password="mypassword"
backup_dir="$HOME/db_backups"
backup_file="$backup_dir/${db_name}_$(date +%Y%m%d%H%M%S).sql"

# Создание каталога для резервных копий, если он не существует
mkdir -p "$backup_dir"

# Создание резервной копии базы данных
mysqldump -u "$db_user" -p"$db_password" "$db_name" > "$backup_file"

# Проверка результата резервного копирования
if [ $? -eq 0 ]; then
    echo "Резервное копирование базы данных завершено успешно: $(date)" >> "$backup_dir/backup_log.txt"
else
    echo "Ошибка резервного копирования базы данных: $(date)" >> "$backup_dir/backup_log.txt"
fi

echo "Резервная копия базы данных создана: $backup_file"
