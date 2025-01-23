FROM php:5.6-apache

# Install PDO MySQL extension
RUN docker-php-ext-install pdo_mysql

# Enable mod_rewrite
RUN a2enmod rewrite

# Add AllowOverride directive
RUN echo "<Directory /var/www/html>\nAllowOverride All\n</Directory>" > /etc/apache2/conf-available/allowoverride.conf
RUN a2enconf allowoverride

# Define the custom directory as an environment variable
ENV CUSTOM_DIR /var/www/html

# Copy your application files to the custom directory
COPY . ${CUSTOM_DIR}

# Expose port 80
EXPOSE 80
