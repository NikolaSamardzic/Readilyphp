<?php 

function getUserMessages(){
    global $conn;

    $query = 
    "SELECT message.title as subject, message.message_text as text, message.created_at as date, user.email as email, user.username as username
    FROM message
    JOIN user ON user.id = message.user_id";

    $statement = $conn->prepare($query);
    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}

function insertUserMessage($userId,$subject,$message){
    global $conn;

    $query = "INSERT INTO message(title,message_text,user_id) VALUES(:subject,:message,:user_id)";
    $statement = $conn->prepare($query);
    $statement->bindParam(':subject',$subject);
    $statement->bindParam(':message',$message);
    $statement->bindParam(':user_id',$userId);
    $statement->execute();
}

?>