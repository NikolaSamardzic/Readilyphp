<?php 

function getBestSellingBooks(){
    global $conn;

    $query = "SELECT  book.name AS title, COUNT(order_book.book_id) AS book_count,
    image.src AS src, book.id AS id, CONCAT(user.first_name,' ',user.last_name) AS writer,
    book.user_id AS writer_id, IFNULL(CEIL(AVG(review.stars)),0)  AS review
    FROM book 
    LEFT JOIN order_book ON order_book.book_id = book.id  
    JOIN image ON image.id = book.image_id
    JOIN user ON user.id = book.user_id
    LEFT JOIN review ON review.book_id = book.id
    JOIN publisher ON publisher.id = book.publisher_id
    WHERE book.status = 1 AND publisher.status = 1
    GROUP BY book.id 
    ORDER BY book_count DESC
    LIMIT 20";


    $statement = $conn->prepare($query);
    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}

function selectRelatedBooksToACategories($categories){
    global $conn;

    $parentIdValues = "".$categories[0]['id'];

    for($i=1;$i<count($categories);$i++){
        $parentIdValues .=  ", " . $categories[$i]['id'] ;
    }

    $query = 
    "SELECT book.name AS title, image.src AS src, book.id AS id, CONCAT(user.first_name,' ',user.last_name) AS writer,
    book.user_id AS writer_id, IFNULL(CEIL(AVG(review.stars)),0)  AS review
    FROM book
    JOIN image ON image.id = book.image_id
    JOIN user ON user.id = book.user_id
    LEFT JOIN review ON review.book_id = book.id
    JOIN publisher ON publisher.id = book.publisher_id
    JOIN book_category ON book_category.book_id = book.id
    JOIN category child ON child.id = book_category.category_id
    JOIN category parent ON parent.id = child.category_id  
    WHERE parent.id IN ($parentIdValues) AND book.status = 1 AND publisher.status = 1 
    GROUP BY book.id 
    ORDER BY RAND()
    LIMIT 20";

    $statement = $conn->prepare($query);
    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}

function displayBookArticle($book){
    $lastDigit = substr($book['id'],-1);
    $display =  "<article class='article-book'>
                    <div class='bg-article-color-".$lastDigit." article-div-img-container'>
                        <img  class='set-brightness' src='assets/images/books/small/" . $book['src']  ."' alt='" .$book['title'] ."'>
                    </div>
                    <div class='article-books-text-container'>
                        <div class='title-and-author'>
                            <h3>".$book['title'] ."</h3>
                            <a class='author-link' href='index.php?page=writer&id=" . $book['writer_id'] ."'>" . $book['writer'] . "</a>
                        </div>
                    <div class='stars-and-cart-container'>
                        <i class='fa-solid fa-cart-shopping shopping-cart' id='book-id-" . $book['id'] ."'></i>
                        <div class='stars-container'>
                        ";

                        for($i=0;$i<5;$i++){
                            if($book['review']>$i){
                                $display .= "<i class='fa-solid fa-star'></i>";
                                continue;
                            }else{
                                $display .= "<i class='fa-regular fa-star'></i>";
                            }

                        }
                
                $display .=

                                "
                            </div>
                            <p class='rating-text'>";
            
                if($book['review']){
                    $display .= $book['review'] . "/5";
                }else{
                    $display .= "0 ratings";
                }

                $display .=
                            "</p>
                        </div>
                    </div>
                    <a class='link-to-single-a-book' href='index.php?page=book&id=". $book['id'] ."'>
                    </a>
                </article>";


    return $display;
}

