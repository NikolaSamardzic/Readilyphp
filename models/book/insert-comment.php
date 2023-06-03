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

    $errorMessageArray = [];

    if(!isset($_SESSION['userId'])){
        http_response_code(401);
        $errorMessageArray[] = 'Access denied!';
        echo json_encode($errorMessageArray);
        exit;
    }

    $userId = $_SESSION['userId'];
    $bookId = $_POST['book-id'];
    $comment = $_POST['comment-input'];

    checkInputElementWithRegex('/(\s.*){4,}/',$comment,'Comment must have at least 5 words.',$errorMessageArray);

    $totalSize = 0;
    $maxSize = 2 * 1024 * 1024;
    for($i=0;$i<count($_FILES['comment-image']['name']);$i++){

        if(empty($_FILES['comment-image']['name'][$i])){
            continue;
        }

        $imageName = $_FILES['comment-image']['name'][$i];
        $imageTmpName = $_FILES['comment-image']['tmp_name'][$i];
        $imageSize = $_FILES['comment-image']['size'][$i];
        $imageType = pathinfo($_FILES['comment-image']['name'][$i], PATHINFO_EXTENSION);

        $allowedTypes = array('jpg', 'jpeg', 'png');

        if(!in_array($imageType, $allowedTypes)) {
            $errorMessageArray[] = 'File type not allowed. Only JPG, JPEG, and PNG files are allowed.';
        }
        $totalSize += $imageSize;
    }

    if($totalSize > $maxSize){
        $errorMessageArray[] = 'The total size of the uploaded files exceeds the maximum allowed size of 2 MB.';
    }
 
    if($errorMessageArray){
        http_response_code(400);
        echo json_encode($errorMessageArray);
        exit;
    }

    try{
        $comment_id = insertCommentText($userId,$bookId,$comment);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    for($i=0;$i<count($_FILES['comment-image']['name']);$i++){
        if(empty($_FILES['comment-image']['name'][$i])){
            continue;
        }

        $imageName = $_FILES['comment-image']['name'][$i];
        $imageTmpName = $_FILES['comment-image']['tmp_name'][$i];
        $imageSize = $_FILES['comment-image']['size'][$i];
        $imageType = pathinfo($_FILES['comment-image']['name'][$i], PATHINFO_EXTENSION);

        try{
            $commentImgId = insertNewImageRow();
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }

        $uploadDir = '../../assets/images/comments/';
        $filePath = $uploadDir . $commentImgId . '.' .$imageType;
        $result = move_uploaded_file($imageTmpName,$filePath);
    
        if(!$result){
            http_response_code(500);
            $errorMessageArray[] = 'Server error.';
            echo json_encode($errorMessageArray);
            exit;
        }

        try{
            updateBookImageRowName($commentImgId,$imageType);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }

        try{
            insertCommentImageRow($commentImgId,$comment_id);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }
    }

    http_response_code(200);
    $message[] = 'Your comment has been successfully uploaded.';
    echo json_encode($message);
    ob_end_flush();
?>