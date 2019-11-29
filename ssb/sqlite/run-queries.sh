#!/usr/bin/env bash

source config.sh

for i in `seq -f "%02g" 1 13`; do
    echo "QUERY ${i}"
    for j in `seq 1 5`; do
        echo "Run ${j}"
        query_file="${i}.sql"
        query=`cat "${query_file}"`
        explain_query="EXPLAIN ${query}"
        $POSTGRES_EXEC $POSTGRES_DB_NAME <<EOF
.timer on
$query
EOF
    done;
done;
