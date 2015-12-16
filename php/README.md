# PHP Docker files

These images are available on [Docker Hub](https://hub.docker.com/r/prooph/php/). 
Extends the official PHP image with the following PHP extensions:

* intl 
* pdo_mysql

See [prooph/proophessor-do app](https://github.com/prooph/proophessor-do) for an example.

## PHP 5.6-fpm
Use the following image: `prooph/php:5.6-fpm`.

## PHP 5.6-fpm with Opcache
Use the following image: `prooph/php:5.6-fpm-opcache`.

The [PHP Opcache](http://php.net/manual/en/book.opcache.php) is not useful for development, so it's not part of the default PHP-FPM image. Use
this image if you want to have Opcache enabled.

## PHP 5.6-fpm with Xdebug
Use the following image: `prooph/php:5.6-fpm-xdebug`.

[Xdebug](http://xdebug.org/) is a PHP debugger.

Configure the Xdebug port in your IDE with `10000` and set the path mappings for the project root folder on server 
to `/var/www`. The server name is `localhost`. Don't forget to set the Xdebug cookie in your browser to start debugging.

## PHP 5.6-fpm with Zend Z-Ray
Use the following image: `prooph/php:5.6-fpm-zray`.

[Zend Z-Ray](http://www.zend.com/de/products/server/z-ray) is a PHP Profiler. Open your browser with `https://localhost:10082/ZendServer/Z-Ray/Advanced/#panel=devbar-settings`
and configure the Z-Ray URL to `https://localhost:10082/ZendServer`. This setting can be found under *Settings -> Advanced*

Unfortunately the input fields are hidden (display:none). Open the browsers *development tools* window e.g. Firefox 
Firebug and remove the `display:none` styles of the `devbar-settings` form. 

Then you have to restart the Docker containers.

## PHP 7.0-fpm
Use the following image: `prooph/php:7.0-fpm`.

## PHP 7.0-fpm with Opcache
Use the following image: `prooph/php:5.6-fpm-opcache`.

The [PHP Opcache](http://php.net/manual/en/book.opcache.php) is not useful for development, so it's not part of the default PHP-FPM image. Use
this image if you want to have Opcache enabled.

## PHP 7.0-fpm with Xdebug
Use the following image: `prooph/php:7.0-fpm-xdebug`.

[Xdebug](http://xdebug.org/) is a PHP debugger.

Configure the Xdebug port in your IDE with `10000` and set the path mappings for the project root folder on server 
to `/var/www`. The server name is `localhost`. Don't forget to set the Xdebug cookie in your browser to start debugging.

## PHP 7.0-fpm with Zend Z-Ray (coming soon)

