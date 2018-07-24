include(`macros.m4')
DONT_CHANGE()
FROM php:7.2-zts-alpine3.7

include(`php-ext.m4')
include(`pthreads.m4')
include(`cli.m4')