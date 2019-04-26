FROM nginx:1.15.2-alpine

RUN set -xe \
    && apk add --no-cache --virtual .build-deps \
        curl \
        gzip

RUN mkdir -p /etc/nginx/data \
    && curl -sSL -D - -A "Docker" -o /tmp/GeoIP.dat.gz https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz \
    && gunzip -c /tmp/GeoIP.dat.gz > /etc/nginx/data/GeoIP.dat \
    && curl -sSL -D - -A "Docker" -o /tmp/GeoLiteCity.dat.gz https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz \
    && gunzip -c /tmp/GeoLiteCity.dat.gz > /etc/nginx/data/GeoLiteCity.dat \
    && apk del .build-deps

COPY config/ /etc/nginx/

WORKDIR /var/www
