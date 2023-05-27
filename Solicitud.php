<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Nueva Solicitud</title>
	<link rel="stylesheet" href="estilos.css">
</head>

<body>
	<div class="Cont-ext">
		<div class="Cont-int">
			<form method="post" action="NuevaSolicitud.php">
				<h2 class="titulo">Nueva Solicitud</h2>
				<h4>Por favor complete los siguientes campos para resolver su solicitud.</h4>
				<?php
					$dbhost = "localhost";
					$dbuser = "root";
					$dbpass = "";
					$dbname = "assistme";

					$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

					if(!$conn)
					{
						die("No hay conexión: " .mysqli_connect_error());
					}

					$querySelectBloques = mysqli_query($conn, "SELECT * FROM bloques");
					$querySelectAulas= mysqli_query($conn, "SELECT * FROM aula");
					$querySelectAsuntos = mysqli_query($conn, "SELECT * FROM asuntos");
				?>
				<div>
					<label>BLOQUE</label>
					<select name="slcBloque" class="selects">
						<option value="0">Seleccione el bloque</option>
						<?php
							while ($dataSelect = mysqli_fetch_array($querySelectBloques)){?>
								<option value="<?php echo $dataSelect["ID"];?>">
									<?php echo utf8_encode($dataSelect["BLOQUE"]);?>
								</option>
						<?php } ?>
					</select>
				</div>
				<div>
					<label>AULA</label>
					<select name="slcAula" class="selects">
					<option value="0">Seleccione el aula</option>
						<?php
							while ($dataSelect = mysqli_fetch_array($querySelectAulas)){?>
								<option value="<?php echo $dataSelect["ID_AULA"];?>">
									<?php echo utf8_encode($dataSelect["AULA"]);?>
								</option>
						<?php } ?>
					</select>
				</div>
				<div>
					<label>MOTIVO</label>
					<select name="slcMotivo" class="selects">
						<option value="0">Seleccione el motivo</option>
						<?php
							while ($dataSelect = mysqli_fetch_array($querySelectAsuntos)){?>
								<option value="<?php echo $dataSelect["ID_ASUNT"];?>">
									<?php echo utf8_encode($dataSelect["ASUNTO"]);?>
								</option>
						<?php } ?>
						<option value="10">Otro</option>
					</select>
				</div>
				<div>
					<label style="text-align: left !important">DESCRIPCIÓN</label>
				</div>
				<div>
					<textarea name="txtDescripcion" rows="5"></textarea>
				</div>
				<?php
					session_start();
					if(isset($_SESSION['mensaje'])) 
					{
						$mensaje = $_SESSION['mensaje'];
						echo "<h3>$mensaje</h3>";
						unset($_SESSION['mensaje']);
						unset($_SESSION['usuario']);
					}
				?>
				<input type="submit" value="Enviar" class="boton" name="btnSolicitud"/>
			</form>
		</div>
		
	</div>

</body>
</html>