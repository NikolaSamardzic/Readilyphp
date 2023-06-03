<?php
    session_start();
    ob_start();
    header('Content-type: application/json');

    require_once "../../config/connection.php";
    require_once "../global/functions.php";
    require_once "../category/functions.php";

    if($_SERVER['REQUEST_METHOD']=='GET'){
        http_response_code(404);
        redirect("../../index.php?page=404");
        exit;
    }

    $errorMessageArray = [];

    try{
        $allParentCategories = selectAllActiveCategories(null);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    try{
        $allCategories = getCategories($allParentCategories);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    http_response_code(200);
    echo json_encode($allCategories);
    ob_end_flush();
?>