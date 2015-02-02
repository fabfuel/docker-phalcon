FROM php:5.6-apache
COPY phpinfo.php /var/www/html/index.php
COPY php.ini /usr/local/etc/php/conf.d/custom.ini

# Install modules
RUN apt-get update && apt-get install -y php5-dev git php5-intl php5-xsl php5-json php5-pgsql php5-mongo php5-mysqlnd php5-redis php5-xdebug libpq-dev
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql

# checkout, compile and install recent Phalcon extension
RUN cd ~; git clone https://github.com/phalcon/cphalcon -b master --single-branch
RUN cd ~/cphalcon/build; ./install; rm -rf ~/cphalcon
RUN echo extension=phalcon.so > /usr/local/etc/php/conf.d/phalcon.ini

# enable Apache's mod_rewrite
RUN cd /etc/apache2/mods-enabled && ln -s ../mods-available/rewrite.load rewrite.load
