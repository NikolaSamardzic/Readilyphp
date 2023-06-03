<?php
ob_start();
require_once "../../config/connection.php";
require_once "../global/functions.php";
require_once "functions.php";

if(!isset($_GET['token'])){
    http_response_code(400);
    redirect("../../index.php?page=home");
}

$token = $_GET['token'];

activateNewUser($token);

redirect('../../index.php?page=login');
ob_end_flush();
?>