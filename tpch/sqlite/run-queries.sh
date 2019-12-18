#!/usr/bin/env bash

source config.sh

for i in `seq -f "%02g" 1 22`; do
    echo "QUERY ${i}"
    for j in `seq 1 5`; do
        echo "Run ${j}"
        query_file="queries/${i}.sql"
        query=`cat "${query_file}"`
        explain_query="EXPLAIN ${query}"
        $SQLITE_EXEC $SQLITE_DB_PATH <<EOF
.timer on
$query
EOF
    done;
done;