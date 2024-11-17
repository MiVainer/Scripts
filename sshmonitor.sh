#!/bin/bash

# Электронная почта для уведомлений
EMAIL="your_email@example.com"

# Информация о входе
USER=$(whoami)
IP=$(echo $SSH_CLIENT | awk '{print $1}')
TIME=$(date)

# Проверка, идет ли работа через SSH
if [ -n "$SSH_CLIENT" ]; then
    echo "Пользователь $USER вошел через SSH с IP $IP в $TIME" | mail -s "SSH Login Alert" "$EMAIL"
    echo "Уведомление о входе отправлено на $EMAIL."
else
    echo "Это не SSH-сессия."
fi
