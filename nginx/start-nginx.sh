#!/bin/bash -x


docker run --rm --name nginx -ti -v /opt/DOCKER/nginx/config/nginx:/etc/nginx:ro -P --link webserver:webserver nginx /bin/bash
