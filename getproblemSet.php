<?php

// We need to include these two files in order to work with the database
include_once('config.php');
include_once('dbutils.php');

$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);

$query1 = "SELECT problemNumber, question FROM problemSet WHERE courseNumber = '1020'";
$result1 = queryDB($query, $db);

$query2 = "SELECT problemNumber, question FROM problemSet WHERE courseNumber = '1110'";
$result2 = queryDB($query2, $db);

$query3 = "SELECT problemNumber, question FROM problemSet WHERE courseNumber = '1210'";
$result3 = queryDB($query3, $db);

$i = 0;
$j = 0;
$k = 0;

while ($currproblem1020 = nextTuple($result1)) {
    $problem[$i] = $currproblem1020;
    $i++;
};

while ($currproblem1110 = nextTuple($result2)) {
    $problem[$j] = $currproblem1110;
    $j++;
};

while ($currproblem1210 = nextTuple($result3)) {
    $problem[$k] = $currproblem1210;
    $k++;
};

//create JSON object for problemsets
$response = array();
$response['status'] = 'success';
$response['value']['problem'] = $problem;
header('Content-Type: application/json');
echo(json_encode($response));
?>
