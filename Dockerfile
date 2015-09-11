FROM php:5.5-apache

ENV PHPBB_DIR /var/www/phpBB3

ENV DL_LINK="http://downloads.phpbb.de/pakete/deutsch/3.1/3.1.5/phpBB-3.1.5-deutsch.zip"

RUN \
  apt-get update \
  && apt-get install -y wget ssmtp vim unzip imagemagick libpng12-dev mysql-client \
  && docker-php-ext-install gd mysqli \
  && rm -rf /var/lib/apt/lists/*

RUN \
  wget -P /tmp ${DL_LINK} \
  && unzip -q /tmp/phpBB*.zip -d /var/www \
  && rm -rf /tmp/* \
  && sed -i 's#DocumentRoot /var/www/html#DocumentRoot /var/www/phpBB3#g' /etc/apache2/apache2.conf

ADD start.sh /a/start.sh
RUN chmod 777 /a/start.sh

CMD ["/a/start.sh"]
