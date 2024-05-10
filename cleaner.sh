#!/bin/bash
set -e
DIR="/var/log"
find $DIR -name "*.log.*" -exec echo "Удаляю-" {} \;
find $DIR -name "*.log.*" -exec rm {} \;
echo "Очистка хлама завершена!"


