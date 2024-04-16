<?php
$servername = "localhost";
$username = "tomec";
$password = "Utdftw";
$dbname = "test";

// variables submitted by users
$loginUser = $_POST["loginUser"];
$loginPass = $_POST["loginPass"];
$loginEmail = $_POST["loginEmail"];

// Create connection
//$conn = new mysqli($servername, $username, $password, $dbname);
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

//echo "Connected successfully!  Now we will show the users.<br><br>";


$sql = "SELECT username FROM player WHERE username = '" . $loginUser . "'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
   // Tell user that name is already taken
   echo "Username is already taken.";

} else {
	echo "Creating user...";
	//$passHash = password_hash($loginPass, PASSWORD_DEFAULT);
	// insert the user and password into the database
	$sql2 = "INSERT INTO player (username, password_hash, email)
	       VALUES ('" . $loginUser . "', '" . $loginPass . "', '" . $loginEmail ."')";

	if ($conn->query($sql2) === TRUE) {
		echo "New record created successfully";
	} else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}
}
/*
  }
} else {
  echo "0 results";
}
*/
$conn->close();
?>
