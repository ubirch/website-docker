#!/bin/bash -x

docker run -it --rm --link mysql:mysql -v `readlink -f $1`:/opt mysql /bin/bash
