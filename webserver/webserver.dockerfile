FROM ubuntu
MAINTAINER falko.zurell@ubirch.com
RUN apt-get update \
      && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 vim ssh sendmail ca-certificates libapache2-mod-svn libapache2-mod-php libjs-cropper libphp-phpmailer libphp-snoopy mysql-client php-gd php-mysql php-mcrypt php-mbstring php-ldap php-xml libjpeg-turbo-progs optipng gifsicle \
      && a2enmod rewrite \
      && sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf \
      && sed -i '/upload_max_filesize/s/= *2M/= 512M/' /etc/php/7.0/apache2/php.ini

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
