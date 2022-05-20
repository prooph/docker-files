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
    re2c \
    # for GD
    freetype-dev \
    libpng-dev  \
    libjpeg-turbo-dev \
    # for xslt
    libxslt-dev \
    # for intl extension
    icu-dev \
    openssl-dev

RUN apk add --no-cache --virtual .persistent-deps \
    # for intl extension
    icu-libs \
    # for mongodb
    libssl1.1 \
    # for postgres
    postgresql-dev \
    # for soap
    libxml2-dev \
    # for amqp
    libressl-dev \
    # for GD
    freetype \
    libpng \
    libjpeg-turbo \
    libxslt \
    # for mbstring
    oniguruma-dev \
    libgcrypt

RUN set -xe \
    # workaround for rabbitmq linking issue
    && ln -s /usr/lib /usr/local/lib64 \
    # hack to link libgcrypt
    && ln -s /usr/lib/libgcrypt.so.20 /usr/lib/libgcrypt.so \
    && ln -s /usr/lib/libgpg-error.so.0 /usr/lib/libgpg-error.so \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
    # 7.4 changes https://github.com/php/php-src/blob/PHP-7.4/UPGRADING
    && docker-php-ext-configure gd \
        --enable-gd \
        --with-freetype=/usr/include/ \
        --with-jpeg=/usr/include/ \
    && docker-php-ext-configure bcmath --enable-bcmath \
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-configure pcntl --enable-pcntl \
    && docker-php-ext-configure mysqli --with-mysqli \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql \
    && docker-php-ext-configure pdo_pgsql --with-pdo-pgsql \
    && docker-php-ext-configure mbstring --enable-mbstring \
    && docker-php-ext-configure soap --enable-soap \
    && docker-php-ext-install -j$(nproc) \
        gd \
        bcmath \
        intl \
        pcntl \
        mysqli \
        pdo_mysql \
        pdo_pgsql \
        mbstring \
        soap \
        xsl

# Copy configuration
COPY config/php7.ini /usr/local/etc/php/conf.d/
