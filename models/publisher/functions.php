<?php

function selectAllPublishers(){
    global $conn;
    
    $query = 
    'SELECT publisher.id AS id, publisher.name AS name,
    COUNT(book.id) AS book_count, 
    publisher.created_at AS created_at, publisher.deleted_at AS deleted_at, publisher.status AS status
    FROM publisher
    LEFT JOIN book ON book.publisher_id = publisher.id 
    GROUP BY publisher.id';
    $statement = $conn->prepare($query);

    $statement->execute();

    $allPublishers = $statement->fetchAll();

    $activePublishers = array();
    $deletedPublishers = array();

    foreach ($allPublishers as $publisher) {
        if ($publisher['status'] == 1) {
            $activePublishers[] = $publisher;
        } elseif ($publisher['status'] == 0) {
            $deletedPublishers[] = $publisher;
        }
    }

    $publisherTable = new stdClass();
    $publisherTable->activePublishers = $activePublishers;
    $publisherTable->deletedPublishers = $deletedPublishers;

    return $publisherTable;
}

function addPublisher($publisherName){
    global $conn;

    $query = 'INSERT INTO publisher (name,status) VALUES(:publisher_name,1)';
    $statement = $conn->prepare($query);

    $statement->bindParam(':publisher_name',$publisherName);
    $statement->execute();
}

function updatePublisher($publisherId,$publisherName){
    global $conn;

    $query = 'UPDATE publisher SET name = :publisher_name WHERE id = :publisher_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':publisher_name',$publisherName);
    $statement->bindParam(':publisher_id',$publisherId);
    $statement->execute();
}

function deletePublisher($publisherId){
    global $conn;

    $query = 'UPDATE publisher SET status=0, deleted_at = NOW() WHERE id = :publisher_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':publisher_id',$publisherId);
    
    $statement->execute();
}

function activateDeletedPublisher($publisherId){
    global $conn;

    $query = 'UPDATE publisher SET status=1 WHERE id = :publisher_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':publisher_id',$publisherId);
    
    $statement->execute();
}

?>