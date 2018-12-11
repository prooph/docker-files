ENV RABBITMQ_VERSION v0.9.0

RUN git clone --branch ${RABBITMQ_VERSION} https://github.com/alanxz/rabbitmq-c.git /tmp/rabbitmq \
        && cd /tmp/rabbitmq \
        && mkdir build && cd build \
        && cmake .. \
        && cmake --build . --target install


ENV PHP_AMQP_VERSION v1.9.3

RUN git clone --branch ${PHP_AMQP_VERSION} https://github.com/pdezwart/php-amqp.git /tmp/php-amqp \
        && cd /tmp/php-amqp \
        && phpize  \
        && ./configure  \
        && make  \
        && make install

# Copy configuration
COPY config/amqp.ini /usr/local/etc/php/conf.d/