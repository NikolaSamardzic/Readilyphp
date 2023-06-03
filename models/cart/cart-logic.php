<?php
    session_start();
    ob_start();
    header('Content-type: application/json');

    require_once "../../config/connection.php";
    require_once "../book/functions.php";
    require_once "../global/functions.php";
    require_once "../user/functions.php";
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

    $cookieValue = $_COOKIE['cart'];
    $cookieCart = json_decode($cookieValue);

    try{
        $databaseCart = getCartUserInfo($userId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $cookieCartIds = array_column($cookieCart, "id");
    $databaseCartIds = array_column($databaseCart, "id");

    $itemsToDelete = array_diff($databaseCartIds, $cookieCartIds);

    try{
        deleteUserCartItems($userId,$itemsToDelete);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $itemsToInsertIds = array_diff($cookieCartIds,$databaseCartIds);

    $booksToInsert = array();
    foreach ($cookieCart as $book) {
        if (in_array($book->id, $itemsToInsertIds)) {
            $booksToInsert[] = $book;
        }
    }

    try{
        insertUserCartItems($userId,$booksToInsert);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $itemsToUpdateIds = array_intersect($cookieCartIds,$databaseCartIds);

    $booksToUpdate = array();
    foreach ($cookieCart as $book) {
        if (in_array($book->id, $itemsToUpdateIds)) {
            $booksToUpdate[] = $book;
        }
    }

    try{
        updatetUserCartItems($userId,$booksToUpdate);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    $booksInformation = [];
    foreach($cookieCart as $bookInCart){
        $bookInformation = selectBook($bookInCart->id);

        $bookInformationObject = (object) array(
            'id' => $bookInformation['id'],
            'title' => $bookInformation['title'],
            'src' => $bookInformation['src'],
            'price' => $bookInformation['price'],
            'quantity' => $bookInCart->quantity
        );

        $booksInformation[] = $bookInformationObject;
    }

    $message = $booksInformation;
    http_response_code(200);
    echo json_encode($message);
    ob_end_flush();
?>