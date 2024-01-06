# TrLetter

Используются:
- Python 3.8
- Django 3.2
- PostgreSQL 10


Deploy and run on Windows
=========================

Создание виртуального окружения Python:
`python -m venv venv`

Активация виртуального окружения:
`venv\scripts\activate.bat`

Установка пакетов:
`pip install -r requirements.txt`

Создание базы данных Postgres:

В DBeaver:
- создать базу данных `trletterdb`
- создать пользователя(роль) `trletteruser` с паролем `12345678`
Все параметры по умолчанию
- выполнить миграции
```
python manage.py migrate
```
- выполнить скрипт наполнения данных `db/letters.sql`


Запуск:
```
python manage.py runserver
```

http://127.0.0.1:8000/


Deploy on Linux
===============

```
cd /opt
git clone https://github.com/MichaelRogozhin/TrLetter.git

apt install postgresql  (на Debian11 в январе 2024 поставилась версия 13.13)
su - postgres -c psql

    CREATE DATABASE trletterdb;
    \l
    CREATE ROLE trletteruser WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION NOBYPASSRLS CONNECTION LIMIT -1;
    или (короче)
    CREATE ROLE trletteruser WITH NOINHERIT LOGIN PASSWORD '12345678';
    \du[S+]
    \q

cd TrLetter
python3  (3.9.2)
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
nano /etc/postgresql/13/main/pg_hba.conf
    заменить
    local   all             all                                     peer
    на
    local   all             all                                     md5
    (созданного пользователя trletteruser нет как системного пользователя, поэтому peer не работает)
cd trletter
python manage.py migrate

su - postgres -c psql

    \c trletterdb
    INSERT INTO public.main_letter (id, typel, subject, body, dt, count_open, count_send, shop_id) VALUES (1, 1, 'Тема1', 'Текст письма 1', '2019-11-02 21:19:05.655288+03', 10, 1, NULL), (2, 1, 'Тема2', 'Текст письма 2', '2019-11-02 21:19:59.621375+03', 15, 1, 345), (3, 2, 'Тема3', 'Текст письма 3', '2019-11-02 21:21:34.914826+03', 20, 2, 26), (4, 3, 'Тема4', 'Текст письма 4', '2019-11-02 23:49:44.754295+03', 25, 2, NULL);
    ALTER SEQUENCE public.main_letter_id_seq RESTART 5;

nano trletter/settings.py
    поправить ALLOWED_HOSTS например на ['*']
python manage.py runserver 0.0.0.0:8000

в браузере на любой машине
http://<адрес_сервера>:8000/
```

Доставить для продакшн (gunicorn, nginx)
----------------------------------------

```
1) gunicorn

pip install gunicorn

Нужно настроить автозапуск gunicorn через sytemd.
См. https://docs.gunicorn.org/en/latest/deploy.html или мой файл gunicorn.txt

Кратко. Создаются файлы
/etc/systemd/system/gunicorn.service
    WorkingDirectory=/opt/TrLetter/trletter
    ExecStart=/opt/TrLetter/venv/bin/gunicorn trletter.wsgi
/etc/systemd/system/gunicorn.socket

systemctl enable --now gunicorn.socket
После этого gunicorn работает как обычный сервис (systemctl status/start/stop/restart)

2) nginx

sudo apt update
sudo apt install nginx


в nginx sites-enabled/default надо добавить
        location / {
            proxy_pass http://unix:/run/gunicorn.sock;
        }
        location /static/ {
            root /opt/TrLetter/trletter/main/;
            expires 1d;
        }

nginx -t
systemctl restart nginx
```
