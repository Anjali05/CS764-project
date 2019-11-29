#!/bin/bash --

sqlite3 -batch ssb-100.db << "EOF"
.import /Users/Sakshi/Documents/UWAcads/Sem1/projects/cs764/SQL-benchmark/ssb-100/customer.tbl customer
EOF
