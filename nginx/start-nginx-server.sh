#!/bin/bash -x

docker run --rm --name nginx --link webserver:webserver --link dathe:dathe -p "78.46.181.249:80:80" -v /opt/DOCKER/nginx/config/nginx:/etc/nginx  nginx 