function getBooksForShop($filter,$sort){
    global $conn;

    $query = 
    "SELECT  DISTINCT book.name AS 'title' , COUNT(order_book.book_id) AS 'book_count',book.price AS 'price',book.release_date AS release_date, 
    image.src AS 'src', book.id AS 'id', CONCAT(user.first_name,' ',user.last_name) AS 'writer',
    book.user_id AS 'writer_id', IFNULL(CEIL(AVG(review.stars)),0)  AS 'review'
    FROM book 
    LEFT JOIN order_book ON order_book.book_id = book.id  
    JOIN image ON image.id = book.image_id
    JOIN user ON user.id = book.user_id
    JOIN publisher ON publisher.id = book.publisher_id
    JOIN book_category ON book_category.book_id = book.id
    LEFT JOIN review ON review.book_id = book.id
    WHERE book.status = 1 AND user.status = 1 AND publisher.status = 1 $filter
    GROUP BY book.id , book_category.category_id
    ORDER BY $sort";

    $statement = $conn->prepare($query);
    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}

function selectBook($id){
    global $conn;

    $query = 
    "SELECT book.id AS id, book.name as title, 
    CONCAT(user.first_name,' ',user.last_name) AS writer, 
    image.src AS src, book.description as description, book.price as price,
    book.release_date as release_date, publisher.name as publisher_name,
    book.page_count as page_count, IFNULL(CEIL(AVG(review.stars)),0)  AS review,
    (
        SELECT COUNT(review.book_id)
     FROM review
     WHERE review.book_id = :book_id
    ) AS review_count,(
        SELECT COUNT(comment.user_id)
     FROM comment
     WHERE comment.book_id = :book_id
    ) AS comment_count,
    user.id AS writer_id
    FROM book
    LEFT JOIN review ON review.book_id = book.id
    LEFT JOIN comment ON comment.book_id = book.id
    JOIN user ON book.user_id = user.id
    JOIN publisher ON publisher.id = book.publisher_id
    JOIN image ON image.id = book.image_id
    WHERE book.id = :book_id AND book.status = 1 AND publisher.status = 1 AND user.status = 1
    GROUP BY book.id";

    $statement = $conn->prepare($query);
    $statement->bindParam(':book_id',$id);
    $statement->execute();

    $result = $statement->fetch();
    return $result;
}

function getBookComments($bookId){
    global $conn;

    $query = 
    'SELECT comment.id, comment.comment_text , user.username, IFNULL(avatar.src,"default-avatar.jpg") as avatar, IFNULL(review.stars,0) as stars 
    FROM comment
    JOIN user ON user.id = comment.user_id
    JOIN book ON book.id = comment.book_id
    LEFT JOIN avatar ON avatar.user_id = user.id
    LEFT JOIN review ON user.id = review.user_id AND review.book_id = book.id
    WHERE book.id = :book_id';


    $statement = $conn->prepare($query);
    $statement->bindParam(':book_id',$bookId);
    $statement->execute();

    $result = $statement->fetchAll();
    return $result;
}

function getSingleReview($userId,$bookId){
    global $conn;

    $query = 
    "SELECT id , stars
    FROM review
    WHERE review.user_id = :user_id AND review.book_id = :book_id";
    $statement = $conn->prepare($query);
    $statement->bindParam(':user_id',$userId);
    $statement->bindParam(':book_id',$bookId);

    $statement->execute();
    $result = $statement->fetch();
    return $result;
}

function getImgagesForComment($commentId){
    global $conn;

    $query = 
    "SELECT * FROM image
    JOIN comment_image ON comment_image.image_id = image.id
    WHERE comment_image.comment_id = :comment_id";

    $statement = $conn->prepare($query);
    $statement->bindParam(":comment_id",$commentId);
    $statement->execute();
    
    $result = $statement->fetchAll();
    return $result;
}

function selectBookInformation($bookId){
    global $conn;

    $query = 
    'SELECT book.id AS id,book.user_id AS writer_id, book.name AS name, book.page_count AS page_count, book.price AS price, book.publisher_id AS publisher_id, book.release_date AS release_date, book.description AS description, image.src AS src FROM book 
    JOIN image ON book.image_id = image.id 
    WHERE book.id = :book_id';

    $statement = $conn->prepare($query);
    $statement->bindParam(':book_id',$bookId);

    $statement->execute();

    $result = $statement->fetch(PDO::FETCH_OBJ);

    return $result;
}

