# Based on
PHP 5.6 + Apache (https://registry.hub.docker.com/_/php/)

# How to use this image
Create a Dockerfile in your Phalcon project and copy your application code to the predefined workdir:

    FROM fabfuel/phalcon
    COPY . /var/www/html

Important! Your application has to provide the folder `public`, as the predefined document root is `/var/www/html/public`

### Example
Have a look at the Prophiler demo Dockerfile as a usage example: https://github.com/fabfuel/prophiler-demo/blob/develop/Dockerfile

## Included PHP extensions
- Phalcon
- INTL
- JSON
- xdebug
- APCu
- mbstring
- opcache

## Database/Storage support
- PDO
  - MySQL
  - PostgreSQL
- MongoDB
- Redis
- memcached

## Monitoring: New Relic
To monitor the container in New Relic, you just need to set the following environment variables:
- `NEWRELIC_LICENSE` = your New Relic license key
- `NEWRELIC_APPNAME` = the name of your application in New Relic RPM
