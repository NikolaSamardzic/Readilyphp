<?php 

function redirect($url){
    header("Location: ".$url);
}

function destroyAllCookies(){
    setcookie('isLoggedIn', false,time() - 36000,'/');
    setcookie('hasPreferedCategories', true,time() - 36000,'/');
    setcookie('cart', "",time() - 36000,'/');
}

function checkInputElementWithRegex($regex,$element,$errorMessage,&$errorMessagesArray){
    if(preg_match($regex,$element)){
        return 0;
    }

    $errorMessagesArray[] = $errorMessage;
    return 1;
}

function recordUserVisit(){

    global $page;

    $open = fopen(LOG_FILE, "a");
    if($open){
        $date = date('d-m-Y H:i:s');
        fwrite($open, "{$page}\t{$date}\t{$_SERVER['REMOTE_ADDR']}\t\n");
        fclose($open);
    }
}
?>