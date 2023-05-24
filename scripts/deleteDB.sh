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
