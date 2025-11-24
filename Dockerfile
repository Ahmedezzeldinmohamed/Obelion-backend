FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev

RUN docker-php-ext-install pdo_mysql zip

COPY . /var/www
WORKDIR /var/www
