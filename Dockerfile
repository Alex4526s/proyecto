# Usar una imagen base de PHP
FROM php:8.0-cli

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el código al contenedor (incluido composer.json y composer.lock)
COPY . /app

# Instalar dependencias de sistema y PHP necesarias para Composer y extensiones PHP
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    curl \
    git && \
    docker-php-ext-install zip && \
    # Instalar Composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Asegurarse de que phpunit tenga permisos de ejecución
RUN chmod +x /app/vendor/bin/phpunit

# Instalar las dependencias de PHP con Composer
RUN composer install

# Exponer el puerto 80 (si es necesario)
EXPOSE 80

# Comando por defecto para ejecutar la aplicación
CMD ["php", "index.php"]
