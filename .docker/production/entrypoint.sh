#!/bin/bash

chmod -R 777 storage bootstrap/cache

php artisan optimize

exec "$@"
