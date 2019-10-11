ENV PHP_MONGO_VERSION 1.6.0
RUN git clone --branch ${PHP_MONGO_VERSION} https://github.com/mongodb/mongo-php-driver /tmp/php-mongo \
        && cd /tmp/php-mongo \
        && git submodule sync && git submodule update --init \
        && phpize  \
        && ./configure  \
        && make  \
        && make install \
        && make test

COPY config/mongodb.ini /usr/local/etc/php/conf.d/
