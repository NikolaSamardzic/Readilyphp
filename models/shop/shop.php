<?php 
session_start();
header('Content-type: application/json');

require_once "../book/functions.php";
require_once "../../config/connection.php";

if($_SERVER['REQUEST_METHOD']=='GET'){
    http_response_code(404);
    redirect("../../index.php?page=404");
    exit;
}

define('PAGE_BOOK_COUNT',20);

$filter = "";
$sort = "";

$activePage = 1;

if(isset($_POST['activePage'])){
    $activePage = $_POST['activePage'];
}

if(!empty($_POST['input-search'])){
    $filter .= " AND book.name LIKE '%" .$_POST['input-search']. "%' ";
}

if(!empty($_POST['price-min']) ){
    $filter .= " AND book.price " .'>'. " " . $_POST['price-min'] . " ";
}

if(!empty($_POST['price-max'])){
    $filter .= " AND book.price " .'<'. " " . $_POST['price-max'] . " ";   
}

if(!empty($_POST['book-category-cb'])){
    $categories = $_POST['book-category-cb'];
    $filter .= "AND book_category.category_id IN ( " . $categories[0];
    for($i=1;$i<count($categories);$i++){
        $filter .= ", " . $categories[$i];
    }
    $filter .= ")";
}

switch($_POST['sort']){
    case 'popular':
        $sort .= "book_count DESC";
        break;
    case 'newest':
        $sort .= "book.release_date DESC";
        break;
    case 'price-asc':
        $sort .= "book.price ASC";
        break;
    case 'price-desc':
        $sort .= "book.price DESC";
        break;
    case 'name-asc':
        $sort .= "book.name ASC";
        break;
    case 'name-desc':
        $sort .= "book.name DESC";
        break;
}

try{
    $books = getBooksForShop($filter,$sort);
}catch(PDOException $ex){
    http_response_code(500);
    $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
    echo json_encode($errorMessageArray);
    exit;
}

$message[] = ceil(count($books)/PAGE_BOOK_COUNT);
$message[] = intval($activePage);

$start = (intval($activePage)-1)*PAGE_BOOK_COUNT;
$length = PAGE_BOOK_COUNT;
$message[] = array_slice($books, $start, $length);

http_response_code(200);
echo json_encode($message);
ob_end_flush();
?>