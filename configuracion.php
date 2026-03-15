<?php

header('Content-Type: text/html; charset=utf-8');
header("Cache-Control: no-cache, must-revalidate");

/////////////////////////////
// CONFIGURACION APP//
/////////////////////////////

// Con el servidor integrado de PHP (php -S localhost:8000) ejecutado desde
// la raíz del proyecto, DOCUMENT_ROOT ya apunta a la carpeta del proyecto.
$ROOT = $_SERVER['DOCUMENT_ROOT']."/";

include_once($ROOT.'Util/funciones.php');

// Variable que define la pagina de autenticacion del proyecto
$INICIO = "Location:http://".$_SERVER['HTTP_HOST']."/Vista/Home/home.php";

// variable que define la pagina principal del proyecto (menu principal)
$PRINCIPAL = "Location:http://".$_SERVER['HTTP_HOST']."/Vista/Home/home.php";

$_SESSION['ROOT']=$ROOT;

?>