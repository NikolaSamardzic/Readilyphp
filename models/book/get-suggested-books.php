<?php
    session_start();
    ob_start();
    header('Content-type: application/json');

    require_once "../../config/connection.php";
    require_once "../global/functions.php";
    require_once "../user/functions.php";
    require_once "../category/functions.php";
    require_once "functions.php";

    if($_SERVER['REQUEST_METHOD']=='GET'){
        http_response_code(404);
        redirect("../../index.php?page=404");
        exit;
    }

    $errorMessageArray = [];

    $preferedCategories = $_POST['checkbox-prefered-categories'];
    $userId = $_SESSION['userId'];

    $associativeArray = array_map(function($value) {
        return array('id' => $value);
    }, $preferedCategories);

    try{
        $suggestedBooks = selectRelatedBooksToACategories($associativeArray);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    shuffle($suggestedBooks);

    try{
        insertUsersPreferedCategories($preferedCategories,$userId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    setcookie('hasPreferedCategories', true,time() + 36000,'/');

    http_response_code(200);
    echo json_encode($suggestedBooks);
    ob_end_flush();
?>