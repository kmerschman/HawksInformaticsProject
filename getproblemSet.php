<?php

// We need to include these two files in order to work with the database
include_once('config.php');
include_once('dbutils.php');

$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);


session_start();
$username = $_session['username'];

$query1 = "SELECT question FROM problemSet WHERE courseNumber = (SELECT courseNumber FROM studentCourse WHERE hawkid = '$username');";
$result1 = queryDB($query, $db);


//create JSON object for problemsets
$response = array();
$response['status'] = 'success';
$response['value']['question'] = $result1;
header('Content-Type: application/json');
echo(json_encode($response));
?>
