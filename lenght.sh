#!/bin/bash


longest=0
for word in $(<password)
do
    len=${#word}
    if (( len > longest ))
    then
        longest=$len
        longword=$word
    fi
done
printf 'Самое длинное слово %s и его длина %d.\n' "$longword" "$longest"
