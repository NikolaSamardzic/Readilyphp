<?php
define("BASE_URL", "http://127.0.0.1/Readilyphp/");
define("ABSOLUTE_PATH", $_SERVER["DOCUMENT_ROOT"] . "/Readilyphp");

define("ENV_FILE", ABSOLUTE_PATH . "/config/.env");
define("LOG_FILE", ABSOLUTE_PATH . "/data/log.txt");
define("LOGGED_ID_RECORD", ABSOLUTE_PATH . "/data/logged-in-record.txt");
define("SEPARATOR", "\t");

define("SERVER", env("SERVER"));
define("DATABASE", env("DATABASE"));
define("USERNAME", env("USERNAME"));
define("PASSWORD", env("PASSWORD"));

function env($search){
    $data = file(ENV_FILE);
    $value = "";
    foreach($data as $data_row){
        list($name, $value) = explode("=", $data_row);

        if($name == $search) return trim($value);
    }

}
?>