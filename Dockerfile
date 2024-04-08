# Use official PHP image as base
FROM php:8.3-fpm

# Set working directory
WORKDIR /var/www/code

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    libicu-dev \
    git \
    && docker-php-ext-install intl pdo pdo_mysql

# Install Symfony CLI
#RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN curl -sS https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh | bash

RUN apt install symfony-cli
# Copy project files
COPY . .

# Install project dependencies
RUN php composer.phar install

# Expose port
EXPOSE 8000