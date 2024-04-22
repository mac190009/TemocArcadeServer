<?php
//This page takes 2 playerIDs and a date as arguments and updates the associated friend_request entry.

$servername = "localhost";
$username = "temoc";
$password = "Utdftw";
$dbname = "arcade1";

// variables submitted by users
$frienderID = _POST["frienderID"];  // ID of player who requested friendship.
$friendeeID = _POST["friendeeID"];  // ID of player who received the request (Intended user of this page)
$requestDate = _POST["requestDate];  // Date request was made.

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// not tested
$sql = "UPDATE friend_request 
        SET status = 'DECLINED'
        WHERE playerID1='" . $frienderID . "' AND playerID2='" . $friendeeID . "' AND date='" . $requestDate . "'";

if ($conn->query($sql) === TRUE) { 
          echo "Friend request status updated!"; 
    }else { 
          echo "Error: " . $sql . "<br>" . $conn->error; 
    } 
