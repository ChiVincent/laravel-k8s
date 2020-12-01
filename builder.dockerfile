FROM composer as builder

WORKDIR /src

RUN composer install --classmap-authoritative --prefer-dist --ignore-platform-reqs --no-dev
