<?php 

function loginUser($username,$password){
    global $conn;

    $query = 
    'SELECT user.id, user.username, IFNULL(user_order.id,0) as order_id,
    user.role_id, role.name, avatar.src, user.email
    FROM user
    JOIN role ON user.role_id = role.id LEFT JOIN avatar ON avatar.user_id = user.id
    LEFT JOIN user_order ON user_order.user_id = user.id
    WHERE username = :username  
    AND status = 1 AND is_active = 1 AND password = :password AND is_banned = 0 
    ORDER BY CASE WHEN user_order.finished_at IS NULL THEN 0 ELSE 1 END, user_order.finished_at ASC
    LIMIT 1';
    $statement = $conn->prepare($query);

    $statement->bindParam(":username",$username);
    $statement->bindParam(":password",$password);
    $statement->execute();
    $result = $statement->fetchAll();

    return $result;
}

function recordLoggedInUser($user){
    $open = fopen(LOGGED_ID_RECORD, "a");

    $username = $user[0]["username"];
    $email = $user[0]["email"];
    $role = $user[0]["name"];

    if($open){
        $date = date('d-m-Y H:i:s');
        fwrite($open, "{$username}\t{$email}\t{$role}\t{$date}\t\n");
        fclose($open);
    }
}
?>