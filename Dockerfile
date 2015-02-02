FROM php:5.6-apache
COPY phpinfo.php /var/www/html/index.php
COPY php.ini /usr/local/etc/php/conf.d/custom.ini

# Install modules
RUN apt-get update && apt-get install -y php5-dev git libpq-dev libmemcached-dev libicu-dev; rm -rf /var/cache/*; rm -rf /tmp/*
RUN docker-php-ext-install pdo_mysql pdo_pgsql intl pgsql; rm -rf /var/cache/*; rm -rf /tmp/*
RUN pecl install mongo redis memcached xdebug; rm -rf /var/cache/*; rm -rf /tmp/*

# checkout, compile and install recent Phalcon extension
RUN cd ~; git clone https://github.com/phalcon/cphalcon -b master --single-branch; cd ~/cphalcon/build; ./install; rm -rf ~/cphalcon

# enable Apache's mod_rewrite
RUN cd /etc/apache2/mods-enabled && ln -s ../mods-available/rewrite.load rewrite.load
