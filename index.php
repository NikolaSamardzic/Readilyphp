<?php 
session_start();
ob_start();
require_once "config/connection.php";

include "views/fixed/head.php";
include "views/fixed/header.php";

$pages = ["home", "shop", "checkout", "writer", "book", "signup", "login", "logout", "user-profile", "admin-visitors", "author", "404",  "writer-books", "insert-book", "update-book",  "admin", "admin-users", "admin-categories", "admin-publishers", "admin-delivery-options", "admin-survey", "admin-messages", "admin-orders", "admin-logged-id-users"];

if(isset($_GET['page'])){
    if(in_array($_GET['page'],$pages)){
        include "views/pages/" . $_GET['page'] . ".php";
    }else{
        include "views/pages/404.php";
    }
}else{
    include "views/pages/home.php";
}
 
include "views/fixed/footer.php";
ob_end_flush();
?>