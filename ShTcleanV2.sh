#!/bin/bash

# Скрипт для автоматического удаления файлов в указанных каталогах ежедневно в заданное время
# удаляет файлы старше заданного количества дней


# Параметры
TARGET_DIRS=("/home/mihail/test" "/home/mihail/test1") # Укажите каталоги для очистки
DELETE_DAYS=1 # Укажите количество дней, старше которых файлы будут удалены

# Функция для удаления старых файлов
cleanup_old_files() {
    for dir in "${TARGET_DIRS[@]}"; do
        if [ -d "$dir" ]; then
            echo "Очистка каталога: $dir"
            find "$dir" -type f -mtime +$DELETE_DAYS -delete
            echo "Файлы старше $DELETE_DAYS дней удалены из $dir"
        else
            echo "Каталог $dir не найден."
        fi
    done
}

# Запуск функции очистки
cleanup_old_files



# после написания скрипта вводим команду crnotab -e, вставляем следующую строку:
# запуск скрипта ежеднено в 8 часов 30 минут утра (можете заменить время на необходимое)
#30 8 * * * /usr/bin/ShTclean.sh
