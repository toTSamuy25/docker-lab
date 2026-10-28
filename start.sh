#!/bin/bash
# Запускаем службу базы данных в фоне
service mariadb start
# Запускаем веб-сервер в foreground (чтобы контейнер не закрылся)
nginx -g "daemon off;"