ENV PHP_SIMDJSON_VERSION master

# persistent / runtime deps
ENV PHPIZE_DEPS \
    autoconf \
    g++ \
    gcc \
    make \
    pkgconf \
    git \
    re2c

RUN set -xe \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
  && git clone --branch ${PHP_SIMDJSON_VERSION} https://github.com/crazyxman/simdjson_php /tmp/simdjson \
        && cd /tmp/simdjson \
        && phpize  \
        && ./configure  \
        && make  \
        && make install \
        && make test

# Copy configuration
COPY config/simdjson.ini /usr/local/etc/php/conf.d/
