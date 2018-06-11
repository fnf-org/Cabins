#!/usr/bin/env bash

echo "RAILS_ENV: $RAILS_ENV"
if [ "$RAILS_ENV" == "development" ] ; then
    echo "development mode detected, telling apache to *not* proxy assets"
    sed -i '/^[ \t]*ProxyPass \/assets\/ !$/s/^/#/' /usr/local/apache2/conf/extra/httpd-vhosts.conf;
    sed -i '/^[ \t]*Rewrite/s/^/#/' /usr/local/apache2/conf/extra/httpd-vhosts.conf;
else
    echo "production mode detected, leaving apache as is"
fi
