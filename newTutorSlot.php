<?php

include_once('config.php');
include_once('dbutils.php');

//Connect to database
$db = connectDB($DBHost, $DBUser, $DBPassword, $DBName);

$data = json_decode(file_get_contents('php://input'), true);

session_start();
$hawkidTutor = $_SESSION['username'];
$courseNumber = $data['courseNumber'];
$weekday = $data['weekday'];
$timeslot = $data['timeslot'];


$isComplete = true;
$errorMessage = "";

//Check data
if (!isset($hawkidTutor) || (strlen($hawkidTutor) < 2)) {
    $isComplete = false;
    $errorMessage .= "Please enter a hawkidTutor with at least two characters. ";
} else {
    $hawkidTutor = makeStringSafe($db, $hawkidTutor);
}if (!isset($courseNumber) || (strlen($courseNumber) < 2)) {
    $isComplete = false;
    $errorMessage .= "Please enter a courseNumber with at least two characters. ";
} else {
    $courseNumber = makeStringSafe($db, $courseNumber);
}if (!isset($weekday) || (strlen($weekday) < 2)) {
    $isComplete = false;
    $errorMessage .= "Please enter a weekday with at least two characters. ";
} else {
    $weekday = makeStringSafe($db, $weekday);
}if (!isset($timeslot) || (strlen($timeslot) < 2)) {
    $isComplete = false;
    $errorMessage .= "Please enter a timeslot with at least two characters. ";
} else {
    $timeslot = makeStringSafe($db, $timeslot);
}


//Check table fo duplicates
if ($isComplete) {
    $query = "SELECT hawkidTutor FROM tutorSlots WHERE hawkidTutor='$hawkidTutor' AND courseNumber='$courseNumber' AND weekday='$weekday' AND timeslot = '$timeslot';";
    $result = queryDB($query, $db);
    
    if (nTuples($result) > 0) {
        $isComplete = false;
        $errorMessage .= "$hawkidTutor already has a time slot for $courseNumber on $weekday at $timeslot.";
    }
}

if ($isComplete) {
    $insertquery = "INSERT INTO tutorSlots(hawkidTutor, courseNumber, weekday, timeslot) VALUES ('$hawkidTutor', '$courseNumber', '$weekday', '$timeslot')";
    
    queryDB($insertquery, $db);

    $session_id = mysqli_insert_id($db);
    
    $response = array();
    $response['status'] = 'success';
    $response['session_id'] = $session_id;
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

