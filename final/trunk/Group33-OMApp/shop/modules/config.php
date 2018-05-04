<?php 
	error_reporting(E_ALL ^ E_WARNING); 
	$name_server = "localhost";
	$name_host 	 = "root";
	$pass 		 = "";
	$database 	 = "om";
	$conn 		 = mysqli_connect($name_server,$name_host,$pass,$database) or die('Ket noi that bai:'.mysqli_connect_error());
	mysqli_select_db($database,$conn);
	
?>