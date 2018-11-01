ENV PHP_PTHREADS_VERSION master

RUN git clone --branch ${PHP_PTHREADS_VERSION} https://github.com/krakjoe/pthreads.git /tmp/php-pthreads \
         && cd /tmp/php-pthreads \
         && phpize  \
         && ./configure  \
         && make  \
         && make install
         # && make test

COPY config/pthreads.ini /usr/local/etc/php/conf.d/

