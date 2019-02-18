FROM php:7.1.8-fpm
MAINTAINER Pietro Bongiovanni "info@pietrobongiovanni.com"

# Start General
## Set timezone
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# End General

## Install dependencies
RUN apt-get update -y
RUN apt-get -y install \
    libpng12-dev \
    libjpeg-dev \
    git \
    zip \
    mysql-client \
    libyaml-dev

## Install and configure PHP extensions
RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
RUN docker-php-ext-install \
        gd \
        mbstring \
        pdo \
        pdo_mysql \
        zip \
        bcmath \
        mysqli

RUN printf "\n" | pecl install yaml-2.0.2

RUN docker-php-ext-enable \
        yaml

ENV PHPREDIS_VERSION 3.0.0

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

## Add PHP configuration
COPY config/php/php.ini /usr/local/etc/php/conf.d/

## Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === trim(file_get_contents('https://composer.github.io/installer.sig'))) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --version=1.5.1
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN composer --version

EXPOSE 9000 80

# Cleanup
RUN rm -rf /var/lib/apt/lists/*
#End Cleanup