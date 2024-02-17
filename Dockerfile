# Dockerfile para la imagen Apache

# Utilizamos Debian como imagen base
FROM debian:latest

# Configuramos la variable de entorno para la instalación de paquetes
ENV DEBIAN_FRONTEND=noninteractive

# Instalamos Apache y los paquetes necesarios para PHP y MariaDB
RUN apt-get update && \
    apt-get install -y apache2 php libapache2-mod-php php-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configuramos Apache para priorizar el archivo index.php
COPY conf/000-default.conf /etc/apache2/sites-available/000-default.conf

# Exponemos el puerto 80 para acceder al servicio de Apache
EXPOSE 80

# Iniciamos Apache en primer plano al ejecutar el contenedor
CMD ["apachectl", "-D", "FOREGROUND"]
