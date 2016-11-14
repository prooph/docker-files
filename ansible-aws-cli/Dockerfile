FROM docker:1.12

RUN set -xe \
    && apk add --no-cache --virtual .build-deps \
        autoconf \
        cmake \
        file \
        g++ \
        gcc \
        libc-dev \
        openssl-dev \
        python-dev \
        libffi-dev \
        make \
        git \
        pkgconf \
        re2c

RUN apk add --no-cache --virtual .persistent-deps \
    py-pip \
    libffi \
    curl \
    openssl \
    groff \
    less \
    python \
    && pip install --upgrade \
        awscli \
        ansible \
        boto \
        pip \
    && mkdir /app \
    && apk del .build-deps

WORKDIR /app

# Set up the application directory
VOLUME ["/app"]

# Setup user home
VOLUME ["/root"]

CMD ["ansible", "--help"]
