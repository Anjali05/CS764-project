#!/usr/bin/env bash

source config.sh

table_list=(
    part
    supplier
    customer
    ddate
    lineorder
)

echo "Creating SSB tables..."
$SQLITE_EXEC $SQLITE_DB_PATH < ./create.sql
echo "Creating database is done."

for table_name in "${table_list[@]}"; do
    echo "Importing table ${table_name} ..."
    table_file_path="${SSB_TABLE_FILES_DIR}/${table_name}.tbl"
    $SQLITE_EXEC $SQLITE_DB_PATH <<EOF
.timer on
.import ${table_file_path} ${table_name}
EOF
done
echo "Importing is done."

echo "Analyzing the database..."
$SQLITE_EXEC $SQLITE_DB_PATH <<EOF
ANALYZE
EOF
echo "Analyzing is done."
