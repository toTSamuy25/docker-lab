# Базовая операционная система
FROM ubuntu:22.04

# Отключаем интерактивный режим при установке пакетов
ENV DEBIAN_FRONTEND=noninteractive

# Обновляем списки пакетов, устанавливаем Nginx и MariaDB, 
# создаем недостающую директорию и назначаем права
RUN apt-get update && \
    apt-get install -y nginx mariadb-server && \
    apt-get clean && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# Копируем скрипт запуска в образ
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Открываем порты для веб-сервера и базы данных
EXPOSE 80 3306

# Команда, которая выполнится при старте контейнера
CMD ["/start.sh"]