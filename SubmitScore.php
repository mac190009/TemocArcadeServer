<?php
//This page submits scores to the database.
// Example output:
$servername = "localhost";
$username = "temoc";
$password = "Utdftw";
$dbname = "arcade1";

// variables submitted by users
$playerID = _POST["playerID"];
$gameName = _POST["gameName"];
$score = _POST["score"];
$playTime = _POST["playTime"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// get session count.
$sql = "SELECT COUNT(*) FROM scoreboard WHERE player_id='" . $playerID . "'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  $rows = array();
  while($row = $result->fetch_assoc()) {  // associative array 
	  $rows[] = $row;
  }
  echo json_encode($rows);
} else {
  echo "0";
}

$conn->close();
?>
