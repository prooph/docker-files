# PHP Docker files with Alpine Linux

> These images are only for development environments

## PHP Docker Images

These images are available on [Docker Hub](https://hub.docker.com/r/prooph/php/).
Extends the official PHP image with the following PHP extensions:

* intl
* mysqli
* pdo_mysql
* pdo_pgsql
* bcmath
* mbstring
* mongodb
* pcntl
* parallel
* amqp
* redis
* soap
* protobuf
* swoole (cli only)
* amqp
* [simdjson](https://github.com/crazyxman/simdjson_php)

See [prooph/proophessor-do app](https://github.com/prooph/proophessor-do) for an example.

> Each image has tags for 7.4, 8.0, 8.1, 8.2 and 8.3.

There are also PHP ZTS versions.

## cli
Use the following image: `prooph/php:8.2-cli`.

## cli with Opcache
Use the following image: `prooph/php:8.2-cli-opcache`.

The [PHP Opcache](http://php.net/manual/en/book.opcache.php) is not useful for development, so it's not part of the default PHP-FPM image. Use
this image if you want to have Opcache enabled.

## cli with Xdebug
Use the following image: `prooph/php:8.2-cli-xdebug`.

[Xdebug](http://xdebug.org/) is a PHP debugger.

> xDebug is already enabled, so you have only to listen for incoming connections in your IDE. Don't forget to set the
path mapping in your IDE with the name *application* !

Run the following command with the path to your php file.

```bash
$ docker run --rm -it --volume $(pwd):/app -e PHP_IDE_CONFIG="serverName=application" prooph/php:8.2-cli-xdebug php [your file]
```

Mac users doesn't have `docker0` network. According to [networking features](https://docs.docker.com/docker-for-mac/networking/#known-limitations-use-cases-and-workarounds) they should change hostname.

```bash
$ docker run --rm -it --volume $(pwd):/app -e PHP_IDE_CONFIG="serverName=application" -e XDEBUG_HOST="docker.for.mac.localhost" prooph/php:8.2-cli-xdebug php [your file]
```

## cli with SensioLabs Blackfire
Use the following image: `prooph/php:8.2-cli-blackfire`.

[Blackfire](https://blackfire.io) is a PHP Profiler. No linking with Blackfire-Agent required.

Run the following command with your [Blackfire](https://blackfire.io/docs/reference-guide/configuration) credentials to profile you cli PHP apps.

```bash
$ docker run --rm -it -e BLACKFIRE_SERVER_ID=[YOUR ID] -e BLACKFIRE_SERVER_TOKEN=[YOUR TOKEN] -e BLACKFIRE_CLIENT_ID=[YOUR ID] -e BLACKFIRE_CLIENT_TOKEN=[YOUR TOKEN] --volume $(pwd):/app prooph/php:8.2-cli-blackfire run php [your PHP script]
```

## fpm
Use the following image: `prooph/php:8.2-fpm`.

## fpm with Opcache
Use the following image: `prooph/php:8.2-fpm-opcache`.

The [PHP Opcache](http://php.net/manual/en/book.opcache.php) is not useful for development, so it's not part of the default PHP-FPM image. Use
this image if you want to have Opcache enabled.

## fpm with Xdebug
Use the following image: `prooph/php:8.2-fpm-xdebug`.

[Xdebug](http://xdebug.org/) is a PHP debugger.

Configure the Xdebug port in your IDE with `10000` and set the path mappings for the project root folder on server
to `/var/www`. The server name is `localhost`. Don't forget to set the Xdebug cookie in your browser to start debugging.

## fpm with Blackfire
Use the following image: `prooph/php:8.2-fpm-blackfire`.

[SensioLabs Blackfire](https://blackfire.io/) is a PHP Profiler.

Please refer to the [docs](https://blackfire.io/docs/integrations/docker) to analyze your application.
You need the Blackfire Agent Docker image.

## Composer PHP Docker Images

> If you need Composer 1.x please use the tags with the suffix `-1x`

These images are available on [Docker Hub](https://hub.docker.com/r/prooph/composer/).
Extends the prooph PHP Docker image and installs Composer `2.x`:

* zip
* bz2

To run Composer use:

```bash
$ docker run --rm -it --volume $(pwd):/app prooph/composer:7.4 [your composer command]
```

## Composer with PHP 8.3
Use the following image: `prooph/composer:8.3`.

## Composer with PHP 8.2
Use the following image: `prooph/composer:8.2`.

## Composer with PHP 8.1
Use the following image: `prooph/composer:8.1`.

## Composer with PHP 8.0
Use the following image: `prooph/composer:8.0`.

## Composer with PHP 7.4
Use the following image: `prooph/composer:7.4`.

## Composer with PHP ZTS 8.1
Use the following image: `prooph/composer:8.1-zts`.

## Composer with PHP ZTS 8.0
Use the following image: `prooph/composer:8.0-zts`.

## Composer with PHP ZTS 7.4
Use the following image: `prooph/composer:7.4-zts`.
