#!/bin/bash -x


docker run --name webserver -p 8080:80 --rm -v `readlink -f $1`:/var/www/html --link mysql:mysql -v ${PWD}:/mnt/backup ubirch/webserver
