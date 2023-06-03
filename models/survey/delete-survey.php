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

    $errorMessageArray = [];

    if(!isset($_SESSION['userId'])){
        http_response_code(401);
        $errorMessageArray[] = 'Access denied!';
        echo json_encode($errorMessageArray);
        exit;
    }

    if($_SESSION['userRoleName'] != 'admin'){
        http_response_code(403);
        $errorMessageArray[] = 'Access denied!';
        echo json_encode($errorMessageArray);
        exit;
    }

    $surveyId = $_POST['survey-id'];

    try{
        deleteSurvey($surveyId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    try{
        $allSurveys = selectAllSurveys();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $messsage[] = $allSurveys;
    http_response_code(200);
    echo json_encode($messsage);
    ob_end_flush();
?>