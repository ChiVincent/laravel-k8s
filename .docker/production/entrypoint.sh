#!/bin/bash

chmod -R 777 storage bootstra/cache

php artisan optimize

exec "$@"
