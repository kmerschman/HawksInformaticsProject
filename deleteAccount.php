<?php

# we need these files to work with database, do not push these with git
include_once('config.php');
include_once('dbutils.php');

# connecting to mysql database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);
$data = json_decode(file_get_contents('php://input'), true);
$username = $data['username'];


$query = "DELETE FROM account WHERE username = '$username';";
queryDB($query, $db);

# package the results in an array and send json object back with response
$response = array();
$response['status'] = 'success';
header('Content-Type: application/json');
echo(json_encode($response));


?>