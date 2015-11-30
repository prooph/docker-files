FROM prooph/php:5.6-fpm

# Z-Ray
RUN curl -L http://downloads.zend.com/zray/2010/zray-php-101832-php5.6.11-linux-debian7-amd64.tar.gz | tar zx \
    && mv /tmp/zray-php-101832-php5.6.11-linux-debian7-amd64/zray /opt/zray

# Z-Ray Plugins
RUN curl -o doctrine2.zip -L https://github.com/sandrokeil/Z-Ray-Doctrine2/archive/master.zip \
    && unzip -o /tmp/doctrine2.zip -d /opt/zray/runtime/var/plugins/ \
    && mv /opt/zray/runtime/var/plugins/Z-Ray-Doctrine2-master /opt/zray/runtime/var/plugins/doctrine2

RUN ln -fs /opt/zray/lib/zray.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/zray.so \
    && ln -fs /opt/zray/zray.ini /usr/local/etc/php/conf.d/zray.ini \
    && chown -R www-data:www-data /opt/zray
