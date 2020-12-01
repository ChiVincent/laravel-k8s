FROM ghcr.io/chivincent-rosetta/laravel-php:apache

WORKDIR /var/www

RUN a2enmod rewrite

COPY --from=ghcr.io/chivincent-rosetta/laravel-k8s-codebase /src .

COPY .docker/production/apache/sites.conf /etc/apache2/sites-available/000-default.conf
RUN chmod -R 777 bootstrap/cache storage && \
    php artisan view:cache && php artisan event:cache

ENTRYPOINT [".docker/production/entrypoint.sh"]

CMD ["apache2-foreground"]
