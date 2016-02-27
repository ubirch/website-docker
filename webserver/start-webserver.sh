#!/bin/bash -x


docker run --rm --name webserver -p 8080:80 --rm -v `readlink -f $1`:/opt --volumes-from ubirch-data --link mysql:mysql ubirch/webserver
