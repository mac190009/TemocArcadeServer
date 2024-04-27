<?php
//This page takes a playerID (requester) and a username (desired friend name) as argument and creates a friend_request entry in the database.

$servername = "localhost";
$username = "temoc";
$password = "Utdftw";
$dbname = "arcade1";

// variables submitted by users
$playerID = $_POST["playerID"];
$friendName = $_POST["friendName"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get friendID from friendName
$sql = "SELECT id FROM player WHERE username='" . $friendName . "'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {  // associative array 
	  $friendID = $row["id"];
  }
  //echo $friendID;
} else {
  echo "0";
}

// Submit friend_request
$sql = "INSERT INTO friend_request (player_id1, player_id2, status) VALUES ('" . $playerID . "', '" . $friendID . "', 'PENDING')";

//$result = $conn->query($sql);
if ($conn->query($sql) === TRUE) { 
          echo "Friend request created!"; 
    }else { 
          echo "Error: " . $sql . "<br>" . $conn->error; 
    } 

$conn->close();
?>
