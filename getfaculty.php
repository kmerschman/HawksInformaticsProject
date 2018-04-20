<?php

// We need to include these two files in order to work with the database
include_once('config.php');
include_once('dbutils.php');

// get a connection to the database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);

$tablename = "facultyCourse";

// set up a query to get information on faculty
$query = "SELECT * FROM $tablename;";

// run the query to get info on faculty
$result = queryDB($query, $db);

// assign results to an array we can then send back to whomever called
$faculty = array();
$i = 0;

// go through the results one by one
while ($currFaculty = nextTuple($result)) {
    $faculty[$i] = $currFaculty;
    $i++;
}

// put together a JSON object to send back the data on the faculty
$response = array();
$response['status'] = 'success';

// 'value' corresponds to response.data.value in data.info.controller.js
// 'faculty' corresponds to ng-repeat="player in data.faculty | filter:query" in the index.html file
$response['value']['faculty'] = $faculty;
header('Content-Type: application/json');
echo(json_encode($response));

?>