function selectBookActiveCategories($bookId){
    global $conn;

    $query = 
    'SELECT book_category.category_id FROM book_category JOIN category ON category.id = book_category.category_id 
    WHERE category.status = 1 AND book_category.book_id = :book_id';

    $statement = $conn->prepare($query);
    $statement->bindParam(':book_id',$bookId);

    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}

function checkBookImg($name,$size,$type,&$errorMessagesArray){
    $allowedTypes = array('jpg', 'jpeg', 'png');

    if(!in_array($type, $allowedTypes)) {
        $errorMessagesArray[] = 'File type not allowed. Only JPG, JPEG, and PNG files are allowed.';
        return;
    }

    if($size > 700 * 1024) {
        $errorMessagesArray[] = 'File size exceeds 700KB limit.';
        return;
    }

    list($width, $height) = getimagesize($name);

    if($height/$width < 200/170){
        $errorMessagesArray[] = 'Width must be lesser than height.';
        return;
    }
}

function checkDateInput($releaseDate,&$errorMessageArray){
    $dateTimestamp = strtotime($releaseDate);
    $currentTimestamp = time();
    if ($dateTimestamp > $currentTimestamp) {
        $errorMessageArray = "The date is in the future!";
    }
}

function getBookImage($bookId){
    global $conn;

    $query = 'SELECT image.src AS src, image.id AS id FROM image JOIN book ON image.id = book.image_id WHERE book.id = :book_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':book_id',$bookId);

    $statement->execute();

    $result = $statement->fetch(PDO::FETCH_OBJ);

    return $result;
}

function updateBookImageRowName($bookImgId,$avatarType){
    global $conn;

    $src = $bookImgId . '.' . $avatarType;

    $query = 'UPDATE image SET src = :src WHERE id = :book_img_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(":src",$src);
    $statement->bindParam(":book_img_id",$bookImgId);
    $statement->execute();

}

function updateBook($bookTitle, $pageCount, $bookPrice, $releaseDate, $bookDescription, $publisherId, $bookId){
    global $conn;

    $query = 
    'UPDATE book 
    SET name = :book_title, page_count = :page_count,
    price = :book_price, release_date = :release_date, 
    description = :book_description, publisher_id = :publisher_id
    WHERE id = :book_id';

    $statement = $conn->prepare($query);

    $statement->bindParam(':book_title',$bookTitle);
    $statement->bindParam(':page_count',$pageCount);
    $statement->bindParam(':book_price',$bookPrice);
    $statement->bindParam(':release_date',$releaseDate);
    $statement->bindParam(':book_description',$bookDescription);
    $statement->bindParam(':publisher_id',$publisherId);
    $statement->bindParam(':book_id',$bookId);

    $statement->execute();
}

function deleteBook($bookId){
    global $conn;

    $query = 'UPDATE book SET status = 0 WHERE id = :book_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':book_id',$bookId);

    $statement->execute();
}

function activateBook($bookId){
    global $conn;

    $query = 'UPDATE book SET status = 1 WHERE id = :book_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':book_id',$bookId);

    $statement->execute();
}

function insertNewImageRow(){
    global $conn;

    $query = "INSERT INTO image () VALUES ()";
    $statement = $conn->prepare($query);

    $statement->execute();

    $lastInsertId = $conn->lastInsertId();

    return $lastInsertId;
}

