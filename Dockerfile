# Use a base image that includes PHP and Apache
FROM php:latest

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install Apache and its utilities
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Enable rewrite module
RUN a2enmod rewrite

# Install any needed extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Copy the contents of your application into the Apache document root
COPY . /var/www/html

# Run Composer install
RUN composer install

# Change ownership of the application directory to the Apache user
RUN chown -R www-data:www-data /var/www/html

# Set up any additional configurations or dependencies your application needs
# For example:
# RUN apt-get install -y <additional-packages>

# Expose port 80 for Apache
EXPOSE 80

# Start Apache in the foreground when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]


# FROM php

# RUN apt-get update && \
#     apt-get install -y libpng-dev libjpeg-dev zip unzip && \
#     docker-php-ext-configure gd --with-jpeg && \
#     docker-php-ext-install gd pdo pdo_mysql

# COPY . /var/www/html
# RUN chown -R www-data:www-data /var/www/html/storage
# RUN a2enmod rewrite

# EXPOSE 80

# CMD ["apache2-foreground"]

