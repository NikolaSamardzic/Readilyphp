<?php
    session_start();
    ob_start();
    header('Content-type: application/json');

    require_once "../../config/connection.php";
    require_once "../global/functions.php";
    require_once "functions.php";

    $errorMessages = [];

    if(!isset($_SESSION["userRoleName"]) || (($_SESSION["userRoleName"] != "admin") && $_SESSION["userRoleName"] != "writer")  || !isset($_GET['book-id'])){
        http_response_code(403);
        $errorMessages[] = 'Access denied!';
        echo json_encode($errorMessages);
        exit;
    }

    $bookId = $_GET['book-id'];

    $currentBookCategories = selectBookActiveCategories($bookId);

    http_response_code(200);
    echo json_encode($currentBookCategories);
    ob_end_flush();
?>