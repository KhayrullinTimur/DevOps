# Используем базовый образ Debian
FROM debian:latest

# Указываем автора
MAINTAINER Хайруллин Тимур <goku@gmail.com>

# Обновляем список пакетов и устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y apt-utils

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Устанавливаем переменные окружения для MariaDB
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Копируем конфигурационные файлы Apache
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Копируем скрипт для инициализации базы данных
COPY init-db.sh /docker-entrypoint-initdb.d/

# Определяем рабочую директорию
WORKDIR /var/www/html

# Копируем файлы веб-приложения в контейнер
COPY . /var/www/html

# Открываем порты для Apache и MariaDB
EXPOSE 80 3306

# Добавляем точку монтирования для данных MariaDB
VOLUME /var/lib/mysql

# Указываем пользователя, под которым будет работать контейнер
USER www-data

# Определяем команду для запуска контейнера
CMD ["sh", "-c", "service apache2 start && service mysql start && tail -f /dev/null"]

