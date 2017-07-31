FROM php:7.1-apache

ADD ./start.sh /start.sh

RUN \
  chmod +x /start.sh \
  && apt-get update \
  && apt-get install -y wget ssmtp vim unzip imagemagick libpng12-dev mysql-client \
  && docker-php-ext-install gd mysqli \
  && wget -P /tmp "https://www.phpbb.com/files/release/phpBB-3.2.1.zip" \
  && unzip -q /tmp/phpBB*.zip -d /var/www \
  && sed -i 's#DocumentRoot /var/www/html#DocumentRoot /var/www/phpBB3#g' /etc/apache2/sites-available/000-default.conf \
  && rm -rf /tmp/* /var/lib/apt/lists/*

CMD ["/start.sh"]