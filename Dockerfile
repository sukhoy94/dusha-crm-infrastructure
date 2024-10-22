FROM php:8.3.12-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    curl \
    gnupg

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY ./crm-app /var/www/html

RUN composer install --no-dev --optimize-autoloader

# Install JavaScript dependencies using npm (adjust based on your needs)
RUN npm install

RUN mkdir -p /var/www/html/storage \
    && mkdir -p /var/www/html/bootstrap/cache

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/storage \
    && chmod -R 755 /var/www/html/bootstrap/cache

EXPOSE 9000

CMD ["php-fpm"]
