<?php 

function selectAllActiveCategories($parent){
    global $conn;
    
    if($parent){
        $query = 'SELECT * FROM category WHERE category_id = :parent AND status = 1';
    }else{
        $query = 'SELECT * FROM category WHERE category_id  IS NULL AND status = 1';
    }

    $statement = $conn->prepare($query);

    if($parent){
    $statement->bindParam(':parent',$parent);
    }

    $statement->execute();

    $allCategories = $statement->fetchAll();

    return $allCategories;
}

function getCategories($allParentCategories){
    global $conn;

    $valuesNotIn = "0 ";
    $resultsArray = [];

    for($i=0;$i<count($allParentCategories);$i++){
        $query = 
        "SELECT DISTINCT book.id, book.name,image.src, 1 AS 'category_name', 1 AS category_id
        FROM book
        JOIN book_category ON book_category.book_id = book.id
        JOIN publisher ON publisher.id = book.publisher_id
        JOIN image ON image.id = book.image_id
        WHERE book_category.category_id IN (SELECT child.id
                                            FROM category parent
                                            JOIN category child ON parent.id = child.category_id
                                            WHERE parent.id = :parent_id)
        AND book.id NOT IN ($valuesNotIn) AND book.status = 1 AND publisher.status = 1
        GROUP BY book.id
        LIMIT 1";

        $statement = $conn->prepare($query);
        $statement->bindParam(':parent_id',$allParentCategories[$i]['id']);
        $statement->execute();

        $result = $statement->fetch();
        $result['category_name'] = $allParentCategories[$i]['name'];
        $result['category_id'] = $allParentCategories[$i]['id'];
        $valuesNotIn .= ', ' .  $result['id'];
        $resultsArray[] = $result;
    }

    $filteredArray = [];
    $isUnique = true;
    
    foreach ($resultsArray as $item) {
        foreach($filteredArray as $cat){
            if($cat['category_id'] == $item['category_id']){
                $isUnique = false;
                break;
            }
        }
        
        if(!$isUnique){
            $isUnique = true;
            continue;
        }
            
        $filteredArray[] = $item;
    }

    return $filteredArray;
}

function selectUserPreferedCategories($userId){
    global $conn;

    $query = "SELECT category_id AS id FROM prefered_categories WHERE user_id = :user_id";
    $statement = $conn->prepare($query);

    $statement->bindParam(':user_id',$userId);
    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}

function displayCategoryArticle($category){
    
    $display ='<article class="article-category">
    <a href="index.php?page=shop&category-id='. $category['category_id'] .'"></a>
    <p>'. $category['category_name'] .'</p>
    <img src="assets/images/books/small/' .$category['src'] . '" alt="' .$category['name'] . '" class="set-brightness"></article>';

    return $display;
}

function displayCategoriesMenu($parent,$checkId){

    $allCategories = selectAllActiveCategories($parent);

    $checked = $parent == $checkId ? "checked" : "";

    if(count($allCategories)){
        echo "<ul>";
        foreach($allCategories as $category){
            echo "<li class='book-category-li'><input type='checkbox'". $checked ." name='book-category-cb[]' class='book-category-cb' value='". $category['id'] . "' id='cb-".$category['id']. "'><label for='cb-".$category['id'] ."'>".$category['name'] ."</label></li>";
        }
        echo "</ul>";
    }

}

function selectRelatedCategoriesToABook($bookId){
    global $conn;

    $query = "SELECT parent.id, parent.name
    FROM category parent
    JOIN category child ON parent.id = child.category_id
    WHERE child.id IN (SELECT category.id
                        FROM book
                        JOIN image ON image.id = book.image_id
                        JOIN book_category ON book_category.book_id = book.id
                        JOIN category ON category.id = book_category.category_id
                        WHERE book.id = :book_id)";

    $statement = $conn->prepare($query);
    $statement->bindParam(':book_id',$bookId);

    $statement->execute();
    $result = $statement->fetchAll();

    return $result;
}

