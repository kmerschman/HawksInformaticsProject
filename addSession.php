<?php

//need these files to work with database
include_once('config.php');
include_once('dbutils.php');

//connect to database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);
$data = json_decode(file_get_contents('php://input'), true);
$session_id = $data['session_id'];

session_start();
$username = $_SESSION['username'];

$query = "UPDATE tutorSlots SET hawkidStudent = '$username' WHERE session_id = $session_id;";
queryDB($query, $db);
$response = array();
$response['status'] = 'success';
header('Content-Type: application/json');
echo(json_encode($response));    


?>
