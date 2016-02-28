FROM ubuntu
MAINTAINER falko.zurell@ubirch.com
RUN apt-get update \
      && DEBIAN_FRONTEND=noninteractive apt-get install -y vim ssh ca-certificates libapache2-mod-svn libapache2-mod-php5 libjs-cropper libphp-phpmailer libphp-snoopy mysql-client php5-gd php5-mysql libjpeg-turbo-progs optipng gifsicle \
      && a2enmod rewrite \
      && sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf \
      && sed -i '/upload_max_filesize/s/= *2M/= 512M/' /etc/php5/apache2/php.ini

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
