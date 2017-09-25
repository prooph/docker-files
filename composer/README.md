# PHP Composer Docker files

> These images are only for development environments

These images are available on [Docker Hub](https://hub.docker.com/r/prooph/composer/).
Extends the official PHP image with the following PHP extensions and installs Composer with parallel downloads plugin:

* intl 
* pdo_mysql
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
* zip
* bz2

See [hirak/prestissimo](https://github.com/hirak/prestissimo) for more information about Composer parallel 
install plugin.

To run Composer use:

```bash
$ docker run --rm -it --volume $(pwd):/app prooph/composer:7.0 [your composer command]
```

## Composer with PHP 7.2
Use the following image: `prooph/composer:7.2`.

## Composer with PHP 7.1
Use the following image: `prooph/composer:7.1`.

## Composer with PHP 7.0
Use the following image: `prooph/composer:7.0`.

## Composer with PHP 5.6
Use the following image: `prooph/composer:5.6`.
