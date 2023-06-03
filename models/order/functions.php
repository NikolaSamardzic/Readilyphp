<?php 

function getUserOrders(){
    global $conn;

    $query = 
    "SELECT user.username, user.email,user_order.finished_at, user_order.total_price,order_status.name
    FROM user_order
    JOIN user ON user.id = user_order.user_id
    JOIN order_status ON user_order.order_status_id = order_status.id";

    $statement = $conn->prepare($query);
    $statement->execute();

    $result = $statement->fetchAll();
    return $result;
}

function finishOrder($cartId,$databaseCart,$addressId,$deliveryOptionId){
    global $conn;

    $totalPrice = 0;
    foreach($databaseCart as $book){
        $totalPrice += $book['price'] * $book['quantity'];
    }

    $query = 
    "UPDATE user_order
    SET total_price = :total_price, finished_at = NOW(), order_status_id = 1,
    address_id = :address_id, delivery_type_id = :delivery_type_id
    WHERE id = :cart_id";

    $statement = $conn->prepare($query);
    $statement->bindParam(":address_id",$addressId);
    $statement->bindParam(":delivery_type_id",$deliveryOptionId);
    $statement->bindParam(":total_price",$totalPrice);
    $statement->bindParam(":cart_id",$cartId);

    $statement->execute();
}
?>