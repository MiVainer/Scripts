#!/bin/bash

# Статус блокировки (вкл/выкл)
ACTION=$1

# Блокировка или разблокировка USB-портов
if [ "$ACTION" == "lock" ]; then
    echo "0" | sudo tee /sys/bus/usb/drivers/usb/bind >/dev/null
    echo "USB порты заблокированы."
elif [ "$ACTION" == "unlock" ]; then
    echo "1" | sudo tee /sys/bus/usb/drivers/usb/unbind >/dev/null
    echo "USB порты разблокированы."
else
    echo "Используйте: $0 lock | unlock"
fi
