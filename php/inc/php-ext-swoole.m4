RUN set -xe \
    && pecl install swoole

COPY config/swoole.ini /usr/local/etc/php/conf.d/
