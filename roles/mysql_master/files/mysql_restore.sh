#!/bin/bash
MYSQL='mysql --defaults-extra-file=/root/.my.cnf'
DB='my_wiki'
BACKUP_PATH='/root/backup'

for s in `ls $BACKUP_PATH/$DB`;
    do
        gunzip $BACKUP_PATH/$DB/$s;
        echo "Import $s";
        $MYSQL $DB < $BACKUP_PATH/$DB/$s;
done


#for s in `ls /root/backup/my_wiki`; do mysql --defaults-extra-file=/root/.my.cnf my_wiki < /root/backup/$s; done


