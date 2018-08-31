# nginx Docker files

> These images are only for development environments

Configures nginx with SSL and HTTP/2 and some optimizations. The *vhost* uses the `/var/www/public` folder, sou you can
mount your application to `/var/www/`. See [prooph/proophessor-do app](https://github.com/prooph/proophessor-do) for an
example.

## nginx swoole
Use the following image: `prooph/nginx:swoole`.

A Docker Compose example to run your [Zend Expressive](https://docs.zendframework.com/zend-expressive-swoole/intro/#swoole-with-expressive) application with [swoole](https://www.swoole.co.uk/).

```
version: '2'
services:
  nginx:
    image: prooph/nginx:swoole
    ports:
    - 80:80
    - 443:443
    volumes:
    - .:/var/www

  php:
    image: prooph/php:7.2-cli
    volumes:
    - .:/var/www
    command:
      php
      /var/www/public/index.php
      start
```

## nginx www
Use the following image: `prooph/nginx:www`.

A Docker Compose example:

```
version: '2'
services:
  nginx:
    image: prooph/nginx:www
    ports:
    - 80:80
    - 443:443
    volumes:
    - .:/var/www

  php:
    image: prooph/php:7.2-fpm
    volumes:
    - .:/var/www
```

## nginx with Zend Z-Ray
Use the following image: `prooph/nginx:zray`.

[Zend Z-Ray](http://www.zend.com/de/products/server/z-ray) is a PHP Profiler and is used together with
one of the `prooph/php:[version]-fpm-zray` Docker images.

## nginx for Symfony
Use the following image: `prooph/nginx:symfony`.

The Symfony edition of nginx is exactly equal to the www edition except is uses the /var/www/web folder as document root, as this is Symfony convention.
