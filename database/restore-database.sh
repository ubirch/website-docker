#!/bin/bash -x

BACKUPDIR=$1

for directory in `ls $BACKUPDIR`; do
	cat $BACKUPDIR/$directory/${directory}_structure.mysql | mysql -h mysql -u root --password=${MYSQL_ENV_MYSQL_ROOT_PASSWORD} 

    for table in `ls $BACKUPDIR/${directory}/*_table.mysql`; do
        cat ${table} | mysql -h mysql -u root --password=${MYSQL_ENV_MYSQL_ROOT_PASSWORD} ${directory}
    done
done
