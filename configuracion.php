<?php

header('Content-Type: text/html; charset=utf-8');
header("Cache-Control: no-cache, must-revalidate");

/////////////////////////////
// CONFIGURACION APP//
/////////////////////////////

$PROYECTO ='00_PROYECTOS/03_PWD_2023/Entregas/Tecno_Mates/';

//variable que almacena el directorio del proyecto
$ROOT =$_SERVER['DOCUMENT_ROOT']."/$PROYECTO/";

include_once($ROOT.'Util/funciones.php');

// Variable que define la pagina de autenticacion del proyecto
$INICIO = "Location:http://".$_SERVER['HTTP_HOST']."/$PROYECTO/Vista/Home/home.php";

// variable que define la pagina principal del proyecto (menu principal)
$PRINCIPAL = "Location:http://".$_SERVER['HTTP_HOST']."/$PROYECTO/Vista/Home/home.php";

$_SESSION['ROOT']=$ROOT;

?>