function selectAllCategories(){
    global $conn;
    
    $query = 'SELECT c.id AS id, c.name AS name, p.name AS parent,COUNT(book_category.book_id) AS book_count, c.status AS status, c.created_at AS created_at, c.deleted_at AS deleted_at, c.category_id AS category_id FROM category c LEFT JOIN category p ON c.category_id = p.id LEFT JOIN book_category ON book_category.category_id = c.id GROUP BY c.id';
    $statement = $conn->prepare($query);

    $statement->execute();

    $allCategorie = $statement->fetchAll();

    for($i=0; $i<count($allCategorie);$i++){
        if($allCategorie[$i]['category_id']){
            continue;
        }

        $query = 'SELECT COUNT(DISTINCT book_category.book_id) AS count
        FROM category
        JOIN category child_category ON child_category.category_id = category.id
        JOIN book_category ON book_category.category_id = child_category.id
        WHERE category.id = :category_id';

        $statement = $conn->prepare($query);
        $statement->bindParam(':category_id',$allCategorie[$i]['id']);
        $statement->execute();
        $result = $statement->fetch(PDO::FETCH_OBJ);
        $allCategorie[$i]['book_count'] = $result->count;

    }

    $activeCategories = array();
    $deletedCategories = array();

    foreach ($allCategorie as $category) {
        if ($category['status'] == 1) {
            $activeCategories[] = $category;
        } elseif ($category['status'] == 0) {
            $deletedCategories[] = $category;
        }
    }

    $categoriesTable = new stdClass();
    $categoriesTable->activeCategories = $activeCategories;
    $categoriesTable->deletedCategories = $deletedCategories;

    return $categoriesTable;
}

function updateSubategory($categoryId,$categoryName,$subcategoryParent){
    global $conn;

    $query = 'UPDATE category SET name = :category_name, category_id = :subcategory_parent WHERE id = :category_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':category_name',$categoryName);
    $statement->bindParam(':category_id',$categoryId);
    $statement->bindParam(':subcategory_parent',$subcategoryParent);
    $statement->execute();
}

function addSubcategory($categoryName,$subcategoryParent){
    global $conn;

    $query = 'INSERT INTO category (name,status,category_id) VALUES(:category_name,1,:category_id)';
    $statement = $conn->prepare($query);

    $statement->bindParam(':category_name',$categoryName);
    $statement->bindParam(':category_id',$subcategoryParent);
    $statement->execute();
}

function addCategory($categoryName){
    global $conn;

    $query = 'INSERT INTO category (name,status) VALUES(:category_name,1)';
    $statement = $conn->prepare($query);

    $statement->bindParam(':category_name',$categoryName);
    $statement->execute();
}

function updateCategory($categoryId,$categoryName){
    global $conn;

    $query = 'UPDATE category SET name = :category_name WHERE id = :category_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':category_name',$categoryName);
    $statement->bindParam(':category_id',$categoryId);
    $statement->execute();
}

function deleteCategory($categoryId){
    global $conn;

    $query = 'UPDATE category SET status = 0, deleted_at = NOW() WHERE id = :category_id';
    $statement = $conn->prepare($query);
    $statement->bindParam(':category_id',$categoryId);

    $statement->execute();

    $query2 = 'UPDATE category SET status = 0, deleted_at = NOW() WHERE category_id = :category_id';
    $statement2 = $conn->prepare($query2);
    $statement2->bindParam(':category_id',$categoryId);

    $statement2->execute();
}

function activateCategory($categoryId){
    global $conn;

    $query = 'UPDATE category SET status = 1 WHERE id = :category_id';
    $statement = $conn->prepare($query);
    $statement->bindParam(':category_id',$categoryId);
    
    $statement->execute();
}

function deleteUpdatedBookCategories($bookId,$deletedCategories){
    global $conn;

    for($i=0; $i<count($deletedCategories);$i++){
        $query = 'DELETE FROM book_category WHERE book_id = :book_id AND category_id = :category_id';
        $statement = $conn->prepare($query);

        $statement->bindParam(':book_id',$bookId);
        $statement->bindParam(':category_id',$deletedCategories[$i]);

        $statement->execute();
    }
}

function addUpdatedBookCategories($bookId,$addedCategories){
    global $conn;

    for($i=0; $i<count($addedCategories);$i++){
        $query = 'INSERT INTO book_category (book_id, category_id) VALUES (:book_id, :category_id)';
        $statement = $conn->prepare($query);

        $statement->bindParam(':book_id',$bookId);
        $statement->bindParam(':category_id',$addedCategories[$i]);

        $statement->execute();
    }
}
?>