<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Iniciar Sesión</title>
	<link rel="stylesheet" href="estilos.css">
</head>
<body>
	<?php
		session_start();
	?>
	<div class="Contenedor-ext">
		<div class="Contenedor-int">
			<form method="POST" action="Login.php">
				<h2>Iniciar Sesión</h2>
				<div>
					<img src="Imagenes/Usuario.png">
					<input type="text" name="txtUsuario" class="inputs" value="<?php echo isset($_SESSION['usuario']) ? $_SESSION['usuario'] : ''; ?>">
				</div>
				<div>
					<img src="Imagenes/Contrasenia.png">
					<input type="password" name="pwContrasenia" class="inputs">

				</div>
				<?php
					if(isset($_SESSION['mensaje'])) 
					{
						$mensaje = $_SESSION['mensaje'];
						echo "<h3>$mensaje</h3>";
						unset($_SESSION['mensaje']);
						unset($_SESSION['usuario']);
					}
				?>
				<input type="submit" value="Ingresar" class="boton" name="btnIncSesion"/>
			</form>
		</div>
		
	</div>

</body>
</html>