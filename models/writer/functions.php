<?php 
function selectWriter($writerId){
    global $conn;

    $query = 
    "SELECT CONCAT(user.first_name,' ',user.last_name) AS writer, avatar.src, biography.biography_text
    FROM user
    JOIN biography ON user.id = biography.user_id
    JOIN role ON role.id = user.role_id
    LEFT JOIN avatar ON avatar.user_id = user.id
    WHERE user.id = :writer_id";

    $statement = $conn->prepare($query);
    $statement->bindParam(':writer_id',$writerId);
    $statement->execute();

    $result = $statement->fetch();

    return $result;
}

function selectWriterBooks($writerId){
    global $conn;

    $query = "SELECT  book.name AS title, image.src AS src, book.id AS id, CONCAT(user.first_name,' ',user.last_name) AS writer,
    book.user_id AS writer_id, IFNULL(CEIL(AVG(review.stars)),0)  AS review
    FROM book 
    JOIN image ON image.id = book.image_id
    JOIN user ON user.id = book.user_id
    LEFT JOIN review ON review.book_id = book.id
    JOIN publisher ON publisher.id = book.publisher_id
    JOIN book_category ON book_category.book_id = book.id
    JOIN category ON category.id = book_category.category_id
    WHERE book.status = 1 AND publisher.status = 1 AND category.status = 1 AND book.user_id = :writer_id
    GROUP BY book.id ";

    $statement = $conn->prepare($query);
    $statement->bindParam(':writer_id',$writerId);
    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}

function selectWriterCategories($writerId){
    global $conn;

    $query = 'SELECT DISTINCT parent.id, parent.name
    FROM category parent 
    JOIN category child ON child.category_id = parent.id
    WHERE parent.status = 1 AND child.id IN (SELECT DISTINCT book_category.category_id
                                                FROM book
                                            JOIN book_category ON book_category.book_id = book.id
                                            JOIN category ON book_category.category_id = category.id
                                            WHERE book.user_id = :writer_id)';
    $statement = $conn->prepare($query);
    $statement->bindParam(':writer_id',$writerId);
    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}

function selectAllWriters(){
    global $conn;

    $query = "SELECT CONCAT(user.first_name,' ',user.last_name) AS writer, COUNT(book.id) AS book_count, avatar.src , user.id as writer_id
    FROM book
    JOIN user ON user.id = book.user_id
    JOIN avatar ON avatar.user_id = user.id
    WHERE user.status = 1 AND user.is_banned = 0 AND book.status = 1
    GROUP BY book.user_id";

    $statement = $conn->prepare($query);
    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}

function displayWriterArticle($writer){
    $display = '<article class="article-writer"><a href="index.php?page=writer&id='.$writer['writer_id'].'">
    </a><img class="set-brightness article-writer-img" src="assets/images/avatars/'.$writer['src'].'" alt="'.$writer['writer'].'">
    <h3>'.$writer['writer'].'</h3>
    <p>'.$writer['book_count'].' titles</p>
    </article>';

    return $display;
}

function selectAllWriterBooksForTable($writerId){
    global $conn;

    $query = 
    "SELECT image.src AS src, 0 AS categories_count ,image.alt AS alt , publisher.status AS publisher_status , book.name AS name,book.id AS id,book.user_id AS writer_id, book.price AS price,book.status AS status, book.release_date AS release_date 
    FROM book 
    JOIN image ON book.image_id = image.id
    JOIN publisher ON publisher.id = book.publisher_id
    WHERE book.user_id = :writer_id";

    $statement = $conn->prepare($query);
    $statement->bindParam(':writer_id',$writerId);

    $statement->execute();
    $result = $statement->fetchAll();

    $activeBooks = array();
    $deletedBooks = array();

    for($i=0; $i< count($result); $i++){
        $query = 
        "SELECT COUNT(book_category.category_id) AS category_count
        FROM book_category JOIN category ON category.id = book_category.category_id
        WHERE category.status = 1 AND book_category.book_id = :book_id
        GROUP BY book_category.book_id";

        $statement = $conn->prepare($query);
        $statement->bindParam(':book_id',$result[$i]['id']);
        $statement->execute();
        $count = $statement->fetch(PDO::FETCH_OBJ);

        if(is_object($count)){
            $result[$i]['categories_count'] = $count->category_count;
        }
    }

    foreach ($result as $book) {
        if ($book['status'] == 1 && $book['publisher_status'] && $book['categories_count'] > 0) {
            $activeBooks[] = $book;
        } else {
            $deletedBooks[] = $book;
        }
    }

    $booksTable = new stdClass();
    $booksTable->activeBooks = $activeBooks;
    $booksTable->deletedBooks = $deletedBooks;

    return $booksTable;
}
?>