FROM php:fpm

WORKDIR /web

VOLUME ["/web"]

RUN apt-get update -yq && apt-get install -yq libicu-dev && \
    docker-php-ext-install bcmath opcache pdo_mysql pcntl intl && \
    pecl install -o -f redis && docker-php-ext-enable redis

ENTRYPOINT [".docker/production/entrypoint.sh"]
