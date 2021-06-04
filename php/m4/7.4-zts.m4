include(`macros.m4')
DONT_CHANGE()
FROM php:7.4-zts-alpine3.13

include(`php-ext-7.4.m4')
include(`php-ext-mongodb.m4')
include(`php-ext-redis.m4')
include(`php-ext-protobuff.m4')
include(`php-ext-swoole.m4')
include(`php-ext-parallel.m4')
include(`php-ext-amqp.m4')
include(`php-ext-simdjson.m4')
include(`php-ext-cleanup.m4')
include(`cli.m4')
