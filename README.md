# PASO 1:

En primer lugar he hecho un git clone del repositorio donde estan los docker compose ya realizados. Para esta tarea he usado el example-09-LAMP. Y lo lanzamos con *_docker compose up -d_*.

# PASO 2: conf/000-default.conf

En este archivo se realizaron modificaciones para configurar el servidor Apache de manera que priorice el archivo index.php sobre index.html. Esto se logra agregando la siguiente línea:

  DirectoryIndex index.html index.php

Al incluir index.php como la primera opción en la lista de archivos index, estamos asegurando que cuando un usuario acceda al servidor, el archivo index.php será el primero que se cargue si existe.

# PASO 3: sql/schema.sql

Cambie el schema.sql y aplique el siguiente codigo:

    DROP DATABASE IF EXISTS tienda;

    CREATE DATABASE tienda CHARSET utf8mb4;

    USE tienda;

    CREATE TABLE fabricante (

        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

        nombre VARCHAR(100) NOT NULL

    );

    INSERT INTO fabricante VALUES(1, 'Asus');

    INSERT INTO fabricante VALUES(2, 'Lenovo');

    INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');

    INSERT INTO fabricante VALUES(4, 'Samsung');

# PASO 4: src/index.php

Cambien el index.php y añadi el siguiente codigo:

    <?php

     define('MARIADB_HOST', 'mysql');

     define('MARIADB_DATABASE', 'tienda');

     define('MARIADB_USER', 'user');

     define('MARIADB_PASSWORD', 'password');

     $mysqli = new mysqli(MARIADB_HOST, MARIADB_USER, MARIADB_PASSWORD,MARIADB_DATABASE);

     $result = $mysqli->query("SELECT * FROM fabricante");

     $mysqli->close();

     foreach ($result as $row) {

        echo $row['nombre']."<br>";

     }

    ?>

# PASO 5: .env

Se creó este archivo para almacenar variables de entorno que serán utilizadas por el sistema. En él, se definieron las siguientes variables:

    MARIADB_ROOT_PASSWORD=root
    MARIADB_HOST=mysql
    MARIADB_DATABASE=tienda
    MARIADB_USER=user
    MARIADB_PASSWORD=password

Estas variables serán utilizadas por el sistema para configurar la base de datos MariaDB y la aplicación web.

# PASO 6: Dockerfile

El archivo Dockerfile fue modificado para incluir los paquetes necesarios en la imagen Docker. Se agregaron las siguientes líneas:

    ENV DEBIAN_FRONTEND=noninteractive

    RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-mysql

Esto asegura que Apache, PHP y los módulos necesarios estén instalados en la imagen.

# PASO 6: docker-compose.yml

El archivo docker-compose.yml fue modificado para definir los servicios de Apache, MariaDB y phpMyAdmin, junto con la configuración de los volúmenes y los puertos expuestos. Por ejemplo:

services:
  apache:
   
    ports:
      - "80:80"
    
  mariadb:
   
    ports:
      - "3306:3306"
   

Estas líneas configuran los puertos expuestos para que los servicios sean accesibles desde el host.

Con estas modificaciones, se logra configurar un entorno de desarrollo LAMP con una pequeña aplicación web utilizando contenedores Docker y Docker Compose.
