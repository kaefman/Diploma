#!/usr/bin/env bash
set -Eeuo pipefail # Параметры выполнения скрипта

# Параметры подключения к БД
dbName="gep2";
dbUser="postgres";
dbHost="";
dbPort="";

# Удаление старой БД, если она существует
echo "Deleting database if exists...";
dropdb --if-exists $dbName -U $dbUser -h $dbHost -p $dbPort &> .Drop.log

# Проверка на корректность удаления БД
if  grep -i -q "error" .Drop.log;
then
	echo -n "Dropping error: ";
	grep -c -i "error" .Drop.log;
	exit;
fi;


# Создание новой БД
echo "Creating database...";
createdb $dbName -U $dbUser -h $dbHost -p $dbPort &> .Create.log

# Проверка на корректность создания БД
if  grep -i -q "error" .Create.log;
then
	echo -n "Creation error: ";
	grep -c -i "error" .Create.log;
	exit;
fi;


# Скрипт SQL
echo "Generating database tables and relationships...";
psql -d $dbName -U $dbUser -f makeDB.sql -p $dbPort &> .makeDB.log

if  grep -i -q "error" .makeDB.log;
then
	echo -n "Script error: ";
	grep -c -i "error" .makeDB.log;
	exit;
fi;

echo "Success";
