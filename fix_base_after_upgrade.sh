#!/bin/bash


if [ -z "$DB_ENV_POSTGRES_USER" ]; then
    echo "ERROR: Instalation error, DB_ENV_POSTGRES_USER is not defined"
    exit 1
fi

if [ -z "$DB_PORT_5432_TCP_ADDR" ]; then
    echo "ERROR: Instalation error, DB_PORT_5432_TCP_ADDR is not defined"
    exit 1
fi

if [ -z "$DB_ENV_POSTGRES_PASSWORD" ]; then
    echo "ERROR: Instalation error, DB_ENV_POSTGRES_PASSWORD is not defined"
    exit 1
fi


#### Databases used
database="$1"
if [ -z "$database" ]; then
    echo "ERROR: No database"
    echo "Usage: $0 <database>"
    exit 1
fi

echo -n "Executing script ... for db: $database ... "
PGPASSWORD="$DB_ENV_POSTGRES_PASSWORD" /usr/bin/psql -X -A --quiet -d $database $ --host $DB_PORT_5432_TCP_ADDR --port=5432 --username="$DB_ENV_POSTGRES_USER" -t -c "UPDATE public.ir_ui_view set active = false where id = 3541;"
PGPASSWORD="$DB_ENV_POSTGRES_PASSWORD" /usr/bin/psql -X -A --quiet -d $database $ --host $DB_PORT_5432_TCP_ADDR --port=5432 --username="$DB_ENV_POSTGRES_USER" -t -c "UPDATE public.ir_ui_view set active = false where id = 4363;"
PGPASSWORD="$DB_ENV_POSTGRES_PASSWORD" /usr/bin/psql -X -A --quiet -d $database $ --host $DB_PORT_5432_TCP_ADDR --port=5432 --username="$DB_ENV_POSTGRES_USER" -t -c "UPDATE public.ir_ui_view set active = false where id = 4366;"
error=$?; if [ $error -eq 0 ]; then echo "OK"; else echo "ERROR: $error"; fi

