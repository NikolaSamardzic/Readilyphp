<?php
    session_start();
    ob_start();
    header('Content-type: application/json');

    require_once "../../config/connection.php";
    require_once "../global/functions.php";
    require_once "../category/functions.php";
    require_once "../publisher/functions.php";
    require_once "../book/functions.php";

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

    if($_SESSION['userRoleName'] != 'admin' && $_SESSION['userRoleName'] != 'writer'){
        http_response_code(403);
        $errorMessageArray[] = 'Access denied!';
        echo json_encode($errorMessageArray);
        exit;
    }

    $writerId = $_POST['writer-id'];

    $bookTitle = $_POST['book-title-input'];
    $bookPrice = $_POST['price-input'];
    $pageCount = $_POST['page-count-input'];
    $publisherId = $_POST['publisher-input'];
    $releaseDate = $_POST['release-date-input'];
    $bookDescription = $_POST['book-description-input'];
    $selectedCategories = $_POST['book-category-cb'];

    $bookImgName = $_FILES['book-image']['name'];
    $bookImgTmpName = $_FILES['book-image']['tmp_name'];
    $bookImgSize = $_FILES['book-image']['size'];
    $bookImgType = pathinfo($_FILES['book-image']['name'], PATHINFO_EXTENSION);

    checkBookImg($bookImgTmpName,$bookImgSize,$bookImgType,$errorMessageArray);

    checkDateInput($releaseDate,$errorMessageArray);

    if(empty($bookTitle) || empty($bookPrice) || empty($pageCount) || empty($bookDescription) || !count($selectedCategories)){
        $errorMessageArray[] = "Must proveide all values";
    }

    if($errorMessageArray){
        http_response_code(400);
        echo json_encode($errorMessageArray);
        exit;
    }

    try{
        $bookImgId = insertNewImageRow();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $smallImageHeight = 200;
    $result = createNewBookImage($bookImgTmpName, $smallImageHeight, $bookImgId, $bookImgType, "small/");

    if(!$result){
        http_response_code(500);
        $errorMessageArray[] = 'Server error.';
        echo json_encode($errorMessageArray);
        exit;
    }

    $largeImageHeigth = 400;
    $result = createNewBookImage($bookImgTmpName, $largeImageHeigth, $bookImgId, $bookImgType, "large/");

    if(!$result){
        http_response_code(500);
        $errorMessageArray[] = 'Server error.';
        echo json_encode($errorMessageArray);
        exit;
    }

    //imagedestroy($originalImage);

    try{
        $bookId = insertNewBook($bookTitle, $pageCount, $bookPrice, $releaseDate, $bookDescription, $publisherId, $writerId, $bookImgId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    try{
        updateBookImageRowName($bookImgId,$bookImgType);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    try{
        insertBookCategories($bookId,$selectedCategories);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $messsage[] = 'Book was successfully added!';
    http_response_code(200);
    echo json_encode($messsage);
    ob_end_flush();
?>