<?php
    require_once "models/global/functions.php";
    require_once "models/book/functions.php";
    require_once "models/category/functions.php";
    require_once "models/writer/functions.php";

    if(!isset($_GET['id'])){
        http_response_code(400);
        redirect("index.php?page=home");
        exit;
    }

    $bookId = $_GET['id'];

    try{
        $bookInformation = selectBook($bookId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    try{
        $relatedCategories = selectRelatedCategoriesToABook($bookId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    try{
        $relatedBooks = selectRelatedBooksToACategories($relatedCategories);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    shuffle($relatedBooks);

    try{
        $relatedCategories = getCategories($relatedCategories);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    try{
        $allWritersBooks = selectWriterBooks($bookInformation['writer_id']);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    shuffle($allWritersBooks);

    try{
        $allTheComments = getBookComments($bookId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    if(isset($_SESSION['userId'])){
        $userId = $_SESSION['userId'];

        try{
            $review = getSingleReview($userId,$bookId);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
        }
    }

?>

<title>Writer | Readily</title>
</head>
<body>

<section id="book-info" class="wrapper">
    <h1><?=$bookInformation['title'] ?></h1>
    <p id="writer-link">By <a href="index.php?page=writer&id=<?=$bookInformation['writer_id']?>"><?=$bookInformation['writer']?></a></p>
    <div id="stars">
        <?php
        for($i=0;$i<5;$i++){
            if($bookInformation['review'] > $i){
                echo '<i class="fa-solid fa-star"></i>';
            }else{  
                echo '<i class="fa-regular fa-star"></i>';
            }
        }
        ?>
        <p><?php
            if($bookInformation['review_count']){
                echo $bookInformation['review']."/5 (<span class='text-bold'>".$bookInformation['review_count']." ratings</span>)";
            }else{
                echo "no ratings";
            }
        ?></p>
    </div>


    <div id="text-container-about">
        <h2>About this book</h2>
        <p style="white-space: pre-wrap;"><?=$bookInformation['description'] ?></p>
    </div>

    <section id="related-categories-container" class="section-articles">
        <h2 class="section-heading">Related Categories</h2>
        <div class="article-container article-category-container" id="book-related-categories-section">
            <?php foreach($relatedCategories as $category): ?>
                
                <?=displayCategoryArticle($category) ?>

            <?php endforeach ?>
        </div>
    </section>



    <div class="section-articles" id="div-info-section">
        <h2 class="section-heading">Info</h2>
        <div class="article-container article-info-container" id="div-info-container">
            <article>
                <p class="heading-info">Pages</p>
                <p class="text-bold"><?=$bookInformation['page_count']?></p>
            </article>
            <article>
                <p class="heading-info">Publisher</p>
                <p class="text-bold"><?=$bookInformation['publisher_name']?></p>
            </article>
            <article>
                <p class="heading-info">Release Date</p>
                <p class="text-bold"><?=date('F j, Y', strtotime($bookInformation['release_date']))?></p>
            </article>
        </div>
    </div>

    <div id="container-div-image-and-price">
        <div id="container-div-img" class="bg-article-color-<?=substr($bookInformation['id'],-1)?>">
            <img class="set-brightness" src="assets/images/books/large/<?=$bookInformation['src']?>" alt="<?=$bookInformation['title']?>">
        </div>
        <div id="price-container">
            <p>$<?=$bookInformation['price']?>.00</p>
            <i id="book-id-<?=$bookInformation['id'] ?>" class="fa-solid fa-cart-shopping"></i>
        </div>
    </div>

</section>

<section id="related-books" class="wrapper section-articles">
    <h2 class="section-heading">Related to <?=$bookInformation['title']?></h2>

    <div class="article-container article-book-container" id="related-books-articles-container">
        <?php foreach($relatedBooks as $book): ?>
            
            <?=displayBookArticle($book) ?>

        <?php endforeach ?>
    </div>
</section>


<section id="authors-books" class="wrapper section-articles">
    <h2 class="section-heading">Read more from <?=$bookInformation['writer'] ?></h2>

    <div class="article-container article-book-container" id="autors-books-articles-container">

        <?php foreach($allWritersBooks as $book): ?>
            
            <?=displayBookArticle($book) ?>

        <?php endforeach ?>
    </div>
</section>


<section id="review-section" class="wrapper">
    <div id="review-container">
        <h2>Reviews for <?=$bookInformation['title'] ?></h2>
        <div id="review-stars-container">

            <?php
            for($i=0;$i<5;$i++){
                if($bookInformation['review'] > $i){
                    echo '<i class="fa-solid fa-star"></i>';
                }else{
                    echo '<i class="fa-regular fa-star"></i>';
                }
            }
            if($bookInformation['review']) echo "<p>".$bookInformation['review']."/5</p>";
            ?>    
        </div>
        <div id="review-info">
            <p><?=$bookInformation['review_count'] ?> ratings</p>
            <p><?=$bookInformation['comment_count'] ?> reviews</p>
        </div>
    </div>



<?php if(isset($_SESSION['userId'])):?>

    <form id="star-rating-form" class="wrapper" >

    <h2>Rate this Book</h2>


    <div class="star-raiting-container">
        
        <?php 
        for($i=0;$i<5;$i++){
            echo "
            <div class='star-icon-container'>
                <i class='";
                echo $review['stars']>$i ?  'fa-solid' :  'fa-regular';
            echo " fa-star book-rating-star'></i>
                <input type='radio' value='$i' hidden name='book-stars' />
                <input type='text' value='".$bookInformation['id']."' hidden name='book-id' />
            </div>

            ";
        
        }
        ?>

    </div>

    <div class="server-messages" style="display:none">
    </div>

    </form>

    <form class="sign-up-container" id="form-comment" enctype="multipart/form-data">
        <h2>Write a Review</h2>

        <div class="info-container-grid personal-info-container-grid" id="comment-container">
        <label for="biography-input-js" id="biography-title-js" class="input-title biography-title" >Comment</label>
        <textarea name="comment-input" id="biography-input-js" class="biography-input"  ></textarea>
        <p id="biography-error" class="error-message " style="display: none;">There must be at least 5 words.</p>
        </div>

        <p class="p-title">Images</p>
        <div id="comment-images-container">
            <input type="file" class="comment-image" name="comment-image[]">

        </div>
        <p id="comment-images-error" class="error-message " style="display: none;" >Supported image formats include JPG, JPEG, and PNG, with a total file size limit of 2MB for all images combined.</p>

        
        <input type="text" hidden name="book-id" value="<?=$bookInformation['id']?>">
        
        <div class="server-messages comment-server-error"  style="display:none"></div>
        
        <div class="button-option-container">
            <input type="button" class="safe-option" id="comment-button" value="Submit">
        </div>
    </form>
<?php endif?>


<div id="comments-container-div">

    <?php foreach($allTheComments as $comment):?>
        <article class="article-comment">
            <div class="comment-user-info-container">
                <div class="avatar-and-name-container">
                    <img class="set-brightness comment-avatar" alt="avatar" src="assets/images/avatars/<?=$comment['avatar'] ?>">
                    <p class="comment-username"><?=$comment['username'] ?></p>
                </div>
                <?php if($comment['stars']):?>

                <div class="comments-stars">
                    <?php
                        for($i=0;$i<5;$i++){
                            if($comment['stars']>$i){
                                echo '<i class="fa-solid fa-star"></i>';
                            }else{
                                echo '<i class="fa-regular fa-star"></i>';
                            }
                        }
                    ?>
                    <p><?=$comment['stars']?>/5</p>
                </div>
                <?php endif?>
            </div>

            <div class="text-and-pictures-container">
                <div class="comment-text">
                    <p class="comment-text-row"><?=$comment['comment_text']?></p>
                </div>
                <div class="comment-pictures-container">
                        <?php

                            try{
                                $commentImages = getImgagesForComment($comment['id']);
                            }catch(PDOException $ex){
                                http_response_code(500);
                                $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
                                echo json_encode($errorMessageArray);
                            }
                            
                        ?>
                        <?php foreach($commentImages as $image): ?>
                            <img class="set-brightness comment-picture" alt="user uploaded picture" src="assets/images/comments/<?=$image['src']?>">
                        <?php endforeach?>
                </div>
            </div>
        </article>
    <?php endforeach?>
</div>

</section>
