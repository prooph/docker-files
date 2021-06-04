# PHP Composer Docker files

> These images are only for development environments

These images are available on [Docker Hub](https://hub.docker.com/r/prooph/composer/).
Extends the official PHP image with the following PHP extensions and installs Composer `2.0`:

> If you need Composer 1.x please use the tags with the suffix `-1x`

* intl 
* pdo_mysql
* bcmath
* mbstring
* mongodb
* pcntl
* parallel
* amqp
* redis
* zip
* bz2

To run Composer use:

```bash
$ docker run --rm -it --volume $(pwd):/app prooph/composer:7.4 [your composer command]
```

## Composer with PHP 8.0
Use the following image: `prooph/composer:8.0`.

## Composer with PHP 7.4
Use the following image: `prooph/composer:7.4`.

## Composer with PHP 7.3
Use the following image: `prooph/composer:7.3`.

## Composer with PHP ZTS 8.0
Use the following image: `prooph/composer:8.0-zts`.

## Composer with PHP ZTS 7.4
Use the following image: `prooph/composer:7.4-zts`.

## Composer with PHP ZTS 7.3
Use the following image: `prooph/composer:7.3-zts`.
