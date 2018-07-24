include(`macros.m4')
DONT_CHANGE()
FROM php:7.1-zts-alpine3.7

include(`php-ext.m4')
include(`pthreads-legacy.m4')
include(`cli.m4')