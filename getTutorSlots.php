<?php

// We need to include these two files in order to work with the mysql database
include_once('config.php');
include_once('dbutils.php');

$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);
// select the session identification, the tutor and student hawkid(s), courseNumber, day of the week and the time slot. all from the tutorSlots table.
$query = "SELECT session_id, hawkidTutor, courseNumber, weekday, timeslot FROM tutorSlots WHERE hawkidStudent IS NULL;";

$result = queryDB($query, $db);

$slots = array();
$i = 0;

while ($thisslot = nextTuple($result)) {
    $slots[$i] = $thisslot;
    $i++;
};

//create JSON object for slots
$response = array();
$response['status'] = 'success';
$response['value']['slots'] = $slots;
header('Content-Type: application/json');
echo(json_encode($response));
?>
