# PASO 1:

En primer lugar he hecho un git clone del repositorio donde estan los docker compose ya realizados. Para esta tarea he usado el example-09-LAMP. Y lo lanzamos con *_docker compose up -d_*.

# PASO 2: conf/000-default.conf

El archivo 000-default.conf configura establece el directorio raíz del servidor web, priorizando el archivo index.php.

# PASO 3: sql/schema.sql

El archivo schema.sql contiene el script SQL para crear la base de datos tienda y la tabla fabricante, así como insertar algunos datos de ejemplo en la tabla.

# PASO 4: src/index.php

El archivo index.php contiene el código PHP de la aplicación web, que se conecta a una base de datos MariaDB, realiza una consulta y muestra los resultados en el navegador.

# PASO 5: .env

El archivo .env define las variables de entorno necesarias para la configuración de los servicios en el archivo docker-compose.yml, incluyendo la contraseña de root de MariaDB, el nombre de la base de datos, el usuario y la contraseña.

# PASO 6: Dockerfile

El archivo Dockerfile define los pasos necesarios para construir una imagen personalizada de Apache con PHP y configurada para trabajar con una base de datos MariaDB.

# PASO 7: docker-compose.yml

El archivo docker-compose.yml define los servicios de Apache, MariaDB y phpMyAdmin, utilizando imágenes oficiales de Docker Hub para MariaDB y phpMyAdmin, y la imagen personalizada de Apache definida en el Dockerfile. Además, especifica los puertos expuestos y los volúmenes utilizados por cada servicio.
