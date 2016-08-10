#!/bin/bash -x

docker run -it --rm --link websitedocker_mysql_1:mysql -v `readlink -f $1`:/opt mysql /bin/bash
