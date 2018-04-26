<?php

// We need to include these two files in order to work with the mysql database
include_once('config.php');
include_once('dbutils.php');

$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);

$query = "SELECT courseNumber, credits FROM studentCourse WHERE hawkid = 'kmbillings' OR hawkid = 'kmerschman'";

$result = queryDB($query, $db);
# create an array holding course credit information 
$credits = array();
$i = 0;

while ($thiscredit = nextTuple($result)) {
    $credits[$i] = $thiscredit;
    $i++;
};

//create JSON object for credits
$response = array();
$response['status'] = 'success';
$response['value']['credits'] = $credits;
header('Content-Type: application/json');
echo(json_encode($response));
?>
