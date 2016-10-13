# PHP Docker files with Alpine Linux

> These images are only for development environments

These images are available on [Docker Hub](https://hub.docker.com/r/prooph/php/).
Extends the official PHP image with the following PHP extensions:

* intl
* pdo_mysql
* pdo_pgsql
* bcmath
* mcrypt
* mbstring
* mongo
* mongodb
* pcntl
* amqp
* zmq
* redis
* memcached
* soap

See [prooph/proophessor-do app](https://github.com/prooph/proophessor-do) for an example.

> Each image has tags for PHP 5.6 / 7.0 and 7.1

## cli
Use the following image: `prooph/php:7.0-cli`.

## cli with Opcache
Use the following image: `prooph/php:7.0-cli-opcache`.

The [PHP Opcache](http://php.net/manual/en/book.opcache.php) is not useful for development, so it's not part of the default PHP-FPM image. Use
this image if you want to have Opcache enabled.

## cli with Xdebug
Use the following image: `prooph/php:7.0-cli-xdebug`.

[Xdebug](http://xdebug.org/) is a PHP debugger.

> xDebug is already enabled, so you have only to listen for incoming connections in your IDE. Don't forget to set the
path mapping in your IDE with the name *application* !

Run the following command with the path to your php file.

```bash
$ docker run --rm -it --volume $(pwd):/app -e PHP_IDE_CONFIG="serverName=application" prooph/php:7.0-cli-xdebug php [your file]
```

## cli with SensioLabs Blackfire
Use the following image: `prooph/php:7.0-cli-blackfire`.

[Blackfire](https://blackfire.io) is a PHP Profiler. No linking with Blackfire-Agent required.

Run the following command with your [Blackfire](https://blackfire.io/docs/reference-guide/configuration) credentials to profile you cli PHP apps.

```bash
$ docker run --rm -it -e BLACKFIRE_SERVER_ID=[YOUR ID] -e BLACKFIRE_SERVER_TOKEN=[YOUR TOKEN] -e BLACKFIRE_CLIENT_ID=[YOUR ID] -e BLACKFIRE_CLIENT_TOKEN=[YOUR TOKEN] --volume $(pwd):/app prooph/php:7.0-cli-blackfire run php [your PHP script]
```

## fpm
Use the following image: `prooph/php:7.0-fpm`.

## fpm with Opcache
Use the following image: `prooph/php:7.0-fpm-opcache`.

The [PHP Opcache](http://php.net/manual/en/book.opcache.php) is not useful for development, so it's not part of the default PHP-FPM image. Use
this image if you want to have Opcache enabled.

## fpm with Xdebug
Use the following image: `prooph/php:7.0-fpm-xdebug`.

[Xdebug](http://xdebug.org/) is a PHP debugger.

Configure the Xdebug port in your IDE with `10000` and set the path mappings for the project root folder on server
to `/var/www`. The server name is `localhost`. Don't forget to set the Xdebug cookie in your browser to start debugging.

## fpm with Blackfire
Use the following image: `prooph/php:7.0-fpm-blackfire`.

[SensioLabs Blackfire](https://blackfire.io/) is a PHP Profiler.

Please refer to the [docs](https://blackfire.io/docs/integrations/docker)to analyze your application. 
You need the Blackfire Agent Docke image.

## fpm with Zend Z-Ray (only PHP 5.6)
Use the following image: `prooph/php:5.6-fpm-zray`.

[Zend Z-Ray](http://www.zend.com/de/products/server/z-ray) is a PHP Profiler. Open your browser with `https://localhost:10082/ZendServer/Z-Ray/Advanced/#panel=devbar-settings`
and configure the Z-Ray URL to `https://localhost:10082/ZendServer`. This setting can be found under *Settings -> Advanced*

Unfortunately the input fields are hidden (display:none). Open the browsers *development tools* window e.g. Firefox
Firebug and remove the `display:none` styles of the `devbar-settings` form.

Then you have to restart the Docker containers.


