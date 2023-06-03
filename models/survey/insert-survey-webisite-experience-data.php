<?php
    session_start();
    ob_start();
    header('Content-type: application/json');

    require_once "../../config/connection.php";
    require_once "../global/functions.php";
    require_once "../user/functions.php";
    require_once "functions.php";

    if($_SERVER['REQUEST_METHOD']=='GET'){
        http_response_code(404);
        redirect("../../index.php?page=404");
        exit;
    }

    $errorMessageArray = [];

    if(!isset($_SESSION['userId'])){
        http_response_code(401);
        $errorMessageArray[] = 'Access denied!';
        echo json_encode($errorMessageArray);
        exit;
    }

    $optionId = $_POST['survey-choice'];
    $surveyId = $_POST['survey-id'];
    $userId = $_SESSION['userId'];

    try{
        insertSurveyWebsiteExperienceData($surveyId,$optionId,$userId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    http_response_code(200);
    $message[] = 'Survey information saved successfully. Thank you for your participation!';
    echo json_encode($message);
    ob_end_flush();
?>