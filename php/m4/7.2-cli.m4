include(`macros.m4')
DONT_CHANGE()
FROM php:7.2-cli-alpine3.12

include(`php-ext.m4')
include(`php-ext-amqp.m4')
include(`php-ext-mongodb.m4')
include(`php-ext-redis.m4')
include(`php-ext-protobuff.m4')
include(`php-ext-swoole.m4')
include(`php-ext-simdjson.m4')
include(`php-ext-cleanup.m4')
include(`cli.m4')
