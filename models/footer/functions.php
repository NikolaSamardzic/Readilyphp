<?php 
function allLinks($userRole){
    global $conn;

    $query = "SELECT l.name, l.href, lt.name AS 'target', ltype.name AS 'type', l.appearance FROM link as l
    INNER JOIN link_position as lp ON lp.link_id = l.id 
    INNER JOIN position as p ON p.id = lp.position_id 
    INNER JOIN link_role as lr ON lr.link_id = l.id 
    INNER JOIN role as r ON r.id = lr.role_id 
    INNER JOIN link_target as lt ON l.id_target = lt.id
    INNER JOIN link_type as ltype ON ltype.id = l.id_link_type
    WHERE p.name = 'footer' AND r.name = :role
    ORDER BY l.appearance ASC;";

    $statement = $conn->prepare($query);
    $statement->bindParam(":role",$userRole);

    $statement->execute();
    $links = $statement->fetchAll();


    $documentsLinks = array();
    $pageLinks = array();
    $socialMediaLinks = array();

    foreach($links as $link){
        if($link['type'] == 'document'){
            $documentsLinks[] = $link;
        }else if($link['type'] == 'link'){
            $pageLinks[] = $link;
        }else if($link['type'] == 'social media'){
            $socialMediaLinks[] = $link;
        }
    }

    $allLinks = new stdClass();
    $allLinks->documentsLinks = $documentsLinks;
    $allLinks->pageLinks = $pageLinks;
    $allLinks->socialMediaLinks = $socialMediaLinks;

    return $allLinks;
}
?>