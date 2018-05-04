<?php
$servername = "localhost";
$username = "id4993663_om";
$password = "ttcnpmhk17233";
$dbname = "id4993663_om";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT id, name FROM helloworld";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "This is String " . $row["name"]. " is queried from SQL Server Database<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>