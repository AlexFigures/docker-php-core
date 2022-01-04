FROM php:8.0-fpm

RUN chsh -s /bin/bash www-data \
    && mkdir /home/www-data \
    && chown -R www-data:www-data /home/www-data \
    && usermod -d /home/www-data www-data \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer self-update

RUN apt-get update \
    && apt-get install -y \
            nano \
            nginx \
            sudo \
            ssh-client \
            supervisor \
            iputils-ping \
            librdkafka-dev \
            libssl-dev \
            zlib1g-dev \
            curl \
            git \
            unzip \
            netcat \
            libxml2-dev \
            libpq-dev \
            libzip-dev \
            wget \
            libgmp-dev \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h \
    && rm -rf /etc/nginx/sites-enabled/default


RUN mkdir /app && chown -R www-data:www-data /app


