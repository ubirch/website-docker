#!/bin/bash -x


docker run --rm -ti --volumes-from webserver-data -v `readlink -f $1`:/mnt/backup maxheadroom/webserver /bin/bash
