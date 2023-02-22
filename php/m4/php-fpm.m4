include(`macros.m4')
DONT_CHANGE()

ARG ALPINE_VERSION=3.16
ARG PHP_VERSION=8.2

########
# base #
########
FROM php:${PHP_VERSION}-fpm-alpine${ALPINE_VERSION} as php-fpm

include(`php-ext.m4')
include(`php-ext-mongodb.m4')
include(`php-ext-redis.m4')
include(`php-ext-protobuff.m4')
include(`php-ext-swoole.m4')
include(`php-ext-amqp.m4')
include(`php-ext-simdjson.m4')
include(`php-ext-cleanup.m4')
include(`fpm.m4')

#####################
# php-fpm-blackfire #
#####################
FROM php-fpm as php-fpm-blackfire

include(`fpm-blackfire.m4')

###################
# php-fpm-opcache #
###################
FROM php-fpm as php-fpm-opcache

include(`opcache.m4')

#####################
# php-fpm-xdebug #
#####################
FROM php-fpm as php-fpm-xdebug

include(`fpm-xdebug.m4')

############
# composer #
############
FROM php-fpm as composer-fpm

include(`composer2.m4')

##############
# composer 1 #
##############
FROM php-fpm as composer-fpm-1x

include(`composer.m4')
