<?php

// We need to include these two files in order to work with the database
include_once('config.php');
include_once('dbutils.php');

$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);

$query = "SELECT courseNumber, credits FROM studentCourse WHERE hawkid = 'kmbillings';";

$result = queryDB($query, $db);

$credits = array();
$i = 0;

while ($thiscredit = nextTuple($result)) {
    $credits[$i] = $thiscredit;
    $i++;
};

//create JSON object for movies
$response = array();
$response['status'] = 'success';
$response['value']['credits'] = $credits;
header('Content-Type: application/json');
echo(json_encode($response));
?>
