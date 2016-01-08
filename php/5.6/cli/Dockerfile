FROM php:5.6-cli

RUN apt-get update \
    && apt-get install -y \
      # for intl extension
      libicu-dev \
      # for mcrypt extension
      libmcrypt-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure bcmath --enable-bcmath \
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-configure pcntl --enable-pcntl \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql \
    && docker-php-ext-configure mbstring --enable-mbstring \
    && docker-php-ext-install \
        bcmath \
        intl \
        mcrypt \
        pcntl \
        pdo_mysql \
        mbstring

# Copy configuration
COPY config/php.ini /usr/local/etc/php/

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app
