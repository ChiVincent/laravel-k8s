FROM ghcr.io/chivincent-rosetta/laravel-php:fpm

WORKDIR /web

COPY --from=ghcr.io/chivincent-rosetta/laravel-k8s-codebase /src .

RUN php artisan view:cache && php artisan event:cache

ENTRYPOINT [".docker/production/entrypoint.sh"]

CMD ["php-fpm"]
