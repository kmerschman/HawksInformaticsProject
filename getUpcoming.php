<?php

// We need to include these two files in order to work with the database
include_once('config.php');
include_once('dbutils.php');

$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);
session_start();
$username = $_SESSION['username'];

$query = "SELECT session_id, hawkidTutor, courseNumber, weekday, timeslot FROM tutorSlots WHERE hawkidStudent = '$username';";

$result = queryDB($query, $db);

$sessions = array();
$i = 0;

while ($thissession = nextTuple($result)) {
    $sessions[$i] = $thissession;
    $i++;
};

//create JSON object for movies
$response = array();
$response['status'] = 'success';
$response['value']['sessions'] = $sessions;
header('Content-Type: application/json');
echo(json_encode($response));
?>
