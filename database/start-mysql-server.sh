#!/bin/bash -x

# source MySQL Password from file
source .mysql_credentials

docker run --rm --name mysql --volumes-from ubirch-data -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} mysql
