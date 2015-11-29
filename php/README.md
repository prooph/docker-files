# PHP Docker files

Extends the official image with the following PHP extensions:

* intl 
* mbstring 
* opcache
* pdo_mysql

## PHP 5.6-fpm
Use the following image: `prooph/php:5.6-fpm`.

## PHP 5.6-fpm with Xdebug
Use the following image: `prooph/php:5.6-fpm-xdebug`.

Configure the Xdebug port in your IDE with `10000` and set the path mappings for the project root folder on server 
to `/var/www`. The server name is `localhost`.
