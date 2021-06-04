RUN set -xe \
    && pecl install parallel

COPY config/parallel.ini /usr/local/etc/php/conf.d/
