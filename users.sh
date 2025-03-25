#!/bin/bash

#Скрипт создает отчет о текущих пользователях в системе и сохраняет его в файл user_report.txt. (Отчет  содержит имя пользователя, его UID и время последнего входа).

output_file="user_report.txt"
echo "User  Report" > "$output_file"
echo "===================" >> "$output_file"
cut -d: -f1,3,6 /etc/passwd | while IFS=: read user uid home; do
    last_login=$(last -n 1 "$user" | head -n 1 | awk '{print \$4, \$5, \$6, \$7}')
    echo "$user (UID: $uid) - Last login: $last_login" >> "$output_file"
done

