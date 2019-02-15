# Environmental Variables
ENV COMPOSER_HOME /root/composer
ENV COMPOSER_VERSION master
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN set -xe \
    && apk add --no-cache --virtual .persistent-deps \
        zlib-dev \
        libzip-dev \
        git \
        unzip \
    && docker-php-ext-install \
        zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require hirak/prestissimo

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]
