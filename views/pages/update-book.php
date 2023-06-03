<?php
    require_once "config/connection.php";
    require_once "models/global/functions.php";
    require_once "models/book/functions.php";
    require_once "models/writer/functions.php";
    require_once "models/publisher/functions.php";
    require_once "models/category/functions.php";

    if(!isset($_SESSION["userRoleName"]) || (($_SESSION["userRoleName"] != "admin") && $_SESSION["userRoleName"] != "writer")  || !isset($_GET['book-id'])){
        http_response_code(401);
        redirect("index.php?page=login");
        exit;
    }

    $bookId = $_GET['book-id'];

    try{
        $allPublishers = selectAllPublishers();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    $activePublishers = $allPublishers->activePublishers;

    try{
        $allCategories = selectAllActiveCategories(null);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    try{
        $bookInformation = selectBookInformation($bookId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    $timestamp = strtotime($bookInformation->release_date);
    $releaseDate = date('Y-m-d',$timestamp );
?>

<title>Update Book | Readily</title>
</head>
<body>

<section class="insert-update-book-section wrapper">

<form class="book-form-container" id="update-book-form" enctype="multipart/form-data" name="update-book-form" action="" method="post">
<input type="text" id="book-id-js" name="book-id" value="<?=$bookInformation->id?>" hidden>
<input type="text" id="writer-id-js" name="writer-id" value="<?=$bookInformation->writer_id?>" hidden>
<h2>Book Info</h2>

<div class="book-image-container-form">
    <img src="assets/images/books/small/<?=$bookInformation->src ?>" alt="<?=$bookInformation->name ?>">
</div>

<p class="upload-book-image-text">upload image of the book</p>

<input type="file" id="book-image-js" name="book-image" class="book-image-form"/>
<p  id="book-image-error"  class="error-message " style="display:none">Please upload an image with a maximum size of 700KB and in one of the following formats: jpg, jpeg, or png for your avatar. Image width needs to be smaller than its height</p>

<div class="info-container-grid book-info-container-grid">
    
    <label for="book-title-title-js" class="input-title book-title-title">Book Title</label>
    <input type="text" id="book-title-title-js" class="book-title-input" name="book-title-input" value="<?=$bookInformation->name ?>">
    <p id="book-title-error" class="error-message " style="display: none;">Can't be empty</p>

    <label for="page-count-input-js" class="input-title page-count-title">Page Count</label>
    <input type="number" min="0" id="page-count-input-js" class="page-count-input" name="page-count-input" value="<?=$bookInformation->page_count ?>">
    <p id="page-count-error" class="error-message " style="display: none;">Can't be empty</p>

    <label for="price-input-js" class="input-title price-title">Price</label>
    <input type="number" min="0" id="price-input-js" class="price-input" name="price-input" value="<?=$bookInformation->price ?>">
    <p id="price-error" class="error-message " style="display: none;">Can't be empty</p>

    <label for="release-date-input-js" class="input-title release-date-title">Release Date</label>
    <input type="date" id="release-date-input-js" class="release-date-input" name="release-date-input" value="<?=$releaseDate?>">
    <p id="release-date-error" class="error-message " style="display: none;">Can't be empty and can't be in future</p>

    <label for="publisher-input-js"  class="input-title publisher-title">Publisher</label>
    <select id="publisher-input-js" name="publisher-input" class="publisher-input">
        <?php foreach($activePublishers as $publisher): ?>
        <option value="<?=$publisher['id']?>" <?php if($publisher['id'] == $bookInformation->publisher_id){ echo 'selected';} ?> ><?=$publisher['name']?></option>
        <?php endforeach ?>
    </select>
    <p id="publisher-error"  class="error-message " style="display: none;">Can't be empty</p>

    <label for="book-description-input-js"  class="input-title book-description-title" >Description</label>
    <textarea name="book-description-input" id="book-description-input-js" class="book-description-input" ><?=$bookInformation->description ?></textarea>
    <p id="book-description-error" class="error-message " style="display: none;">Can't be empty</p>

    <p class="input-title book-category-title">Categories</p>
    <ul class="book-category-input" id="book-category-input-js">
        <?php foreach($allCategories as $category): ?>
            <li class="category-parent"><p><i class="fa-solid fa-angle-down"></i><?=$category['name']?></p>
                <?=displayCategoriesMenu($category['id'],0)?>
            </li>
        <?php endforeach ?>
    </ul>
    <p id="book-category-error"  class="error-message " style="display: none;">Can't be empty</p>
</div>

<div class="server-messages">
</div>

<div class="button-option-container">
    <input type="button" class="safe-option" id="update-book" value="Save">
</div>

</form>

</section>