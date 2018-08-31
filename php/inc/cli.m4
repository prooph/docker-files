COPY config/php-cli.ini /usr/local/etc/php/php.ini

# persistent / runtime deps
ENV PHPIZE_DEPS \
    autoconf \
    cmake \
    file \
    g++ \
    gcc \
    libc-dev \
    pcre-dev \
    make \
    git \
    pkgconf \
    re2c

RUN set -xe \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
    && pecl install swoole \
    && apk del .build-deps \
    && rm -rf /tmp/*

COPY config/swoole.ini /usr/local/etc/php/conf.d/

VOLUME ["/app"]
WORKDIR /app