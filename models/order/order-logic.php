<?php
session_start();
ob_start();
header('Content-type: application/json');

require_once "../../config/connection.php";
require_once "../global/functions.php";
require_once "../cart/functions.php";
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

$deliveryOptionId = $_POST['delivery-input'];

$addressLine = $_POST['address-line-input'];
$addressNumber = $_POST['number-input'];
$city = $_POST['city-input'];
$state = $_POST['state-input'];
$zipCode = $_POST['zip-code-input'];
$country = $_POST['country-input'];

$addressId = null;

checkInputElementWithRegex('/^[a-zšđžćčA-ZŠĐŽĆČ0-9\s\.\-\#\\/\,]+$/',$addressLine,'Incorrect address line',$errorMessageArray);
checkInputElementWithRegex('/^\d+[a-zA-Z]?$/',$addressNumber,'Incorrect address number',$errorMessageArray);
checkInputElementWithRegex('/^([A-ZŠĐŽĆČ][a-zšđžćč]{2,}\s?)+$/',$city,'Incorrect city',$errorMessageArray);
checkInputElementWithRegex('/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/',$state,'Incorrect state',$errorMessageArray);
checkInputElementWithRegex('/^\d{5,15}$/',$zipCode,'Incorrect zip code',$errorMessageArray);
checkInputElementWithRegex('/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/',$country,'Incorrect country',$errorMessageArray);

try{
    $databaseCart = getCartUserInfo($userId);
}catch(PDOException $ex){
    http_response_code(500);
    $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
    echo json_encode($errorMessageArray);
    exit;
}

if(!count($databaseCart)){
    $errorMessageArray[] = 'Your cart is empty. Please add a book to proceed with the purchase.';
}


if($errorMessageArray){
    http_response_code(400);
    echo json_encode($errorMessageArray);
    exit;
}

try{
    $addressIdObj = doesAddressAlreadyExists($addressLine,$addressNumber,$city,$state,$zipCode,$country);
}catch(PDOException $ex){
    http_response_code(500);
    $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
    echo json_encode($errorMessageArray);
    exit;
}

if($addressIdObj){
    $addressId = $addressIdObj->id;
}else{
    try{
        $addressId = insertNewAddress($addressLine,$addressNumber,$city,$state,$zipCode,$country);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }
}

try{
    $cartId = getCartId($userId);
}catch(PDOException $ex){
    http_response_code(500);
    $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
    echo json_encode($errorMessageArray);
    exit;
}

try{
    finishOrder($cartId,$databaseCart,$addressId,$deliveryOptionId);
}catch(PDOException $ex){
    http_response_code(500);
    $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
    echo json_encode($errorMessageArray);
    exit;
}

try{
    $orderId = insertNewUserOrder($userId);
}catch(PDOException $ex){
    http_response_code(500);
    $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
    echo json_encode($errorMessageArray);
    exit;
}

try{
    $userCart = selectUserCart($userId,$orderId);
}catch(PDOException $ex){
    http_response_code(500);
    $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
    echo json_encode($errorMessageArray);
    exit;
}

setcookie('cart',json_encode($userCart),time() + 36000 ,"/");

$messsage[] = 'Thank you for your order! Your purchase has been saved and will be processed soon.';
http_response_code(200);
echo json_encode($messsage);
ob_end_flush();
?>