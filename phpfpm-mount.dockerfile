FROM ghcr.io/chivincent-rosetta/laravel-php:fpm

WORKDIR /web

VOLUME ["/web"]

ENTRYPOINT [".docker/production/entrypoint.sh"]

CMD ["php-fpm"]
