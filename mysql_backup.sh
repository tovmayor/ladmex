#!/bin/bash
# adding client config file  with mesql username & password /root/my_sql.cnf like:
#[client]
#user = "some"
#password = "very complex"

MYSQL='mysql --defaults-extra-file=/root/.my.cnf --skip-column-names'
DUMP='mysqldump --defaults-extra-file=/root/.my.cnf --master-data'

#date=$(date '+%Y-%m-%d')

if [ ! -d backup ]; 
    then 
        mkdir backup
    else 
        rm -rf ./backup/*
fi

for s in `$MYSQL -e "SHOW DATABASES LIKE '%wiki'"`;
    do
        mkdir ./backup/$s;

        for t in `$MYSQL -e "SHOW TABLES FROM $s"`;
            do
                echo -e "$s.$t\n";
                $DUMP $s $t | gzip -3 > ./backup/$s/$s.$t.gz;
        done

done