function insertNewBook($bookTitle, $pageCount, $bookPrice, $releaseDate, $bookDescription, $publisherId, $writerId, $bookImgId){
    global $conn;

    $query = 
    'INSERT INTO book (name, page_count, price, release_date, description, publisher_id, user_id, image_id)
    VALUES(:book_title, :page_count, :book_price, :release_date, :book_description, :publisher_id, :writer_id, :book_img_id )';
    $statement = $conn->prepare($query);

    $statement->bindParam(':book_title',$bookTitle);
    $statement->bindParam(':page_count',$pageCount);
    $statement->bindParam(':book_price',$bookPrice);
    $statement->bindParam(':release_date',$releaseDate);
    $statement->bindParam(':publisher_id',$publisherId);
    $statement->bindParam(':writer_id',$writerId);
    $statement->bindParam(':book_img_id',$bookImgId);
    $statement->bindParam(':book_description',$bookDescription);

    $statement->execute();

    $lastInsertId = $conn->lastInsertId();

    return $lastInsertId;
}

function insertBookCategories($bookId,$selected_categories){
    global $conn;

    foreach($selected_categories as $category){
        $query = 'INSERT INTO book_category (book_id,category_id) VALUES (:book_id,:category)';
        $statement = $conn->prepare($query);

        $statement->bindParam(':book_id',$bookId);
        $statement->bindParam(':category',$category);

        $statement->execute();

        
    }
}

function insertReview($userId,$bookId,$bookStars){
    global $conn;

    $query = 
    "INSERT INTO review (stars, user_id, book_id) VALUES(:book_stars, :user_id, :book_id)";
    $statement = $conn->prepare($query);
    $statement->bindParam(":book_stars",$bookStars);
    $statement->bindParam(":user_id",$userId);
    $statement->bindParam(":book_id",$bookId);

    $statement->execute();

    $lastInsertId = $conn->lastInsertId();

    return $lastInsertId;
}

function updateReview($reviewId,$bookStars){
    global $conn;

    $query = "UPDATE review SET stars = :stars WHERE id = :id";
    $statement = $conn->prepare($query);
    $statement->bindParam(":stars",$bookStars);
    $statement->bindParam(":id",$reviewId);

    $statement->execute();
}

function insertCommentText($userId,$bookId,$comment){
    global $conn;

    $query = "INSERT INTO comment(comment_text,user_id,book_id) VALUES(:comment,:user_id,:book_id)";
    $statement = $conn->prepare($query);
    $statement->bindParam(':comment',$comment);
    $statement->bindParam(':user_id',$userId);
    $statement->bindParam(':book_id',$bookId);

    $statement->execute();

    $lastInsertId = $conn->lastInsertId();

    return $lastInsertId;
}

function insertCommentImageRow($commentImgId,$commentId){
    global $conn;

    $query = "INSERT INTO comment_image(comment_id,image_id) VALUES(:comment_id,:comment_img_id)";
    $statement = $conn->prepare($query);
    $statement->bindParam(':comment_id',$commentId);
    $statement->bindParam(':comment_img_id',$commentImgId);
    $statement->execute();
}

function createNewBookImage($bookImgTmpName, $height, $bookImgId, $bookImgType, $folder){
    $uploadDir = '../../assets/images/books/' . $folder;
    $filePath = $uploadDir . $bookImgId . '.' .$bookImgType;

    if ($bookImgType === 'jpg' || $bookImgType === 'jpeg') {
        $originalImage = imagecreatefromjpeg($bookImgTmpName);
    } elseif ($bookImgType === 'png') {
        $originalImage = imagecreatefromjpeg($bookImgTmpName);
    }

    $originalWidth = imagesx($originalImage);
    $originalHeight = imagesy($originalImage);

    $newWidth = round(($originalWidth / $originalHeight) * $height);

    $newImage = imagecreatetruecolor($newWidth, $height);

    imagecopyresampled($newImage, $originalImage, 0, 0, 0, 0, $newWidth, $height, $originalWidth, $originalHeight);

    $quality = $folder == "small/" ? 75 : 100;

    if ($bookImgType === 'jpg' || $bookImgType === 'jpeg') {
        $result = imagejpeg($newImage, $filePath, $quality);
    } elseif ($bookImgType === 'png') {
        $result = imagepng($newImage, $filePath, $quality);
    }

    imagedestroy($newImage);
    imagedestroy($originalImage);

    return $result;
}
?>