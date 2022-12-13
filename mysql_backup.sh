#!/bin/bash
# adding client config file  with mesql username & password /home/admin/my_sql.cnf like:
#[client]
#user = "some"
#password = "very complex"

MYSQL='mysql --defaults-extra-file=/root/my_sql.cnf --skip-column-names'
DUMP='mysqldump --defaults-extra-file=/root/my_sql.cnf --master-data'

date=$(date '+%Y-%m-%d')

if [ ! -d backup ]; 
    then 
        mkdir backup
	mkdir backup/$date
    else 
	mkdir backup/$date
#        rm -rf ./backup/*
fi

for s in `$MYSQL -e "SHOW DATABASES LIKE '%wiki'"`;
    do
        mkdir ./backup/$date/$s;

        for t in `$MYSQL -e "SHOW TABLES FROM $s"`;
            do
                echo -e "$s.$t\n";
                $DUMP $s $t | gzip -3 > ./backup/$date/$s/$s.$t.gz;
        done

done
