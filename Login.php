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

$usuario = $_POST["txtUsuario"];
$contrasena = $_POST["pwContrasenia"];
	
//Iniciar Sesión
if(isset($_POST["btnIncSesion"]))
{
	if(empty($usuario) || empty($contrasena)) 
	{
		$mensaje = "El usuario y la contraseña son campos obligatorios.";
		$_SESSION['mensaje'] = $mensaje;
		header("Location: IniciarSesion.php");
		exit;
	}else
	{
		$query = mysqli_query($conn, "SELECT * FROM usuario WHERE CEDULA='".$usuario."'");
		$nr = mysqli_num_rows($query);
		
		if($nr == 1)
		{
			if($usuario == $contrasena)
			{
				header("location:Solicitud.php");
			}else
			{
				$mensaje = "La contraseña es incorrecta.";
				$_SESSION['mensaje'] = $mensaje;
				$_SESSION['usuario'] = $usuario;
				header("Location: IniciarSesion.php");
				exit;
			}
		}
		else
		{
			$mensaje = "El usuario no se encuentra registado.";
			$_SESSION['mensaje'] = $mensaje;
			$_SESSION['usuario'] = $usuario;
			header("Location: IniciarSesion.php");
			exit;	
		}
	}
	
	
}
?>