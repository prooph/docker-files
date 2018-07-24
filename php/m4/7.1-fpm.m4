include(`macros.m4')
DONT_CHANGE()
FROM php:7.1-fpm-alpine3.7

include(`php-ext.m4')
include(`fpm.m4')