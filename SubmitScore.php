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
//$sessCount = result->fetch_assoc();//["COUNT(*)"];
//echo $sessCount["COUNT(*)"];
//echo $result->fetch_assoc()["COUNT(*)"];

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {  // associative array 
	  //echo "COUNT(*): " . $row["COUNT(*)"];
	  $sessCount = $row["COUNT(*)"];
  }
  echo $sessCount + 1; // This is the sessionID for this score submission.
} else {
  echo "0";
}

$sql = "INSERT INTO scoreboard (player_id, session_id, score, game, play_time)
		VALUES('" . $playerID . "', '" . $sessCount + 1 . "', '" . $score . "', '" . $gameName . "', '" . $playTime . "')";

//$result = $conn->query($sql);
if ($conn->query($sql) === TRUE) { 
          echo "Score successfully submitted!"; 
    }else { 
          echo "Error: " . $sql . "<br>" . $conn->error; 
    } 
 
$conn->close();
?>
