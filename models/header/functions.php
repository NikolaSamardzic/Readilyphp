<?php
require_once "config/connection.php";

function headerLinks($userRole){
    global $conn;

    $query = "SELECT l.name, l.href FROM link as l
    INNER JOIN link_position as lp ON lp.link_id = l.id 
    INNER JOIN position as p ON p.id = lp.position_id 
    INNER JOIN link_role as lr ON lr.link_id = l.id 
    INNER JOIN role as r ON r.id = lr.role_id 
    WHERE p.name = 'header' AND r.name = :role
    ORDER BY l.appearance ASC";

    $statement = $conn->prepare($query);
    $statement->bindParam(":role",$userRole);

    $statement->execute();
    $links = $statement->fetchAll();

    return $links;
}
?>