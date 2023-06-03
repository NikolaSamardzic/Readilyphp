<?php

function insertNewUserOrder($userId){
    global $conn;

    $query = "INSERT INTO user_order (user_id) VALUES (:user_id)";
    $statement = $conn->prepare($query);
    $statement->bindParam(':user_id',$userId);

    $statement->execute();
    return $conn->lastInsertId();
}

function selectUserCart($userId,$orderId){
    global $conn;

    $query = 
    "SELECT order_book.book_id as id, order_book.quantity as quantity
    FROM order_book
    JOIN user_order ON user_order.id = order_book.order_id
    JOIN user ON user.id = user_order.user_id
    WHERE user_order.user_id = :user_id AND user_order.id = :order_id";

    $statement = $conn->prepare($query);
    $statement->bindParam(':user_id',$userId);
    $statement->bindParam(':order_id',$orderId);
    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}

function getCartUserInfo($userId){
    global $conn;

    $query = 
    "SELECT order_book.book_id as id, order_book.quantity as quantity, order_book.unit_price as price
    FROM order_book
    JOIN user_order ON user_order.id = order_book.order_id
    WHERE user_order.finished_at IS NULL AND user_order.user_id = :user_id";

    $statement = $conn->prepare($query);
    $statement->bindParam(':user_id',$userId);

    $statement->execute();
    $result = $statement->fetchAll();
    return $result;
}

function updatetUserCartItems($userId,$booksToUpdate){
    global $conn;

    $query = 
    "SELECT user_order.id as id
    FROM user_order
    WHERE user_order.user_id = :user_id AND user_order.finished_at IS NULL";
    $statement = $conn->prepare($query);
    $statement->bindParam(':user_id',$userId);
    $statement->execute();
    $userOrder = $statement->fetch();
    $userOrderId = $userOrder['id'];

    for($i=0;$i<count($booksToUpdate);$i++){
        $query = 
        "UPDATE order_book
        SET order_book.quantity = :quantity
        WHERE order_book.order_id = :order_id AND order_book.book_id = :book_id";

        $statement = $conn->prepare($query);
        $statement->bindParam(':quantity',$booksToUpdate[$i]->quantity);
        $statement->bindParam(':book_id',$booksToUpdate[$i]->id);
        $statement->bindParam(':order_id',$userOrderId);

        $statement->execute();
    }
}

function insertUserCartItems($userId,$booksToInsert){
    global $conn;

    $query = 
    "SELECT user_order.id as id
    FROM user_order
    WHERE user_order.user_id = :user_id AND user_order.finished_at IS NULL";
    $statement = $conn->prepare($query);
    $statement->bindParam(':user_id',$userId);
    $statement->execute();

    $userOrder = $statement->fetch();
    $userOrderId = $userOrder['id'];

    for($i=0;$i<count($booksToInsert);$i++){
        $query = 
        "INSERT INTO order_book (order_id,book_id,quantity,unit_price) 
        VALUES(:order_id,:book_id,:quantity,
                                            (SELECT book.price
                                            FROM book
                                            WHERE book.id = :book_id))";

        $statement = $conn->prepare($query);
        $statement->bindParam(":book_id",$booksToInsert[$i]->id);
        $statement->bindParam(":quantity",$booksToInsert[$i]->quantity);
        $statement->bindParam(":order_id",$userOrderId);

        $statement->execute();
    }
}

function deleteUserCartItems($userId,$itemsToDelete){
    global $conn;

    $query = 
    "SELECT user_order.id as id
    FROM user_order
    WHERE user_order.user_id = :user_id AND user_order.finished_at IS NULL";
    $statement = $conn->prepare($query);
    $statement->bindParam(':user_id',$userId);
    $statement->execute();

    $userOrder = $statement->fetch();
    $userOrderId = $userOrder['id'];

    for($i=0;$i<count($itemsToDelete);$i++){
        $query = 
        "DELETE
        FROM order_book
        WHERE order_book.order_id = :order_id AND order_book.book_id = :book_id";

        $statement = $conn->prepare($query);
        $statement->bindParam(":book_id",$itemsToDelete[$i]);
        $statement->bindParam(":order_id",$userOrderId);

        $statement->execute();
    }
}

function getCartId($userId){
    global $conn;

    $query = 
    "SELECT user_order.id as id
    FROM user_order
    WHERE user_order.user_id = :user_id AND user_order.finished_at IS NULL";
    $statement = $conn->prepare($query);
    $statement->bindParam(':user_id',$userId);
    $statement->execute();

    $user_order = $statement->fetch();
    $userOrderId = $user_order['id'];

    return $userOrderId;
}
?>