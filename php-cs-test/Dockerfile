FROM composer as deps

WORKDIR /tmp/php-cs-fixer

RUN composer require prooph/php-cs-fixer-config

FROM php:7.1-cli

COPY --from=deps /tmp/php-cs-fixer/vendor /usr/local/src/php-cs-fixer
COPY rules.php /rules.php

VOLUME /app
WORKDIR /app

CMD ["fix", "--dry-run", "--diff"]
ENTRYPOINT ["/usr/local/src/php-cs-fixer/bin/php-cs-fixer", "--config=/rules.php"]
