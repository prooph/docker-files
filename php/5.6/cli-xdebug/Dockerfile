FROM prooph/php:5.6-cli

ENV XDEBUG_VERSION 2.3.3

WORKDIR /tmp

# XDEBUG
RUN curl -L http://xdebug.org/files/xdebug-${XDEBUG_VERSION}.tgz | tar zx

WORKDIR xdebug-${XDEBUG_VERSION}

RUN phpize \
    && ./configure \
    && make -j \
    && make install

# Copy custom configuration
COPY config/xdebug.ini /usr/local/etc/php/conf.d/

WORKDIR /app
