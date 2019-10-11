ENV PHP_REDIS_VERSION 5.0.2

RUN git clone --branch ${PHP_REDIS_VERSION} https://github.com/phpredis/phpredis /tmp/phpredis \
        && cd /tmp/phpredis \
        && phpize  \
        && ./configure  \
        && make  \
        && make install \
        && make test

# Copy configuration
COPY config/redis.ini /usr/local/etc/php/conf.d/
