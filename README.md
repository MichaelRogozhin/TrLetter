# TrLetter

Используются:
- Python 3.8
- Django 3.2
- PostgreSQL 10


=====================

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
cd trletter
python manage.py migrate
```
- выполнить скрипт наполнения данных `db/letters.sql`


Запуск:
```
cd trletter
python manage.py runserver
```

http://127.0.0.1:8000/