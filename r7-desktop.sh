#!/bin/bash

echo "Скрипт автоматической установки R7-Office Desktop"
echo ""
# Проверка какой Дистрибутив ОС Линукс
# cat /etc/*-release

os_type=`cat /etc/*-release | grep ^ID= | tr -d '"' | awk '{print substr ($ 0, 4)}'`

echo "$os_type"

case "$os_type" in

 "astra" )
 echo "ОПределена ОС семейства Астра Линукс"
 ;;

 "redos" )
 echo "ОПределена ОС семейства РЕДОС Линукс"
 ;;

 "rosa" )
 echo "ОПределена ОС семейства РОСА Линукс"
 ;;

 "altlinux" )
 echo "ОПределена ОС семейства ОС Линукс"
 ;;

esac
