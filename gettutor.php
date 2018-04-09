<?php

// We need to include these two files in order to work with the database
include_once('config.php');
include_once('dbutils.php');

// get a connection to the database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);

$tablename = "tutor";

// set up a query to get information on courses
$query = "SELECT * FROM $tablename;";

// run the query to get info on courses
$result = queryDB($query, $db);

// assign results to an array we can then send back to whomever called
$tutors = array();
$i = 0;

// go through the results one by one
while ($currTutor = nextTuple($result)) {
    $tutors[$i] = $currTutor;
    $i++;
}

// put together a JSON object to send back the data on the courses
$response = array();
$response['status'] = 'success';

// 'value' corresponds to response.data.value in data.soccer.controller.js
// 'courses' corresponds to ng-repeat="player in data.courses | filter:query" in the index.html file
$response['value']['tutors'] = $tutors;
header('Content-Type: application/json');
echo(json_encode($response));

?>
