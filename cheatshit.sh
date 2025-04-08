#!/bin/bash

tput civis                          
tput smcup                          
tput cup 0 0           

trap 'tput rmcup;tput cvvis' EXIT    

echo 'Hello,this is Cheat-Shit'
echo '------------------------'
echo 'а тут можешь написать всё, что захочешь'
echo '------------------------'
echo 'source: https://t.me/bashdays'

read -srn1 -t 0.7

while read -srn1 -t 0.1 
do
:
done
exit 

