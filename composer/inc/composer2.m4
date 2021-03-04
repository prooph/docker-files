# Environmental Variables
ENV COMPOSER_HOME /root/composer
ENV COMPOSER_VERSION 2.0.11
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN set -xe \
    # use own name or other previous .persistent-deps will be removed
    && apk add --no-cache --virtual .persistent-deps-composer \
        zlib-dev \
        libzip-dev \
        git \
        unzip \
    && docker-php-ext-install \
        zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version $COMPOSER_VERSION

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]
