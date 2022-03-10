<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
		$name = $_GET['name'];
		$email = $_GET['email'];
		$avatar = $_GET['avatar'];
		$user = $_GET['user'];
		$password = $_GET['password'];
		$phone = $_GET['phone'];
		$address = $_GET['address'];
		$lat = $_GET['lat'];
		$lng = $_GET['lng'];
		
							
		$sql = "INSERT INTO `user`(`id`, `name`, `email`, `avatar`, `user`, `password`, `phone`, `address`, `lat`, `lng`) VALUES (Null,'$name','$email','$avatar','$user','$password','$phone','$address','$lat','$lng')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome in your movieapp";
   
}
	mysqli_close($link);
?>