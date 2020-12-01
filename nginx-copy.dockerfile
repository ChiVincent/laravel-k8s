FROM nginx

WORKDIR /web

COPY .docker/production/nginx/nginx.conf /etc/nginx/nginx.conf
COPY .docker/production/nginx/www.conf /etc/nginx/conf.d/www.conf
COPY . .

