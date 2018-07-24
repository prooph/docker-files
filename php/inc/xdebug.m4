# persistent / runtime deps
ENV PHPIZE_DEPS \
    autoconf \
    g++ \
    gcc \
    make \
    pkgconf \
    re2c

RUN set -xe \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
    && pecl install xdebug \
    && apk del .build-deps