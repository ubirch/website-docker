#!/bin/bash -x

# source MySQL Password from file
source .mysql_credentials

docker run --rm --name mysql -p 3306:3306 --volumes-from mysql-data -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} mysql
