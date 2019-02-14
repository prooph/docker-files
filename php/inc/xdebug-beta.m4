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
    && pecl -d preferred_state=beta install xdebug \
    && apk del .build-deps