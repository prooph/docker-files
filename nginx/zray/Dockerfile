FROM prooph/nginx:www

RUN apt-get update \
    && apt-get install -y curl \
    unzip \
    && rm -r /var/lib/apt/lists/*

# you must also change the version in the path e.g. 0112
ENV ZRAY_VERSION zray-php-104202-php5.6.17-linux-debian7-amd64

WORKDIR /tmp

# Z-Ray
RUN curl -L http://downloads.zend.com/zray/1102/${ZRAY_VERSION}.tar.gz | tar zx \
    && mv /tmp/${ZRAY_VERSION}/zray /opt/zray \
    && rm -rf /tmp/${ZRAY_VERSION} \
    # Z-Ray Plugins
    && curl -o doctrine2.zip -L https://github.com/sandrokeil/Z-Ray-Doctrine2/archive/master.zip \
    && unzip -o /tmp/doctrine2.zip -d /opt/zray/runtime/var/plugins/ \
    && mv /opt/zray/runtime/var/plugins/Z-Ray-Doctrine2-master /opt/zray/runtime/var/plugins/doctrine2 \
    && chown -R www-data:www-data /opt/zray

COPY config/ /etc/nginx/

WORKDIR /var/www
