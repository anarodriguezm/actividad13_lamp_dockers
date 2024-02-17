# Utilizando la imagen base de Debian
FROM debian:latest

# Configurando la variable de entorno DEBIAN_FRONTEND como noninteractive
ENV DEBIAN_FRONTEND=noninteractive 

# Actualizando e instalando Apache, PHP y MySQL
RUN apt-get update && \
    apt-get install -y apache2 php libapache2-mod-php php-mysql

# Copiando el código de la aplicación web al directorio /var/www/html
COPY src/index.php /var/www/html/index.php

# Exponiendo el puerto 80 para el servicio de Apache
EXPOSE 80

# Iniciando el servicio de Apache al ejecutar el contenedor
CMD ["apache2ctl", "-D", "FOREGROUND"]
