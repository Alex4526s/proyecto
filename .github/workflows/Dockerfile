# Usar una imagen base de PHP
FROM php:8.0-cli

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el código de la aplicación al contenedor
COPY . /app

# Instalar dependencias de Composer
RUN apt-get update && apt-get install -y libzip-dev unzip && \
    docker-php-ext-install zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instalar las dependencias de PHP con Composer
RUN composer install

# Exponer el puerto 80 (si es necesario)
EXPOSE 80

# Comando por defecto para ejecutar la aplicación
CMD ["php", "index.php"]
