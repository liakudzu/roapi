#!/bin/bash
# Тест скорости PostgreSQL напрямую
echo "1. Прямой запрос к PostgreSQL:"
time psql -d mydatabase -U postgres -c "SELECT COUNT(*) FROM mytable"

echo -e "\n2. Только первичный ключ:"
time curl -s -X POST -d "SELECT id FROM mytable LIMIT 1000000" http://localhost:8080/api/sql > /dev/null

echo -e "\n3. Только 2 колонки:"
time curl -s -X POST -d "SELECT id, name FROM mytable LIMIT 1000000" http://localhost:8080/api/sql > /dev/null
