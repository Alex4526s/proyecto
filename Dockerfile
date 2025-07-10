# Dockerfile
FROM php:8.0-cli

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el código al contenedor
COPY . /app

# Instalar dependencias de sistema y PHP necesarias para Composer y extensiones PHP
RUN apt-get update && apt-get install -y libzip-dev unzip curl git && \
    docker-php-ext-install zip && \
    # Instalar Composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    # Instalar PHPUnit
    composer install && \
    # Asegurarse de que los archivos en vendor/bin tengan permisos de ejecución
    chmod +x vendor/bin/phpunit

# Exponer el puerto 80 (si es necesario)
EXPOSE 80

# Comando por defecto para ejecutar la aplicación
CMD ["php", "index.php"]
