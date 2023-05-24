# Ключевые моменты работы с БД в VP

## 1. Создание БД

Создать БД:

- Project → New;

- Diagram → New;

- Создание таблиц и связей (панель слева).



Настроить подключение к PostgreSQL:

- Tools → DB → Database Configuration... - установить значок PostgreSQL

- Скачать драйвер

- Test connection (Hostname: localhost; Database name: gep2)

## 2. Открытие созданной базы postgres в VP

- Tools → DB → Database Configuration... - установить значок PostgreSQL

- Скачать драйвер

- Test connection (Hostname: localhost; Database name: gep2) - все должно быть успешно

- Tools → DB → Reverse Database… - развернуть БД; выбрать сущности, которые нужно визуализировать.

## 3. Генерация базы данных PostgreSQL

Сгенерировать базу данных Postgres по созданной схеме:
- Tools → DB → Generate Database…
