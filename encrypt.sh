#!/bin/bash

# Директория с файлами
TARGET_DIR="$HOME/Documents"

# Получатель (ключ GPG)
RECIPIENT="your_email@example.com"

# Поиск всех файлов в директории и их шифрование
find "$TARGET_DIR" -type f | while read -r file; do
    gpg --output "${file}.gpg" --encrypt --recipient "$RECIPIENT" "$file"
    echo "Файл $file зашифрован и сохранен как ${file}.gpg"
done
