FROM composer as builder

WORKDIR /src

COPY . .

RUN composer install --classmap-authoritative --prefer-dist --ignore-platform-reqs --no-dev
