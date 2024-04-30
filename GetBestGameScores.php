<?php
//This page takes a game name as an argument and returns a JSON encoded string containing the 10 highest scores and the usernames of the player that made the score.
//Example Output: [{"username":"test2","score":"2000"},{"username":"test3","score":"1337"},{"username":"test","score":"1337"},{"username":"test","score":"1000"},{"username":"test2","score":"1000"},{"username":"test2","score":"1000"},{"username":"test2","score":"1000"},{"username":"test2","score":"1000"},{"username":"test","score":"1000"},{"username":"test","score":"1000"}]
$servername = "localhost";
$username = "temoc";
$password = "Utdftw";
$dbname = "arcade1";

// variables submitted by users
$gameName = $_POST["gameName"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT p.username, s.score 
	FROM player AS p INNER JOIN scoreboard AS s 
	ON p.id = s.player_id
	WHERE s.game='" . $gameName . "' 
	ORDER BY s.score DESC
        LIMIT 10";
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
