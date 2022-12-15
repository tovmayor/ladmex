#!/bin/bash
# adding client config file  with mesql username & password /home/admin/my_sql.cnf like:
#[client]
#user = "some"
#password = "very complex"


#!/bin/bash
MYSQL='mysql --defaults-extra-file=/root/.my.cnf'
DB='my_wiki'

for s in `ls /root/backup/$DB`;
    do
        echo "Import $s"
        $MYSQL DB < $s;

done


for s in `ls /root/backup/$DB`;
    do
        #t=`awk -F. '{print $2}'`;
        #echo -e "Import table $t\n";
        $MYSQL DB < $s;
        done

done