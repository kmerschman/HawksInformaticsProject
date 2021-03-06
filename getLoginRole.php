<?php
    include_once('config.php');
    include_once('dbutils.php');

      // get data from form
    $data = json_decode(file_get_contents('php://input'), true);
    $username = $data['username'];
    $password = $data['password'];

   // connect to the database
    $db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);

    // check for required fields
    $isComplete = true;
    $errorMessage = "";

    // check if username meets criteria
    if (!isset($username) || (strlen($username) < 2)) {
        $isComplete = false;
        $errorMessage .= "Please enter a username with at least two characters. ";
    } else {
        $username = makeStringSafe($db, $username);
    }
    // check if password meets criteria
    if (!isset($password) || (strlen($password) < 6)) {
        $isComplete = false;
        $errorMessage .= "Please enter a password with at least six characters. ";
    }

    if ($isComplete) {

        // get the hashed password from the user with the email that got entered
        $query = "SELECT hashedpass, role_id FROM account WHERE username='$username';";
        $result = queryDB($query, $db);

        if (nTuples($result) == 0) {
            // no such username
            $errorMessage .= " Username $username does not correspond to any account in the system. ";
            $isComplete = false;
        }
    }

    if ($isComplete) {
        // there is an account that corresponds to the email that the user entered
		// get the hashed password for that account
		$row = nextTuple($result);
		$hashedpass = $row['hashedpass'];

		// compare entered password to the password on the database
        // $hashedpass is the version of hashed password stored in the database for $username
        // $hashedpass includes the salt, and php's crypt function knows how to extract the salt from $hashedpass
        // $password is the text password the user entered in login.html
		if ($hashedpass != crypt($password, $hashedpass)) {
            // if password is incorrect
            $errorMessage .= " The password you enterered is incorrect. ";
            $isComplete = false;

                }
                $role = $row['role_id'];
    }
    if ($isComplete) {
        session_start();
        $_SESSION['username'] = $username;
        $_SESSION["password"] = $mypassword;

        $response = array();
        $response['status'] = 'success';
        $response['message'] = 'logged in';
        $response['role'] = $role;
        header('Content-Type: application/json');
        echo(json_encode($response));
    }
