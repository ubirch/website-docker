#!/bin/bash -x


# docker run --name webserver -p 8080:80 --rm --volumes-from webserver-data --link mysql:mysql -v ${PWD}:/mnt/backup maxheadroom/webserver
docker run --name webserver -p 8080:80 --rm -v `readlink -f $1`:/var/www/html --link mysql:mysql -v ${PWD}:/mnt/backup maxheadroom/webserver
