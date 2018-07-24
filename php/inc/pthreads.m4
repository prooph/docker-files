ENV PHP_PTHREADS_VERSION master

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
    && git clone --branch ${PHP_PTHREADS_VERSION} https://github.com/krakjoe/pthreads.git /tmp/php-pthreads \
         && cd /tmp/php-pthreads \
         && phpize  \
         && ./configure  \
         && make  \
         && make install \
         # && make test \
    && apk del .build-deps \
    && rm -rf /tmp/*

COPY config/pthreads.ini /usr/local/etc/php/conf.d/

