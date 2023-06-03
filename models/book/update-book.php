<?php
    session_start();
    ob_start();
    header('Content-type: application/json');

    require_once "../../config/connection.php";
    require_once "../global/functions.php";
    require_once "../category/functions.php";
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

    if($_SESSION['userRoleName'] != 'admin' && $_SESSION['userRoleName'] != 'writer'){
        http_response_code(403);
        $errorMessageArray[] = 'Access denied!';
        echo json_encode($errorMessageArray);
        exit;
    }

    $bookId = $_POST['book-id'];

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

    try{
        $selectedCategoriesDb = selectBookActiveCategories($bookId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $preveouslySelectedCategories = [];

    for($i=0;$i<count($selectedCategoriesDb);$i++){
        $preveouslySelectedCategories[] = $selectedCategoriesDb[$i]['category_id'];
    }

    $hasBookImg = false;
    if(!empty($bookImgName)){
        checkBookImg($bookImgTmpName,$bookImgSize,$bookImgType,$errorMessageArray);
        $hasBookImg = true;
    }

    checkDateInput($releaseDate,$errorMessageArray);

    if(empty($bookTitle) || empty($bookPrice) || empty($pageCount) || empty($bookDescription) || !count($selectedCategories)){
        $errorMessageArray[] = "Must proveide all values";
    }

    if($errorMessageArray){
        http_response_code(400);
        echo json_encode($errorMessageArray);
        exit;
    }

    if($hasBookImg){
        try{
            $bookImgObj = getBookImage($bookId);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }

        $uploadDir = '../../assets/images/books/';
        $filePath = $uploadDir . $bookImgObj->src;
        unlink($filePath);

        $smallImageHeight = 200;
        $result = createNewBookImage($bookImgTmpName, $smallImageHeight, $bookImgObj->id, $bookImgType, "small/");
    
        if(!$result){
            http_response_code(500);
            $errorMessageArray[] = 'Server error.';
            echo json_encode($errorMessageArray);
            exit;
        }
    
        $largeImageHeigth = 400;
        $result = createNewBookImage($bookImgTmpName, $largeImageHeigth, $bookImgObj->id, $bookImgType, "large/");
    
        if(!$result){
            http_response_code(500);
            $errorMessageArray[] = 'Server error.';
            echo json_encode($errorMessageArray);
            exit;
        }



        // $filePath = $uploadDir . $bookImgObj->id . '.' .$bookImgType;
        // $result = move_uploaded_file($bookImgTmpName,$filePath);

        try{
            updateBookImageRowName($bookImgObj->id,$bookImgType);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }
    }

    try{
        updateBook($bookTitle, $pageCount, $bookPrice, $releaseDate, $bookDescription, $publisherId, $bookId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $addedCategories = array_diff($selectedCategories, $preveouslySelectedCategories);
    $deletedCategories = array_diff($preveouslySelectedCategories, $selectedCategories);

    $addedCategories = array_values($addedCategories);
    $deletedCategories = array_values($deletedCategories);

    try{
        addUpdatedBookCategories($bookId,$addedCategories);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = $addedCategories;
        $errorMessageArray[] = $deletedCategories;
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    } 

    try{
        deleteUpdatedBookCategories($bookId,$deletedCategories);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $messsage[] = $_POST['writer-id'];
    http_response_code(200);
    echo json_encode($messsage);
    ob_end_flush();
?>