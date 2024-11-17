#!/bin/bash

# Порог температуры в градусах Цельсия
TEMP_THRESHOLD=75
# Электронная почта для уведомлений
EMAIL="your_email@example.com"

# Получение текущей температуры процессора
CPU_TEMP=$(sensors | grep 'Core 0:' | awk '{print $3}' | sed 's/+//; s/°C//')

# Проверка, превышает ли температура порог
if (( ${CPU_TEMP%.*} > TEMP_THRESHOLD )); then
    echo "Температура процессора превышает $TEMP_THRESHOLD°C! Текущая температура: $CPU_TEMP°C" | mail -s "CPU Temperature Alert" "$EMAIL"
    echo "Уведомление о температуре отправлено на $EMAIL."
else
    echo "Температура процессора в норме: $CPU_TEMP°C."
fi
