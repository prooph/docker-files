ENV PHP_PTHREADS_VERSION master

RUN git clone --branch ${PHP_PTHREADS_VERSION} https://github.com/krakjoe/pthreads.git /tmp/php-pthreads \
         && cd /tmp/php-pthreads \
         && git reset --hard 2fd526627e5606e8d7d4eb6a6339d98b5c2bfcec \
         && phpize  \
         && ./configure  \
         && make  \
         && make install \
         && make test

COPY config/pthreads.ini /usr/local/etc/php/conf.d/

