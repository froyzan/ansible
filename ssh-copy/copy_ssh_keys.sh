#!/bin/bash

# Имя пользователя и пароль для доступа к серверам
USERNAME="froyzan"
PASSWORD="password"

# Файл со списком серверов
SERVER_LIST="server_list.txt"

# Убедитесь, что файл со списком серверов существует
if [[ ! -f $SERVER_LIST ]]; then
    echo "Файл $SERVER_LIST не найден!"
    exit 1
fi

# Установка sshpass, если необходимо (для автоматического ввода пароля)
if ! command -v sshpass &> /dev/null; then
    echo "Установка sshpass..."
    sudo apt-get install -y sshpass
fi

# Цикл по каждому серверу в списке
while read -r SERVER; do
    echo "Копирование ключа на $SERVER..."
    
    # Добавление IP-адреса в known_hosts
    ssh-keyscan -H "$SERVER" >> ~/.ssh/known_hosts

    # Копирование публичного ключа с помощью ssh-copy-id
    sshpass -p "$PASSWORD" ssh-copy-id -o StrictHostKeyChecking=no "$USERNAME@$SERVER"

    echo "Ключ успешно скопирован на $SERVER и добавлен в known_hosts."
done < "$SERVER_LIST"

echo "Ключи успешно скопированы на все сервера."

