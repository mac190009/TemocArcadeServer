<?php
//This page takes a playerID (requester) and a username (desired friend name) as argument and creates a friend_request entry in the database.

$servername = "localhost";
$username = "temoc";
$password = "Utdftw";
$dbname = "arcade1";

// variables submitted by users
$playerID = _POST["playerID"];
$friendName = "test";//_POST["friendName"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id FROM player WHERE username='" . $friendName . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  //$rows = array();
  while($row = $result->fetch_assoc()) {  // associative array 
	  $friendID = $row["id"];
  }
  //echo json_encode($rows);
  echo $friendID;
} else {
  echo "0";
}

$conn->close();
?>
