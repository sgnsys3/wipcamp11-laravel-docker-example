FROM wipcamp/11-laravel-base-image:1.0.0

WORKDIR /var/www/html

COPY ./composer.json .
RUN composer install --no-dev --no-autoloader --no-scripts

COPY ./artisan .
COPY ./server.php .

COPY ./app ./app
COPY ./bootstrap ./bootstrap
COPY ./config ./config
COPY ./routes ./routes
COPY ./database ./database
COPY ./storage ./storage
COPY ./public ./public
COPY ./resources ./resources
COPY ./server.php .
RUN composer dump-autoload
RUN php artisan view:clear
RUN chmod -R 777 bootstrap/cache
RUN chmod -R 777 storage
