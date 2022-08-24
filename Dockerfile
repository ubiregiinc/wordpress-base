FROM php:7.4-apache
COPY php.ini /usr/local/etc/php/
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev libonig-dev
RUN docker-php-ext-install mysqli mbstring gd
RUN apt-get update && apt-get install -y imagemagick libmagickwand-dev  && pecl install imagick  && docker-php-ext-enable imagick

