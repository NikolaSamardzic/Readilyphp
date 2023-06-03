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

    $deliveryTypeId = $_POST['delivery-type-id'];
    $deliveryTypeName = $_POST['delivery-type-name'];

    checkInputElementWithRegex('/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/',$deliveryTypeName,'Incorrect format',$errorMessageArray);

    if($errorMessageArray){
        http_response_code(400);
        echo json_encode($errorMessageArray);
        exit;
    }

    if($deliveryTypeId == '0'){
        try{
            addDeliveryType($deliveryTypeName);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }
    }else{
        try{
            updateDeliveryType($deliveryTypeId,$deliveryTypeName);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }
    }


    try{
        $allDeliveryTypes = selectAllDeliveryTypes();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }


    $messsage[] = $allDeliveryTypes;
    http_response_code(200);
    echo json_encode($messsage);
    ob_end_flush();
?>