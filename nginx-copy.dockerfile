FROM nginx

WORKDIR /web

COPY .docker/production/nginx/nginx.conf /etc/nginx/nginx.conf
COPY .docker/production/nginx/www.conf /etc/nginx/conf.d/www.conf
COPY --from=ghcr.io/chivincent-rosetta/laravel-k8s-codebase /src .

CMD ["nginx", "-g", "daemon off;"]
