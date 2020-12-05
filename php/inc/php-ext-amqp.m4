RUN apk add --no-cache --no-progress --virtual .build_deps_php_amqp rabbitmq-c-dev \
    && apk add --no-cache --no-progress rabbitmq-c \
    && apk add --no-cache git autoconf automake gawk build-base \
    && pecl install amqp \
    && apk del .build_deps_php_amqp

# Copy configuration
COPY config/amqp.ini /usr/local/etc/php/conf.d/
