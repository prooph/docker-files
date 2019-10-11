ENV PHP_PROTOBUF_VERSION v0.12.4

RUN git clone --branch ${PHP_PROTOBUF_VERSION} https://github.com/allegro/php-protobuf /tmp/phpprotobuf \
        && cd /tmp/phpprotobuf \
        && phpize  \
        && ./configure  \
        && make  \
        && make install \
        && make test

# Copy configuration
COPY config/protobuf.ini /usr/local/etc/php/conf.d/
