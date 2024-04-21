<?php
//This page takes a player ID as argument and returns a JSON encoded string listing all current friends usernames and IDs of user playerID.
$servername = "localhost";
$username = "temoc";
$password = "Utdftw";
$dbname = "arcade1";

// variables submitted by users
$playerID = $_POST["playerID"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "(SELECT p.username, p.id 
FROM player AS p INNER JOIN friends AS f
ON p.id = f.player_id2
WHERE f.player_id1 = '" . $playerID . "')
UNION
(SELECT p.username, p.id 
FROM player AS p INNER JOIN friends AS f
ON p.id = f.player_id1
WHERE f.player_id2 = '" . $playerID . "')";

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
