=============Steps for setting up DB and running benchmarks=============
### Follow the steps below for generating db for SSB and TBC-H:
* Clone https://github.com/electrum/ssb-dbgen for SSB and https://github.com/electrum/tpch-dbgen for TPCH.
* run `make clean` from inside the cloned repositories.
* run `make all`.
* run `./dbgen -s <scale_factor> -T a` to generate tables. We have used 1 for TPC-H and 4 for SSB. 



### Follow the steps for running benchmarks on PostgreSQL 
* Change the path SSB_TABLE_FILES_DIR in ssb/postgres/config.sh and TPCH_TABLE_FILES_DIR in ssb/postgres/config.sh  to point to local SSB and TPC-H directories respectively db location. 
* run `./load.sh` (This creates the schema and loads data into the schema in PG and adds foreign key constraints.)

Note: Data in the existing table files may not adhere to Postgres formatting due to stray ‘|’ at the end of rows. Use `"for i in `ls *.tbl`; do sed 's/|$//' $i > ${i/tbl/csv}; echo $i; done;”` to format the data.  

* Run queries using `./run-queries.sh`


### Follow the steps for running benchmarks on SQLite   
* Change the path SSB_TABLE_FILES_DIR in ssb/sqlite/config.sh and TPCH_TABLE_FILES_DIR in ssb/sqlite/config.sh  to point to local SSB and TPC-H directories respectively db location.  
* Change SQLITE_DB_PATH path in ssb/sqlite/config.sh and  tpch/sqlite/config.sh to point to desired location of sqlite db creation.  
* run `./load.sh`. This will generate the .db files for sqlite.  
* run queries `./run-queries.sh`
