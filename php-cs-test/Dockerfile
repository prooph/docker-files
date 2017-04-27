FROM composer

RUN composer global require prooph/php-cs-fixer-config

COPY rules.php /rules.php

VOLUME /sut
WORKDIR /sut

ENTRYPOINT ["/composer/vendor/bin/php-cs-fixer", "fix", "--dry-run", "--diff", "--config=/rules.php"]
