#!/bin/bash

# Директория для мониторинга
TARGET_DIR="$HOME/Downloads"

# Максимальный размер файла в мегабайтах
MAX_SIZE=100

# Поиск и удаление файлов, превышающих размер
find "$TARGET_DIR" -type f -size +"${MAX_SIZE}M" -exec rm -v {} \;

echo "Все файлы, превышающие ${MAX_SIZE}MB, были удалены из $TARGET_DIR."
