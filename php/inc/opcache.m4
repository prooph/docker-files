RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache

# Copy configuration
COPY config/opcache.ini $PHP_INI_DIR/conf.d/
