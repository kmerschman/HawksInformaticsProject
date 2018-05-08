<?php

// We need to include these two files in order to work with the database
include_once('config.php');
include_once('dbutils.php');


// establish connection to the mysql database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);

$query = "SELECT * FROM account;";
$result = queryDB($query, $db);

$accounts = array();
$i = 0;

while ($thisaccount = nextTuple($result)) {
    $accounts[$i] = $thisaccountt;
    $i++;
};

//create JSON object for credits
$response = array();
$response['status'] = 'success';
$response['value']['accounts'] = $accounts;
header('Content-Type: application/json');
echo(json_encode($response));
?>
