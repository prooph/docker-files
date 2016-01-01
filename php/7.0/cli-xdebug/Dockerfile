FROM prooph/php:7.0-cli

ENV XDEBUG_VERSION 2.4.0rc3

WORKDIR /tmp

# XDEBUG
RUN curl -L http://xdebug.org/files/xdebug-${XDEBUG_VERSION}.tgz | tar zx

WORKDIR xdebug-2.4.0RC3

RUN phpize \
    && ./configure \
    && make -j \
    && make install

# Copy custom configuration
COPY config/xdebug.ini /usr/local/etc/php/conf.d/

WORKDIR /var/www
