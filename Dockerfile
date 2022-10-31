FROM php:8.1.12-apache
COPY security.conf /etc/apache2/conf-available/security.conf
COPY php.ini /usr/local/etc/php/
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev libonig-dev wget
RUN docker-php-ext-install mysqli mbstring gd
RUN apt-get update && apt-get install -y imagemagick libmagickwand-dev  && pecl install imagick  && docker-php-ext-enable imagick
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp-cli
RUN chmod +x /usr/local/bin/wp-cli
