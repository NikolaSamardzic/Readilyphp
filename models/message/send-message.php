<?php
session_start();
ob_start();
header('Content-type: application/json');

require_once "../../config/connection.php";
require_once "../global/functions.php";
require_once "functions.php";

if($_SERVER['REQUEST_METHOD']=='GET'){
    http_response_code(404);
    redirect("../../index.php?page=404");
    exit;
}

if(!isset($_SESSION['userId'])){
    http_response_code(401);
    $errorMessageArray[] = 'Access denied!';
    echo json_encode($errorMessageArray);
    exit;
}

$userId = $_SESSION['userId'];
$subject = $_POST['subject'];
$message = $_POST['message-input'];

if(!strlen($subject)){
    $errorMessageArray[]= 'Subject can\'t be empty';
}

checkInputElementWithRegex('/(\s.*){4,}/',$message,'Message must have at least 5 words.',$errorMessageArray);

if($errorMessageArray){
    http_response_code(400);
    echo json_encode($errorMessageArray);
    exit;
}

try{
    insertUserMessage($userId,$subject,$message);
}catch(PDOException $ex){
    http_response_code(500);
    $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
    echo json_encode($errorMessageArray);
    exit;
}

$message = [];
http_response_code(200);
$message[] = 'Thank you! Your message has been sent successfully';
echo json_encode($message);
ob_end_flush();
?>