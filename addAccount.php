<?php

# we need these files to work with database, do not push these with git
include_once('config.php');
include_once('dbutils.php');

# connecting to mysql database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);
$data = json_decode(file_get_contents('php://input'), true);
$username = $data['username'];
$role_id = $data['role_id'];
$hashedpass = '$2a$12$ZHJ8LLXjYecuJhkDspA8o.kFUG9VvfaWX5w3JT7N/xXMuDWpSTIle';

$isComplete = true;
    $errorMessage = "";

    // check if username meets criteria
    if (!isset($username) || (strlen($username) < 2)) {
        $isComplete = false;
        $errorMessage .= "Please enter a username with at least two characters. ";
    } else {
        $username = makeStringSafe($db, $username);
    }
    if ($isComplete) {

        // get the hashed password from the user with the username that got entered
        $query = "SELECT role_id FROM account WHERE username='$username';";
        $result = queryDB($query, $db);

        if ($result == $role_id) {
            // no such username
            $errorMessage .= " Username $username already has an account in the system. ";
            $isComplete = false;
        }
    }
    if ($isComplete) {
        $query = "INSERT INTO account (username, hashedpass, role_id) VALUES ('$username', '$hashedpass', '$role_id')";
        $result = queryDB($query, $db);
    
        $response = array();
        $response['status'] = 'success';
        header('Content-Type: application/json');
        echo(json_encode($response));
    }
    ?>
