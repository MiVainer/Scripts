#!/bin/bash

SYMBOLS=""
for symbol in {A..Z} {a..z} {0..9}; do SYMBOLS=$SYMBOLS$symbol; done
SYMBOLS=$SYMBOLS'!@#$%&*()?/\[]{}-+_=<>.,'
# Строка со всеми символами создана.
# Теперь нам надо в цикле с количеством итераций равным длине пароля
# случайным образом взять один символ и добавить его в строку, содержащую пароль.
PWD_LENGTH=8  # длина пароля
PASSWORD1=""    # переменная для хранения пароля АПТГ
PASSWORD2="" # переменная для хранения пароля АТС
RANDOM=256     # инициализация генератора случайных чисел
for i in `seq 1 $PWD_LENGTH`
do
PASSWORD1=$PASSWORD1${SYMBOLS:$(expr $RANDOM % ${#SYMBOLS}):1}
PASSWORD2=$PASSWORD2${SYMBOLS:$(expr $RANDOM % ${#SYMBOLS}):1}

done
echo Сгенерирован пароль для АПТГ - $PASSWORD1
echo Сгенерирован пароль для АТС - $PASSWORD2

