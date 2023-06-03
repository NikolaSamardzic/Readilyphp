<?php

function selectAllDeliveryTypes(){
    global $conn;
    
    $query = 
    'SELECT d.id as id, d.name as name, d.created_at as created_at, d.deleted_at as deleted_at, d.status as status,
    COUNT(user_order.id) as order_count
    FROM delivery_type d
    LEFT JOIN user_order ON user_order.delivery_type_id = d.id
    GROUP BY d.id';
    $statement = $conn->prepare($query);

    $statement->execute();

    $allDeliveryTypes = $statement->fetchAll();

    $activeDeliveryTypes = array();
    $deletedDeliveryTypes = array();

    foreach ($allDeliveryTypes as $deliveryType) {
        if ($deliveryType['status'] == 1) {
            $activeDeliveryTypes[] = $deliveryType;
        } elseif ($deliveryType['status'] == 0) {
            $deletedDeliveryTypes[] = $deliveryType;
        }
    }

    $deliveryTypeTable = new stdClass();
    $deliveryTypeTable->activeDeliveryTypes = $activeDeliveryTypes;
    $deliveryTypeTable->deletedDeliveryTypes = $deletedDeliveryTypes;

    return $deliveryTypeTable;
}

function addDeliveryType($deliveryTypeName){
    global $conn;

    $query = 'INSERT INTO delivery_type (name,status) VALUES(:delivery_type_name,1)';
    $statement = $conn->prepare($query);

    $statement->bindParam(':delivery_type_name',$deliveryTypeName);
    $statement->execute();
}

function updateDeliveryType($deliveryTypeId,$deliveryTypeName){
    global $conn;

    $query = 'UPDATE delivery_type SET name = :delivery_type_name WHERE id = :delivery_type_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':delivery_type_name',$deliveryTypeName);
    $statement->bindParam(':delivery_type_id',$deliveryTypeId);
    $statement->execute();
}

function activateDeletedDeliveryType($deliveryTypeId){
    global $conn;

    $query = 'UPDATE delivery_type SET status=1 WHERE id = :delivery_type_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':delivery_type_id',$deliveryTypeId);
    
    $statement->execute();
}

function deleteDeliveryType($deliveryTypeId){
    global $conn;

    $query = 'UPDATE delivery_type SET status=0, deleted_at = NOW() WHERE id = :delivery_type_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':delivery_type_id',$deliveryTypeId);
    
    $statement->execute();
}

?>