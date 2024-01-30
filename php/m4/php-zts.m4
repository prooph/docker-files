include(`macros.m4')
DONT_CHANGE()

ARG ALPINE_VERSION=3.16
ARG PHP_VERSION=8.3

########
# base #
########
FROM php:${PHP_VERSION}-zts-alpine${ALPINE_VERSION} as php-zts

include(`php-ext.m4')
include(`php-ext-mongodb.m4')
include(`php-ext-redis.m4')
include(`php-ext-protobuff.m4')
include(`php-ext-swoole.m4')
include(`php-ext-amqp.m4')
include(`php-ext-simdjson.m4')
include(`php-ext-cleanup.m4')
include(`cli.m4')

#####################
# php-zts-blackfire #
#####################
FROM php-zts as php-zts-blackfire

#include(`cli-blackfire.m4')

###################
# php-fpm-opcache #
###################
FROM php-zts as php-zts-opcache

include(`opcache.m4')

#####################
# php-zts-xdebug #
#####################
FROM php-zts as php-zts-xdebug

include(`cli-xdebug.m4')

############
# composer #
############
FROM php-zts as composer-zts

include(`composer2.m4')

##############
# composer 1 #
##############
FROM php-zts as composer-zts-1x

include(`composer.m4')
