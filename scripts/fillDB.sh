#!/usr/bin/env bash
set -Eeuo pipefail # Параметры выполнения скрипта

# Параметры подключения к БД
dbName="gep2";
dbUser="postgres";
dbHost="";
dbPort="";

# Проверка подключения к базе данных
if psql -d $dbName -U $dbUser &> .Connect.log <<< "\q";
then
	echo "Success";
else
	echo "Error";
fi;

echo "Filling...";
psql -d $dbName -U $dbUser -f fillDB.sql -p $dbPort &> .fillDB.log

if  grep -i -q "error" .fillDB.log;
then
	echo -n "Script error: ";
	grep -c -i "error" .fillDB.log;
	exit;
fi;

echo "Success";

