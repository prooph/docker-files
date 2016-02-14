# Composer Docker Container
FROM prooph/php:5.6-cli

# Environmental Variables
ENV COMPOSER_HOME /root/composer
ENV COMPOSER_VERSION master

# Packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        libbz2-dev \
        libzip-dev \
        git \
        unzip \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip bz2 \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini \
    && echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini \
    && composer global require hirak/prestissimo

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]
