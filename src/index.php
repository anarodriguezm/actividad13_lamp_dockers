<?php
define('MARIADB_HOST', 'mysql');
define('MARIADB_DATABASE', 'tienda');
define('MARIADB_USER', 'user');
define('MARIADB_PASSWORD', 'password');

$mysqli = new mysqli(MARIADB_HOST, MARIADB_USER, MARIADB_PASSWORD, MARIADB_DATABASE);
$result = $mysqli->query("SELECT * FROM fabricante");
$mysqli->close();

foreach ($result as $row) {
    echo $row['nombre'] . "<br>";
}
?>

