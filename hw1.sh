#!/bin/bash

# Проверяем наличие аргумента -d для определения корневого каталога
if [[ "$1" == "-d" ]]; then
    root_dir="$2"
else
    read -p "Введите путь до корневого каталога: " root_dir
fi

# Проверяем, существует ли указанный корневой каталог
if [[ ! -d "$root_dir" ]]; then
    echo "Указанный корневой каталог не существует."
    exit 1
fi

# Создаем директории для всех пользователей
for user in $(cut -d: -f1 /etc/passwd); do
    user_dir="$root_dir/$user"
    
    # Создаем директорию пользователя, если она еще не существует
    if [[ ! -d "$user_dir" ]]; then
        mkdir -p "$user_dir"
    fi
    
    # Устанавливаем права 755 для директории
    chmod 755 "$user_dir"
    
    # Устанавливаем владельца директории соответствующим пользователем
    chown "$user:$user" "$user_dir"
    
    # Записываем лог в stdout и в файл
    echo "Создана директория $user_dir и установлены права 755." | tee -a script_log.txt
done
