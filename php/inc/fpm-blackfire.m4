# blackfire HTTP (dedicated agent on blackfire:8707)
RUN set -xeo pipefail \
    && version=$(php -r "echo PHP_MAJOR_VERSION, PHP_MINOR_VERSION;") \
    && curl -sSL -D - -A "Docker" -o /tmp/blackfire-probe.tar.gz https://blackfire.io/api/v1/releases/probe/php/alpine/amd64/${version} \
    && for file in /tmp/blackfire-*.tar.gz; do tar zxfp "${file}" -C /tmp; done \
    && for file in /tmp/blackfire-*.sha*; do echo "$(cat ${file})  ${file/.sha1/}"; done | sed 's/\.sha/.so/' | sha1sum -c - \
    && mv /tmp/blackfire-*.so "$(php -r "echo ini_get('extension_dir');")/blackfire.so" \
    && printf "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > ${PHP_INI_DIR}/conf.d/blackfire.ini \
    && rm -rf /tmp/blackfire* \
    && php-fpm -m | grep "^blackfire$" > /dev/null