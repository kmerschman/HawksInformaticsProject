<?php

// We need to include these two files in order to work with the database
include_once('config.php');
include_once('dbutils.php');

$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);
session_start();
$username = $_SESSION['username'];

$query = "SELECT * FROM tutorSlots WHERE hawkidTutor = '$username' AND hawkidStudent IS NOT NULL;";

$result = queryDB($query, $db);

$sessions = array();
$i = 0;

while ($thissession = nextTuple($result)) {
    $sessions[$i] = $thissession;
    $i++;
};

//create JSON object for tutorsessions
$response = array();
$response['status'] = 'success';
$response['value']['sessions'] = $sessions;
header('Content-Type: application/json');
echo(json_encode($response));
?>
