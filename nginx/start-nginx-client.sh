#!/bin/bash -x


docker run --rm -ti --volumes-from nginx-data -v ${PWD}:/mnt/backup maxheadroom/webserver /bin/bash
