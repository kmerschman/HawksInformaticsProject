
<?php

# we need these files to work with database, do not push these with git
include_once('config.php');
include_once('dbutils.php');

# connecting to mysql database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);
$data = json_decode(file_get_contents('php://input'), true);
$password = $data['password'];

# starting the session
session_start();
$username = $_SESSION['username'];


$isComplete = true;
$errorMessage = "";

if ($isComplete) {
    
    $hashedpass = crypt($password, getSalt());
    
    $query = "UPDATE account SET hashedpass = '$hashedpass' WHERE username = '$username'";
    
    queryDB($query, $db);
    
    $response = array();
    $response['status'] = 'success';
    header('Content-Type: application/json');
    echo(json_encode($response));    
} else {

    ob_start();
    var_dump($data);
    $postdump = ob_get_clean();
    $response = array();
    $response['status'] = 'error';
    $response['message'] = $errorMessage . $postdump;
    header('Content-Type: application/json');
    echo(json_encode($response));    
}

?>
