#!/bin/bash

# URL сайта для проверки
URL="https://example.com"
# Электронная почта для уведомлений
EMAIL="your_email@example.com"

# Проверка доступности сайта
if ! curl -s --head "$URL" | grep "200 OK" > /dev/null; then
    echo "Веб-сайт $URL недоступен!" | mail -s "Website Down Alert: $URL" "$EMAIL"
    echo "Уведомление отправлено на $EMAIL."
else
    echo "Веб-сайт $URL доступен."
fi
