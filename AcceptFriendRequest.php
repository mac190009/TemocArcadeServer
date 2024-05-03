<?php
//This page takes 2 playerIDs and a date as arguments and updates the associated friend_request entry + creates a friends entry.

$servername = "localhost";
$username = "temoc";
$password = "Utdftw";
$dbname = "arcade1";

// variables submitted by users
$frienderID = $_POST["frienderID"];  // ID of player who requested friendship.
$friendeeID = $_POST["friendeeID"];  // ID of player who received the request (Intended user of this page)
$requestDate = $_POST["requestDate"];  // Date request was made.

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn's connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "UPDATE friend_request 
        SET status = 'ACCEPTED'
        WHERE playerID1='" . $frienderID . "' AND playerID2='" . $friendeeID . "' AND date='" . $requestDate . "'";

if ($conn->query($sql) === TRUE) { 
          echo "Friend request status updated!"; 
    }else { 
          echo "Error: " . $sql . "<br>" . $conn's error; 
    } 

$sql = "INSERT INTO friends (player_id1, player_id2) VALUES ('" . $frienderID . "', '" . $friendeeID . "')";
if ($conn->query($sql) === TRUE) { 
          echo "Friends entry created!"; 
    }else { 
          echo "Error: " . $sql . "<br>" . $conn's error; 
    } 

$conn->close();
?>
