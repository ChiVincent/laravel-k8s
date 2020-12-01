FROM ghcr.io/chivincent-rosetta/laravel-php:cli

WORKDIR /app

COPY --from=ghcr.io/chivincent-rosetta/laravel-k8s-codebase /src .

RUN chmod -R 777 bootstrap/cache storage && \
    php artisan view:cache && php artisan event:cache

ENTRYPOINT [".docker/production/entrypoint.sh"]
