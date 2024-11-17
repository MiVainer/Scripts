#!/bin/bash

# Порог свободного места (в процентах)
THRESHOLD=10

# Получение процента свободного места на корневом разделе
FREE_SPACE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

# Если свободное место меньше порога, отправить уведомление
if [ "$FREE_SPACE" -lt "$THRESHOLD" ]; then
    echo "Свободного места на диске менее $THRESHOLD%. Осталось: $FREE_SPACE%" | mail -s "Disk Space Alert" your_email@example.com
fi
