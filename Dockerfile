# Use the official PHP image as base
FROM php:8.0-apache

# Install required dependencies
RUN apt-get update && apt-get install -y \
    wget \
    git \
    libzip-dev \
    && docker-php-ext-install zip

# Install Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Copy Xdebug configuration file
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
COPY index.php /var/www/html


EXPOSE 80
