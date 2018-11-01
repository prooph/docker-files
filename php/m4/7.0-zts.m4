include(`macros.m4')
DONT_CHANGE()
FROM php:7.0-zts-alpine3.7

include(`php-ext.m4')
include(`php-ext-rabbitmq.m4')
include(`php-ext-mongodb.m4')
include(`php-ext-redis.m4')
include(`php-ext-protobuff.m4')
include(`php-ext-swoole.m4')
include(`php-ext-pthreads-legacy.m4')
include(`php-ext-cleanup.m4')
include(`cli.m4')