#!/bin/bash

err() { echo -e "* Error: $1"; exit 1; }

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
    echo "Выполните следующие действия:"
    echo "1. Введите команду  su -"
    echo "2. Введите пароль пользователя ROOT"
    echo "3. Перейдите в каталог, введите"
    echo "     cd `pwd`"
    echo "и запустите скрипт снова"
    echo "bash r7-desktop.sh"
    exit 1
  fi
 # 
 echo "Запуск обновления пакетов"
 apt-get update -y || err "ошибка apt-get update -y"
 echo "Установка зависимостей"
 apt-get install -y wget fonts-ttf-dejavu fonts-ttf-google-crosextra-carlito fonts-ttf-liberation glibc gst-libav gst-plugins-ugly1.0 libX11 libXScrnSaver libcairo libgcc1 libgtk+2 libgtkglext || err "ошибка apt-get install -y"
 echo "Получение скрипта из репозитория Р7"
 wget https://download.r7-office.ru/altlinux/r7-office.rpm || err "ошибка wget https://download.r7-office.ru/altlinux/r7-office.rpm"
 echo "Установка r7-office desktop" 
 rpm -i r7-office.rpm || err "ошибка установки r7-office.rpm"
 echo "Выход из учетной записи ROOT"
 exit
 echo "Запустите Р7 Офис Десктоп, не забудьте установить лицензию"
 ;;

esac
