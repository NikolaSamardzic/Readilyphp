<?php
    require_once "models/global/functions.php";
    require_once "models/writer/functions.php";
    require_once "models/book/functions.php";
    require_once "models/category/functions.php";

    if(!isset($_GET['id'])){
        http_response_code(400);
        redirect("index.php?page=home");
        exit;
    }

    $writerId = $_GET['id'];

    try{
        $writerInformation = selectWriter($writerId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    $writerInformation['src'] = $writerInformation['src'] ? $writerInformation['src'] : "default-avatar.jpg";

    $words = explode(' ',$writerInformation['biography_text']);
    $shortBiography = array_slice($words,0,25);
    $shortBiography = implode(' ',$shortBiography);
    $shortBiography .= "... ";

    try{
        $allWritersBooks = selectWriterBooks($writerId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    try{
        $writerCategories = selectWriterCategories($writerId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    try{
        $categoriesInformation = getCategories($writerCategories);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }
    
    try{
        $allWriters = selectAllWriters();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }
?>

<title>Writer | Readily</title>
</head>
<body>

<section id="writer-info">
    <div id="writer-info-container" class="wrapper">
        <h1><?=$writerInformation['writer']; ?></h1>
        <img alt="J.K. Rowling" src="assets/images/avatars/<?=$writerInformation['src']; ?>">
        <p class="short-info" style="display: block;"><?=$shortBiography ?><span id="show-more">Show More</span></p><p class="long-info" style="display: none;"><?=$writerInformation['biography_text'] ?><span id="show-less">Show Less</span></p></div>    
</section>

<section id="writer-books" class="wrapper section-articles">
    <h2 class="section-heading">Books by J.K. Rowling</h2>
    <div class="article-container article-book-container" id="writer-books-articles-container">
        <?php foreach($allWritersBooks as $book): ?>
            
            <?=displayBookArticle($book) ?>

        <?php endforeach ?>
    </div>
</section>

<section id="writer-categories" class="wrapper section-articles" >
    <h2 class="section-heading">Related Categories</h2>
    <div class="article-container article-category-container" id="writer-categories-articles-container">
        <?php foreach($categoriesInformation as $category): ?>
            
            <?=displayCategoryArticle($category) ?>

        <?php endforeach ?>
    </div>
</section>

<section id="other-writers" class="wrapper section-articles" >
    <h2 class="section-heading">Check Out Other Authors</h2>
    <div class="article-container article-author-container" id="other-writers-articles-container">
        <?php foreach($allWriters as $writer): ?>
            
            <?=displayWriterArticle($writer) ?>

        <?php endforeach ?>
    </div>
</section>

