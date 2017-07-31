#!/bin/bash
chown www-data:www-data -R /var/www/phpBB3

if [ "$RM_INSTALL_DIR" = "true" ]
  then
    rm -rf /var/www/phpBB3/install/
    echo "DELETED: /var/www/phpBB3/install/"
else
   echo "NOT DELETED: /var/www/phpBB3/install/ "
fi

apache2-foreground