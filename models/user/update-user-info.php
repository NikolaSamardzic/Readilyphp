<?php
    session_start();
    ob_start();
    header('Content-type: application/json');

    require_once "../../config/connection.php";
    require_once "../global/functions.php";
    require_once 'functions.php';

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

    $userId = $_POST['user-id'];
    $previousAddress = $_POST['previous-address'];

    $avatarName = $_FILES['user-avatar']['name'];
    $avatarTmpName = $_FILES['user-avatar']['tmp_name'];
    $avatarSize = $_FILES['user-avatar']['size'];
    $avatarType = pathinfo($_FILES['user-avatar']['name'], PATHINFO_EXTENSION);
    
    $firstName = $_POST['first-name-input'];
    $lastName = $_POST['last-name-input'];
    $username = $_POST['username-input'];
    $email = $_POST['email-input'];
    $phone = $_POST['phone-input'];
    $roleId = $_POST['role-input'];
    $roleName = $_POST['role-name'];
    $biographyText = $_POST['biography-input'];

    $addressLine = $_POST['address-line-input'];
    $addressNumber = $_POST['number-input'];
    $city = $_POST['city-input'];
    $state = $_POST['state-input'];
    $zipCode = $_POST['zip-code-input'];
    $country = $_POST['country-input'];


    $hasAvatar = false;
    $hasAddress = false;

    $addressId = null;

    if(empty($userId)){
        $errorMessageArray[] = 'Invalid input. Please try again.';
    }

    if(!empty($avatarName)){
       checkAvatar($avatarSize,$avatarType,$errorMessageArray);

        $hasAvatar = true;
    }else{
        $avatarObj = doesAvatarAlreadyExists($userId);
    }

    checkInputElementWithRegex('/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/',$firstName,'Incorrect first name  format (ex. Jhon)',$errorMessageArray);
    checkInputElementWithRegex('/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/',$lastName,'Incorrect Last name format (ex. Smith)',$errorMessageArray);
    checkInputElementWithRegex('/^[a-zA-Z0-9.šđžćčČĆŠĐŽ\(\)\/\-_]{5,}$/',$username,'Your username must be at least 5 characters long and can only contain letters, numbers, periods, parentheses, forward slashes, hyphens, and underscores.',$errorMessageArray);
    checkInputElementWithRegex('/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',$email,'Incorrect email format (ex. jhonsmith@gmail.com)',$errorMessageArray);
    checkInputElementWithRegex('/^\d{5,15}$/',$phone,'Incorrect phone format (ex. 0611234567)',$errorMessageArray);
    
    if($roleId != '2' && $roleId != '3'){
        $errorMessageArray[] = "Role in not valid";
    }else if($roleId == '3'){
        checkInputElementWithRegex('/(\s.*){4,}/',$biographyText,'Biography must have at least 5 words.',$errorMessageArray);
    }

    if(!empty($addressLine) || !empty($addressNumber) || !empty($city) || !empty($state) || !empty($zipCode) || !empty($country)){
        checkInputElementWithRegex('/^[a-zšđžćčA-ZŠĐŽĆČ0-9\s\.\-\#\\/\,]+$/',$addressLine,'Incorrect address line',$errorMessageArray);
        checkInputElementWithRegex('/^\d+[a-zA-Z]?$/',$addressNumber,'Incorrect address number',$errorMessageArray);
        checkInputElementWithRegex('/^([A-ZŠĐŽĆČ][a-zšđžćč]{2,}\s?)+$/',$city,'Incorrect city',$errorMessageArray);
        checkInputElementWithRegex('/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/',$state,'Incorrect state',$errorMessageArray);
        checkInputElementWithRegex('/^\d{5,15}$/',$zipCode,'Incorrect zip code',$errorMessageArray);
        checkInputElementWithRegex('/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/',$country,'Incorrect country',$errorMessageArray);

        $hasAddress = true;
    }


    if($errorMessageArray){
        http_response_code(400);
        echo json_encode($errorMessageArray);
        exit;
    }

    if($hasAddress){
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

    }

    if(!empty($previousAddress) && empty($addressLine)){
        $addressId = null;
    }

    try{
        $addressId = updateUserInformation($userId,$firstName,$lastName,$username,$email,$phone,$addressId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    if($roleId == '3'){
        try{
            updateUserBiography($userId,$biographyText);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }
    }

    if($hasAvatar){
        try{
            $avatarObj = doesAvatarAlreadyExists($userId);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }

        if($avatarObj){
            $uploadDir = '../../assets/images/avatars/';
            $filePath = $uploadDir . $avatarObj->src;

            if (file_exists($filePath)) {
                unlink($filePath);

                $filePath = $uploadDir . $avatarObj->id . '.' .$avatarType;
                $result = move_uploaded_file($avatarTmpName,$filePath);
        
                if(!$result){
                    http_response_code(500);
                    $errorMessageArray[] = 'Server error.';
                    echo json_encode($errorMessageArray);
                    exit;
                }

                try{
                    updateAvatarRowName($avatarObj->id,$avatarType);
                }catch(PDOException $ex){
                    http_response_code(500);
                    $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
                    echo json_encode($errorMessageArray);
                    exit;
                }

            } else {
                http_response_code(500);
                $errorMessageArray[] = "File doesn't exist";
                echo json_encode($errorMessageArray);
                exit;
            }

        }else{
            try{
                $idAvatar = insertNewAvatarRow($userId);
            }catch(PDOException $ex){
                http_response_code(500);
                $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
                echo json_encode($errorMessageArray);
                exit;
            }


            $uploadDir = '../../assets/images/avatars/';
            $filePath = $uploadDir . $idAvatar . '.' .$avatarType;
            $result = move_uploaded_file($avatarTmpName,$filePath);

            if(!$result){
                http_response_code(500);
                $errorMessageArray[] = 'Server error.';
                echo json_encode($errorMessageArray);
                exit;
            }

            try{
                updateAvatarRowName($idAvatar,$avatarType);
            }catch(PDOException $ex){
                http_response_code(500);
                $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
                echo json_encode($errorMessageArray);
                exit;
            }

        }

    }

    http_response_code(200);
    $messageArray[] = true;
    echo json_encode($messageArray);
    ob_end_flush();
?>