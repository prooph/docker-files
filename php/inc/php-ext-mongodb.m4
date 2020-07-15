RUN set -xe \
    && pecl install mongodb

COPY config/mongodb.ini /usr/local/etc/php/conf.d/
