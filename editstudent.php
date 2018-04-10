<?php

// We need to include these two files in order to work with the database
include_once('config.php');
include_once('dbutils.php');


// get a handle to the database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);

// get data from the angular controller
// decode the json object
$data = json_decode(file_get_contents('php://input'), true);


// get each piece of data

// 'name' matches the name attribute in the form
$hawkidStudent = $data['hawkidStudent'];
$courseNumber = $data['courseNumber'];
$tutorCreditsRemaining = $data['tutorCreditsRemaining'];
$id = $id['id']
// set up variables to handle errors
// is complete will be false if we find any problems when checking on the data
$isComplete = true;

// error message we'll send back to angular if we run into any problems
$errorMessage = "";

// check if they are logged in
session_start();
if (!isset($_SESSION['username'])) {
    // if the session variable username is not set, then the user is not logged in and should not edit the player
    $isComplete = false;
    $errorMessage .= "User is not logged in.";
}


//
// Validation
//
if ($isComplete) {
    // check if name meets criteria
    if (!isset($hawkidStudent) || (strlen($hawkidStudent) < 2)) {
        $isComplete = false;
        $errorMessage .= "Please enter a name with at least two characters. ";
    } else {
        $hawkidStudent = makeStringSafe($db, $hawkidStudent);
    }

    if (!isset($courseNumber) || (strlen($courseNumber) < 2)) {
        $isComplete = false;
        $errorMessage .= "Please enter a courseNumber with at least two characters. ";
    } else {
        $courseNumber = makeStringSafe($db, $courseNumber);
    }

    if (!isset($tutorCreditsRemaining) || (strlen($tutorCreditsRemaining) < 2)) {
        $isComplete = false;
        $errorMessage .= "Please enter tutorCreditsRemaining with at least two characters. ";
    } else {
        $tutorCreditsRemaining = makeStringSafe($db, $tutorCreditsRemaining);
    }

    $video = makeStringSafe($db, $video);
}

// check if we already have a player with the same name, courseNumber, and tutorCreditsRemaining as the one we are processing (and is not the one we are processing)
if ($isComplete) {
    // set up a query to check if this player is in the database already
    $query = "SELECT hawkidStudent FROM student WHERE hawkidStudent='$hawkidStudent' AND courseNumber='$courseNumber' AND tutorCreditsRemaining='$tutorCreditsRemaining' AND id<>$id";

    // we need to run the query
    $result = queryDB($query, $db);

    // check on the number of records returned
    if (nTuples($result) > 0) {
        // if we get at least one record back it means the player is already in the database, so we have a duplicate
        $isComplete = false;
        $errorMessage .= "The student $hawkidStudent, from $courseNumber, with $tutorCreditsRemaining is already in the database. ";
    }
}


// check if the id passed to this api corresponds to an existing record in the database
if ($isComplete) {
    // set up a query to check if this player is in the database already
    $query = "SELECT hawkidStudent FROM student WHERE id=$id";

    // we need to run the query
    $result = queryDB($query, $db);

    // check on the number of records returned
    if (nTuples($result) == 0) {
        // if we get no results it means the id we got does not correspond to any records in the soccerplayers table
        $isComplete = false;
        $errorMessage .= "The id $id does not correspond to any students in the student table. ";
    }
}


// if we got this far and $isComplete is true it means we should edit the player in the database
if ($isComplete) {
    // we will set up the insert statement to add this new record to the database
    $updatequery = "UPDATE student SET hawkidStudent='$hawkidStudent', courseNumber='$courseNumber', tutorCreditsRemaining='$tutorCreditsRemaining', id=$id";

    // run the update statement
    queryDB($updatequery, $db);

    // send a response back to angular
    $response = array();
    $response['status'] = 'success';
    header('Content-Type: application/json');
    echo(json_encode($response));
} else {
    // there's been an error. We need to report it to the angular controller.

    // one of the things we want to send back is the data that his php file received
    ob_start();
    var_dump($data);
    $postdump = ob_get_clean();

    // set up our response array
    $response = array();
    $response['status'] = 'error';
    $response['message'] = $errorMessage . $postdump;
    header('Content-Type: application/json');
    echo(json_encode($response));
}

?>
