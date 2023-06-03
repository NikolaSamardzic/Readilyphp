<?php
    ob_start();
    header('Content-type: application/json');

    require_once "../../config/connection.php";
    require_once "../global/functions.php";
    require_once "../user/functions.php";
    require_once "functions.php";

    if($_SERVER['REQUEST_METHOD']=='GET'){
        http_response_code(404);
        redirect("../../index.php?page=404");
        exit;
    }

    $avatarName = $_FILES['user-avatar']['name'];
    $avatarTmpName = $_FILES['user-avatar']['tmp_name'];
    $avatarSize = $_FILES['user-avatar']['size'];
    $avatarType = pathinfo($_FILES['user-avatar']['name'], PATHINFO_EXTENSION);
    
    $firstName = $_POST['first-name-input'];
    $lastName = $_POST['last-name-input'];
    $username = $_POST['username-input'];
    $password = md5($_POST['password-input'] . 'tHisIsSaltedPassWoRd1234.');
    $email = $_POST['email-input'];
    $phone = $_POST['phone-input'];
    $role = $_POST['role-input'];
    $biography = $_POST['biography-input'];

    $addressLine = $_POST['address-line-input'];
    $addressNumber = $_POST['number-input'];
    $city = $_POST['city-input'];
    $state = $_POST['state-input'];
    $zipCode = $_POST['zip-code-input'];
    $country = $_POST['country-input'];

    $hasAvatar = false;
    $hasAddress = false;

    $addressId = null;

    $errorMessageArray = [];

    if(!empty($avatarName)){
       checkAvatar($avatarSize,$avatarType,$errorMessageArray);

        $hasAvatar = true;
    }

    checkInputElementWithRegex('/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/',$firstName,'Incorrect first name  format (ex. Jhon)',$errorMessageArray);
    checkInputElementWithRegex('/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/',$lastName,'Incorrect Last name format (ex. Smith)',$errorMessageArray);
    checkInputElementWithRegex('/^[a-zA-Z0-9.šđžćčČĆŠĐŽ\(\)\/\-_]{5,}$/',$username,'Your username must be at least 5 characters long and can only contain letters, numbers, periods, parentheses, forward slashes, hyphens, and underscores.',$errorMessageArray);
    checkInputElementWithRegex('/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',$email,'Incorrect email format (ex. jhonsmith@gmail.com)',$errorMessageArray);
    checkInputElementWithRegex('/^\d{5,15}$/',$phone,'Incorrect phone format (ex. 0611234567)',$errorMessageArray);
    
    if($role != '2' && $role != '3'){
        $errorMessageArray[] = "Role in not valid";
    }else if($role == '3'){
            checkInputElementWithRegex('/(\s.*){4,}/',$biography,'Biography must have at least 5 words.',$errorMessageArray);
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

    $token = generateToken();

    try{
        $userId = insertNewUser($firstName,$lastName,$username,$password,$email,$phone,$token,$addressId,$role);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    if($hasAvatar){

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

    if($role == '3'){
        try{
            insertNewBiography($biography,$userId);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }
    }

    $activationLink = "http://localhost/Readilyphp/models/signup/activate-account.php?token=" . $token;
    if(!send_activation_email($email, $activationLink)) {
        $errorMessageArray[] = "Failed to send activation email.";
    }

    http_response_code(200);
    $message[] = 'Hi! Your account has been created successfully. Please check your email for activation instructions. Thank you!';
    echo json_encode($message);
    ob_end_flush();
?>