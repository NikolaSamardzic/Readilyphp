<?php
    require_once "models/global/functions.php";

    session_destroy();

    destroyAllCookies();

    http_response_code(302);
    redirect('index.php?page=home');
?>