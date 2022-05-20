include(`macros.m4')
DONT_CHANGE()

ARG ALPINE_VERSION=3.15
ARG PHP_VERSION=8.0

########
# base #
########
FROM php:${PHP_VERSION}-cli-alpine${ALPINE_VERSION} as php-cli

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
# php-cli-blackfire #
#####################
FROM php-cli as php-cli-blackfire

include(`cli-blackfire.m4')

###################
# php-cli-opcache #
###################
FROM php-cli as php-cli-opcache

include(`opcache.m4')

##################
# php-cli-xdebug #
##################
FROM php-cli as php-cli-xdebug

include(`cli-xdebug.m4')

############
# composer #
############
FROM php-cli as composer-cli

include(`composer2.m4')

##############
# composer 1 #
##############
FROM php-cli as composer-cli-1x

include(`composer.m4')
