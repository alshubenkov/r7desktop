#!/bin/bash
set -e
set -o pipefail -e
# Запись лог файла установки
exec > >(tee file.log) 2>&1
# Функция для выхода из скрипта при ошибке
err()
    {
    echo -e "* Error: $1"
    exit 1
    }


echo "Скрипт автоматической установки R7-Office Desktop"
echo ""
# Проверка какой Дистрибутив ОС Линукс
# cat /etc/*-release

os_type=`cat /etc/*-release | grep ^ID= | tr -d '"' | awk '{print substr ($ 0, 4)}'`

echo "Определена ОС Линукс семейства:"
echo "$os_type"

#echo "Проверка связи с сервером download.r7-office.ru"
#ping -c 5 download.r7-office.ru || err "Нет связи с сервером загрузок Р7, проверьте настройки соединения"


case "$os_type" in
######## Блок кода для Астра
 "astra" )
 echo "ОПределена ОС семейства Астра Линукс"
 echo "Запуск обновления системы"
 sudo apt-get update -y && sudo apt-get dist-upgrade -y
 echo "Установка зависимостей"
 sudo apt-get install -y fonts-crosextra-carlito fonts-dejavu fonts-liberation fonts-opensymbol \
 curl gstreamer1.0-libav gstreamer1.0-plugins-ugly libasound2 libc6 libcairo2 libgcc1 libgconf-2-4 \
 libgtk-3-0 libstdc++6 libx11-6 libxss1 x11-common xdg-utils 
 echo "Скачивание дистрибутива"
 wget -N https://download.r7-office.ru/astra/r7-office.deb 
 echo "Установка r7 desktop"
 sudo dpkg -i -E r7-office.deb
 echo "Установка завершена успешно"
 echo "Запустите Р7 Офис Десктоп, не забудьте установить лицензию"
 ;;
######### Конец блока кода для Астра

######## Блок кода для РЕДОС
 "redos" )
 echo "ОПределена ОС семейства РЕДОС Линукс"
 #Установка Р7-Десктоп на РЕДОС
 # Обновление системы
 echo "Запуск обновления системы"
 sudo yum update -y 
 echo "Установка зависимостей"
 sudo yum install -y http://li.nux.ro/download/nux/dextop/el7/x86_64//gstreamer1-libav-1.0.6-1.el7.nux.x86_64.rpm 
 echo "Скачивание дистрибутива"
 wget  -N https://download.r7-office.ru/centos/r7-office.rpm 
 echo "Установка r7 desktop"
 sudo yum install -y r7-office.rpm 
 echo "Установка завершена успешно"
 echo "Запустите Р7 Офис Десктоп, не забудьте установить лицензию"
 ;;
######### Конец блока кода для РЕДОС

######### Блок кода для РОСА
 "rosa" )
 echo "ОПределена ОС семейства РОСА Линукс"
 echo "Запуск обновления системы"
 sudo urpmi --auto-update --auto
 echo "Установка r7 desktop"
 sudo urpmi --auto https://download.r7-office.ru/rosa/r7-office.rpm
 echo "Установка завершена успешно"
 echo "Запустите Р7 Офис Десктоп, не забудьте установить лицензию"
 ;;
######### Конец блока кода для РОСА

######### Блок кода для Альт
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
 apt-get update -y && apt-get dist-upgrade -y
 echo "Установка зависимостей"
 apt-get install -y wget fonts-ttf-dejavu fonts-ttf-google-crosextra-carlito fonts-ttf-liberation \
 glibc gst-libav gst-plugins-ugly1.0 libX11 libXScrnSaver libcairo libgcc1 libgtk+2 libgtkglext 
 echo "Получение скрипта из репозитория Р7"
 wget -N https://download.r7-office.ru/altlinux/r7-office.rpm
 echo "Установка r7-office desktop" 
 rpm -i r7-office.rpm
 echo "Установка завершена успешно"
 echo "Запустите Р7 Офис Десктоп, не забудьте установить лицензию"
  ;;
######### Конец блока кода для Альт
esac
set +e
set +o pipefail +e
