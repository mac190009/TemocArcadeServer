<?php
$user = "example_user";
$password = "Utdftw";
$database = "arcade1";
$table = "player";

try {
	$db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);
	echo "<h2>PLAYERS</h2><ol>";
	foreach($db->query("SELECT username FROM $table") as $row) {
		echo "<li>" . $row['username'] . "</li>";
	}
	echo "</ol>";
} catch (PDOException $e) {
	print "Error!: " . $e->getMessage() . "<br/>";
}
