<?php

// we need these files to work with database
include_once('config.php');
include_once('dbutils.php');

//connect to mysql database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);
$data = json_decode(file_get_contents('php://input'), true);
$session_id = $data['session_id'];

// need to specify the two queries into separate variables
// we are updating tutor slots and credits when there is a cancellation
$query = "UPDATE tutorSlots SET hawkidStudent = NULL WHERE session_id = $session_id;";
queryDB($query, $db);
$query2 ="UPDATE studentCourse SET credits = (credits +1) WHERE courseNumber = (SELECT courseNumber FROM tutorSlots WHERE session_id = $session_id);";
queryDB($query2, $db);

// send the information as a json object.
$response = array();
$response['status'] = 'success';
header('Content-Type: application/json');
echo(json_encode($response));


?>
