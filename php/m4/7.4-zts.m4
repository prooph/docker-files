include(`macros.m4')
DONT_CHANGE()
FROM php:7.4-zts-alpine3.10

include(`php-ext-7.4.m4')
include(`php-ext-redis.m4')
include(`php-ext-protobuff.m4')
include(`php-ext-swoole.m4')
include(`php-ext-cleanup.m4')
include(`cli.m4')
