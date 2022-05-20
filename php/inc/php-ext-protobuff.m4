# See https://github.com/protocolbuffers/protobuf/tree/main/php
RUN pecl install protobuf

# Copy configuration
COPY config/protobuf.ini /usr/local/etc/php/conf.d/
