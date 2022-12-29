#!/bin/bash
# adding client config file  with mesql username & password /root/my_sql.cnf like:
#[client]
#user = "some"
#password = "very complex"

BACKUP_FOLDER=/root/backup
MYSQL='mysql --defaults-extra-file=/root/.my.cnf --skip-column-names'
DUMP='mysqldump --defaults-extra-file=/root/.my.cnf --master-data'

#date=$(date '+%Y-%m-%d')

if [ ! -d /root/backup ]; 
    then 
        mkdir $BACKUP_FOLDER
    else 
        rm -rf $BACKUP_FOLDER/*
fi

for s in `$MYSQL -e "SHOW DATABASES LIKE '%wiki'"`;
    do
        mkdir $BACKUP_FOLDER/$s;

        for t in `$MYSQL -e "SHOW TABLES FROM $s"`;
            do
                echo -e "$s.$t\n";
                $DUMP $s $t | gzip -3 > $BACKUP_FOLDER/$s/$s.$t.gz;
        done

done
