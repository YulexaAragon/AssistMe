<?php
session_start();
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "assistme";

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

if(!$conn)
{
	die("No hay conexión: " .mysqli_connect_error());
}

$bloque = $_POST["slcBloque"];
$motivo = $_POST["slcMotivo"];
$aula = $_POST["slcAula"];
$descripcion = $_POST["txtDescripcion"];


//Formulario
if(isset($_POST["btnSolicitud"]))
{
	if($bloque == "Seleccione el bloque" || $aula == "Seleccione el aula" || 
		$motivo == "Seleccione el motivo" || empty($descripcion)) 
	{
		$mensaje = "Todos los campos son obligatorios.";
		$_SESSION['mensaje'] = $mensaje;
		header("Location: solicitud.php");
		exit;
	}else
	{
		$queryGuardar = mysqli_query($conn, "INSERT INTO solicitudes(BLOQUE, AULA, MOTIVO, DESCRIPCION) 
		VALUES ('".$bloque."', '".$aula."', '".$motivo."', '".$descripcion."')");
		
		$message = "Solicitud enviada.";
		echo "<script type='text/javascript'>alert('$message'); window.location.href = 'solicitud.php'</script>";
	}
}
?>