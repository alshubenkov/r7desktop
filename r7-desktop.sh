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
 echo "Определена ОС семейства АЛЬТ Линукс"
 echo ""
 # Проверка на ROOT пользователя
  if [[ $EUID -ne 0 ]]; then
    echo "Этот скрипт должен быть запущен с правами ROOT"
    echo "Введите ниже команду:"
    echo "su -"
    echo "и пароль пользователя ROOT"
    exit 1
  fi
 
 echo "Запуск обновления пакетов"
 apt-get update -y
 echo "Установка зависимостей"
 apt-get install -y wget fonts-ttf-dejavu fonts-ttf-google-crosextra-carlito fonts-ttf-liberation glibc gst-libav gst-plugins-ugly1.0 libX11 libXScrnSaver libcairo libgcc1 libgtk+2 libgtkglext
 echo "Получение скрипта из репозитория Р7"
 wget https://download.r7-office.ru/altlinux/r7-office.rpm
 echo "Установка r7-office desktop"
 rpm -i r7-office.rpm
 echo "Выход из учетной записи ROOT"
 exit
 echo "Запуск Р7 Офис Десктоп, не забудьте установить лицензию"
 r7-office
 ;;

esac
