#!/bin/bash

# Название процесса для мониторинга
PROCESS_NAME="apache2"
# Электронная почта для уведомления
EMAIL="your_email@example.com"

# Проверка, запущен ли процесс
if ! pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "Процесс $PROCESS_NAME не запущен!" | mail -s "Process Alert: $PROCESS_NAME" "$EMAIL"
    echo "Уведомление отправлено на $EMAIL."
else
    echo "Процесс $PROCESS_NAME работает нормально."
fi
