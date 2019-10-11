# PHP Docker files with Alpine Linux

> These images are only for development environments

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
* amqp
* redis
* soap
* protobuf
* swoole (cli only)

See [prooph/proophessor-do app](https://github.com/prooph/proophessor-do) for an example.

> Each image has tags for 7.1, 7.2 and 7.3

There are also PHP ZTS versions.

## cli
Use the following image: `prooph/php:7.2-cli`.

## cli with Opcache
Use the following image: `prooph/php:7.2-cli-opcache`.

The [PHP Opcache](http://php.net/manual/en/book.opcache.php) is not useful for development, so it's not part of the default PHP-FPM image. Use
this image if you want to have Opcache enabled.

## cli with Xdebug
Use the following image: `prooph/php:7.2-cli-xdebug`.

[Xdebug](http://xdebug.org/) is a PHP debugger.

> xDebug is already enabled, so you have only to listen for incoming connections in your IDE. Don't forget to set the
path mapping in your IDE with the name *application* !

Run the following command with the path to your php file.

```bash
$ docker run --rm -it --volume $(pwd):/app -e PHP_IDE_CONFIG="serverName=application" prooph/php:7.2-cli-xdebug php [your file]
```

Mac users doesn't have `docker0` network. According to [networking features](https://docs.docker.com/docker-for-mac/networking/#known-limitations-use-cases-and-workarounds) they should change hostname.

```bash
$ docker run --rm -it --volume $(pwd):/app -e PHP_IDE_CONFIG="serverName=application" -e XDEBUG_HOST="docker.for.mac.localhost" prooph/php:7.2-cli-xdebug php [your file]
```

## cli with SensioLabs Blackfire
Use the following image: `prooph/php:7.2-cli-blackfire`.

[Blackfire](https://blackfire.io) is a PHP Profiler. No linking with Blackfire-Agent required.

Run the following command with your [Blackfire](https://blackfire.io/docs/reference-guide/configuration) credentials to profile you cli PHP apps.

```bash
$ docker run --rm -it -e BLACKFIRE_SERVER_ID=[YOUR ID] -e BLACKFIRE_SERVER_TOKEN=[YOUR TOKEN] -e BLACKFIRE_CLIENT_ID=[YOUR ID] -e BLACKFIRE_CLIENT_TOKEN=[YOUR TOKEN] --volume $(pwd):/app prooph/php:7.2-cli-blackfire run php [your PHP script]
```

## fpm
Use the following image: `prooph/php:7.2-fpm`.

## fpm with Opcache
Use the following image: `prooph/php:7.2-fpm-opcache`.

The [PHP Opcache](http://php.net/manual/en/book.opcache.php) is not useful for development, so it's not part of the default PHP-FPM image. Use
this image if you want to have Opcache enabled.

## fpm with Xdebug
Use the following image: `prooph/php:7.2-fpm-xdebug`.

[Xdebug](http://xdebug.org/) is a PHP debugger.

Configure the Xdebug port in your IDE with `10000` and set the path mappings for the project root folder on server
to `/var/www`. The server name is `localhost`. Don't forget to set the Xdebug cookie in your browser to start debugging.

## fpm with Blackfire
Use the following image: `prooph/php:7.2-fpm-blackfire`.

[SensioLabs Blackfire](https://blackfire.io/) is a PHP Profiler.

Please refer to the [docs](https://blackfire.io/docs/integrations/docker) to analyze your application.
You need the Blackfire Agent Docker image.
