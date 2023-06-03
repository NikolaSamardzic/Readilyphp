<?php
    require_once "config/connection.php";
    require_once "models/global/functions.php";
    require_once "models/book/functions.php";
    require_once "models/publisher/functions.php";
    require_once "models/category/functions.php";

    if(!isset($_SESSION["userRoleName"]) || (($_SESSION["userRoleName"] != "admin") && $_SESSION["userRoleName"] != "writer")  || !isset($_GET['writer-id'])){
        http_response_code(403);
        redirect("index.php?page=home");
        exit;
    }

    $writerId = $_GET['writer-id'];

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
?>

<title>Insert Book | Readily</title>
</head>
<body>

<section class="insert-update-book-section wrapper">

    <form class="book-form-container" id="insert-book-form" enctype="multipart/form-data" name="insert-book-form" action="" method="post">
    <input type="text" name="writer-id" value="<?=$writerId?>" hidden>
    <h2>Book Info</h2>

    <div class="book-image-container-form">
    </div>

    <p class="upload-book-image-text">upload image of the book</p>

    <input type="file" id="book-image-js" name="book-image" class="book-image-form"/>
    <p  id="book-image-error"  class="error-message " style="display:none">Please upload an image with a maximum size of 700KB and in one of the following formats: jpg, jpeg, or png. Image width needs to be smaller than its height</p>


    <div class="info-container-grid book-info-container-grid">
    
        <label for="book-title-title-js" class="input-title book-title-title">Book Title</label>
        <input type="text" id="book-title-title-js" class="book-title-input" name="book-title-input">
        <p id="book-title-error" class="error-message " style="display: none;">Can't be empty</p>

        <label for="page-count-input-js" class="input-title page-count-title">Page Count</label>
        <input type="number" min="0" id="page-count-input-js" class="page-count-input" name="page-count-input">
        <p id="page-count-error" class="error-message " style="display: none;">Can't be empty</p>

        <label for="price-input-js" class="input-title price-title">Price</label>
        <input type="number" min="0" id="price-input-js" class="price-input" name="price-input">
        <p id="price-error" class="error-message " style="display: none;">Can't be empty</p>

        <label for="release-date-input-js" class="input-title release-date-title">Release Date</label>
        <input type="date" id="release-date-input-js" class="release-date-input" name="release-date-input">
        <p id="release-date-error" class="error-message " style="display: none;">Can't be empty and can't be in future</p>

        <label for="publisher-input-js"  class="input-title publisher-title">Publisher</label>
        <select id="publisher-input-js" name="publisher-input" class="publisher-input">
            <?php foreach($activePublishers as $publisher): ?>
            <option value="<?=$publisher['id']?>" ><?=$publisher['name']?></option>
            <?php endforeach ?>
        </select>
        <p id="publisher-error"  class="error-message " style="display: none;">Can't be empty</p>

        <label for="book-description-input-js"  class="input-title book-description-title" >Description</label>
        <textarea name="book-description-input" id="book-description-input-js" class="book-description-input" ></textarea>
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

        <input type="button" class="safe-option" id="insert-new-book" value="Add Book">
    </div>
    </form>

</section>