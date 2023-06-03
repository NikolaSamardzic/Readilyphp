<?php
    session_start();
    ob_start();
    header('Content-type: application/json');

    require_once "functions.php";
    require_once "../global/functions.php";
    require_once "../category/functions.php";
    require_once "../cart/functions.php";
    require_once "../../config/connection.php";
    require_once "../user/functions.php";

    if($_SERVER['REQUEST_METHOD']=='GET'){
        http_response_code(404);
        redirect("../../index.php?page=404");
        exit;
    }

    $errorMessageArray = [];

    $username = $_POST['username-input'];
    $password = md5($_POST['password-input'] . 'tHisIsSaltedPassWoRd1234.');

    try{
        $user = loginUser($username,$password);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    if(count($user) == 0){
        http_response_code(400);
        $errorMessageArray[] = 'Invalid username or password. Please try again.';
        echo json_encode($errorMessageArray);
        exit;
    }

    if(count($user) > 1){
        http_response_code(400);
        $errorMessageArray[] = 'An error occurred while processing your request. Please try again later.' . count($user);
        echo json_encode($errorMessageArray);
        exit;
    }

    $_SESSION['userId'] = $user[0]['id'];
    $_SESSION['username'] = $user[0]['username'];
    $_SESSION['userRoleId'] = $user[0]['role_id'];
    $_SESSION['userRoleName'] = $user[0]['name'];
    $_SESSION['userAvatarSrc'] = $user[0]['src'];

    setcookie('isLoggedIn', true,time() + 36000,'/');

    try{
        $peferedCategories = selectUserPreferedCategories($user[0]['id']);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    if(count($peferedCategories)){
        setcookie('hasPreferedCategories', true,time() + 36000,'/');
    }

    $orderId = $user[0]['order_id'];
    if(!$orderId){
        try{
            $orderId = insertNewUserOrder($user[0]['id']);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
            exit;
        }
    }

    try{
        $userCart = selectUserCart($user[0]['id'],$orderId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
        exit;
    }

    setcookie('cart',json_encode($userCart),time() + 36000 ,"/");

    recordLoggedInUser($user);

    http_response_code(302);
    redirect('../../index.php?page=home');
    ob_end_flush();
?>