# r7desktop
Скрипт автоматической установки r7-desktop на следующие версии linux.

Альт Линукс
Астра Линукс
ROSA
RedOS

На всех перечисленных ОС должно быть развернуто графическое окружение, настроена сеть и организован доступ в интернет.

При установке на Альт Линукс нужно, 
ввести команду
su -
и пароль root,
так как установка ОС по умолчанию не имеет настроек sudo.
На Astra, Redos, ROSA нужно чтобы установка была из-под учетной записи входящей в группу SUDO.
Как использовать:
- Скачать архив по ссылке https://github.com/alshubenkov/r7desktop/archive/refs/heads/main.zip
- Распаковать командой 
unzip r7desktop-main.zip

- Зайти в каталог командой 
cd r7desktop-main
- дать право на выполнение командой 
chmod +x r7desktop.sh

- запустить скрипт командой 
./r7desktop.sh

Скрипт автоматически определяет тип ОС Линукс, обновляет пакеты и начинает автоматическое развертывание Р7-Офис Десктоп со всеми зависимостями.
Если запуск скрипта будет на ОС, отличных от перечисленных скрипт просто выведет семейства ОС и не будет ничего делать.
