include(`macros.m4')
DONT_CHANGE()
FROM php:7.1-fpm-alpine3.10

include(`php-ext.m4')
include(`php-ext-rabbitmq.m4')
include(`php-ext-mongodb.m4')
include(`php-ext-redis.m4')
include(`php-ext-protobuff.m4')
include(`php-ext-cleanup.m4')
include(`fpm.m4')
