FROM php:fpm

WORKDIR /web

COPY --from=ghcr.io/chivincent-rosetta/laravel-k8s-codebase /src .

RUN apt-get update -yq && apt-get install -yq libicu-dev && \
    docker-php-ext-install bcmath opcache pdo_mysql pcntl intl && \
    pecl install -o -f redis && docker-php-ext-enable redis

RUN chmod -R 777 bootstrap/cache storage && \
    php artisan view:cache && php artisan event:cache

ENTRYPOINT [".docker/production/entrypoint.sh"]
