#!/bin/bash

set -e


MONTH=$(date +%m) #1

NEW_LINUX_PASSWORD=$(head -n $MONTH password | tail -n 1) #2

chpasswd <<<"ksdo001:${NEW_LINUX_PASSWORD}" #3

echo "Новый пароль пользователя ksdo001 - ${NEW_LINUX_PASSWORD}" #4

