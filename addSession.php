<?php

# we need these files to work with database, do not push these with git
include_once('config.php');
include_once('dbutils.php');

# connecting to mysql database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);
$data = json_decode(file_get_contents('php://input'), true);
$session_id = $data['session_id'];

# starting the session
session_start();
$username = $_SESSION['username'];

$query = "UPDATE tutorSlots SET hawkidStudent = '$username' WHERE session_id = '$session_id';";
queryDB($query, $db);

$query1 = "UPDATE studentCourse SET credits = (credits - 1) WHERE hawkid = '$username' AND courseNumber = (SELECT tutorSlots.courseNumber FROM tutorSlots WHERE session_id = '$session_id');";
queryDB($query1, $db);

# package the results in an array and send json object back with response
$response = array();
$response['status'] = 'success';
header('Content-Type: application/json');
echo(json_encode($response));


?>
