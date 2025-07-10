# Dockerfile
FROM php:8.0-cli

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código al contenedor (incluido composer.json)
COPY . /app

# Instalar dependencias de sistema y PHP necesarias para Composer y extensiones PHP
RUN apt-get update && apt-get install -y libzip-dev unzip curl git && \
    docker-php-ext-install zip && \
    # Instalar Composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    # Instalar y habilitar xdebug
    pecl install xdebug && \
    docker-php-ext-enable xdebug

# Instalar las dependencias de PHP con Composer
RUN composer install

# Exponer el puerto 80 (si es necesario)
EXPOSE 80

# Comando por defecto para ejecutar la aplicación
CMD ["php", "index.php"]
