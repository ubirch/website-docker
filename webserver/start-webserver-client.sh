#!/bin/bash -x


docker run --rm -ti --volumes-from ubirch-data -v `readlink -f $1`:/mnt/backup ubirch/webserver /bin/bash
