<?php
//This page takes a playerID as argument and returns a JSON encoded list of the requesters username, ID, and the date of request.
// Example output: [{"username":"test2","player_id1":"2","date":"2024-04-18 22:09:05"}]
$servername = "localhost";
$username = "temoc";
$password = "Utdftw";
$dbname = "arcade1";

// variables submitted by users
$playerID = _POST["playerID"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT p.username, r.player_id1, r.date 
        FROM player AS p INNER JOIN friend_request AS r
        ON p.id = r.player_id1
        WHERE r.status = 'PENDING' AND r.player_id2 = '" . $playerID . "'";

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
