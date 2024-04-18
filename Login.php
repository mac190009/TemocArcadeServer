<?php
$servername = "localhost";
$username = "tomec";
$password = "Utdftw";
$dbname = "arcade1";

// variables submitted by users
$loginUser = $_POST["loginUser"];
$loginPass = $_POST["loginPass"];

// Create connection
//$conn = new mysqli($servername, $username, $password, $dbname);
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

//echo "Connected successfully!  Now we will show the users.<br><br>";


$sql = "SELECT id, password_hash FROM player WHERE username = '" . $loginUser . "'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {  // associative array 
	  if (password_verify($loginPass, $row["password_hash"])) {
      echo $row["id"];
    // Get user's data here.

    //Get player info.

    //Get Inventory

    //Modify player data.

    // Update inventory
    } else {
      echo "Wrong Credentials.";
    }
  }
} else {
  echo "Username not found.";
}

$conn->close();
?>
