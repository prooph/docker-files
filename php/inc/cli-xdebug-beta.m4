# for MAC users
ENV XDEBUG_HOST=172.17.0.1

include(`xdebug-beta.m4')

# Copy custom configuration
COPY config/xdebug-cli.ini /usr/local/etc/php/conf.d/
