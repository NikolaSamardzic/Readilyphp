<?php
    session_start();
    ob_start();
    header('Content-type: application/json');

    require_once "../../config/connection.php";
    require_once "../global/functions.php";
    require_once "functions.php";
    require_once "../user/functions.php";

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
    $bookId = $_POST['book-id'];
    $bookStars = $_POST['book-stars'];

    try{
        $reviewId = getSingleReview($userId,$bookId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    if(!$reviewId){
        try{
            $reviewId = insertReview($userId,$bookId,$bookStars+1);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }

        $inform = "Your rating has been successfully saved.";
        $messsage[] = $inform;
        http_response_code(200);
        echo json_encode($messsage);
        exit;
    }

    try{
        updateReview($reviewId['id'],$bookStars+1);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $inform = "Your rating has been successfully saved.";
    $messsage[] = $inform;
    http_response_code(200);
    echo json_encode($messsage);
    ob_end_flush();
?>