include(`macros.m4')
DONT_CHANGE()
FROM php:7.4-fpm-alpine3.10

include(`php-ext-7.4.m4')
include(`php-ext-mongodb.m4')
include(`php-ext-redis.m4')
include(`php-ext-protobuff.m4')
include(`php-ext-cleanup.m4')
include(`fpm.m4')
