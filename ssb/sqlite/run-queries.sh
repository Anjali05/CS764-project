#!/usr/bin/env bash

source config.sh

for i in `seq -f "%02g" 1 13`; do
    echo "QUERY ${i}"
    for j in `seq 1 5`; do
        echo "Run ${j}"
        query_file="${i}.sql"
        query=`cat "queries/${query_file}"`
        explain_query="EXPLAIN ${query}"
        $SQLITE_EXEC $SQLITE_DB_PATH <<EOF
.timer on
$query
EOF
    done;
done;
