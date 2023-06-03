<?php
    require_once "models/home/functions.php";
    require_once "models/book/functions.php";
    require_once "models/category/functions.php";

    $surveyWebsiteExperience = [];

    if(isset($_SESSION['userId'])){
        try{
            $surveyWebsiteExperience = getSurvey('website experience',$_SESSION['userId']);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
        }
    }

    try{
        $bestSellingBooks = getBestSellingBooks();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    try{
        $allParentCategories = selectAllActiveCategories(null);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    try{
        $allCategories = getCategories($allParentCategories);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    $peferedCategories = [];
    if(isset($_SESSION['userId'])){
        try{
            $peferedCategories = selectUserPreferedCategories($_SESSION['userId']);
        }catch(PDOException $ex){
            http_response_code(500);
            $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
            echo json_encode($errorMessageArray);
        }

        if(count($peferedCategories)){

            try{
                $preferedBooks = selectRelatedBooksToACategories($peferedCategories);
            }catch(PDOException $ex){
                http_response_code(500);
                $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
                echo json_encode($errorMessageArray);
            }

            shuffle($preferedBooks);
        }
    }
?>

<title>Home | Readily</title>
</head>
<body>


    <section id="about-readily">
            <h1>What is Readily?</h1>
            <div id="about-container">
                <p>At Readily, we're passionate about providing you with the books you love. With our online bookstore, you can easily browse and purchase your favorite books, all from the comfort of your own home.</p>

            </div>
            <div id="img-placeholder">
                <img src="assets/images/readily.png" class="set-brightness" alt="readily website picture">
            </div>
    </section>

    <div id="angle-down">
        <div id="position"></div>
        <a href="#position">
            <i id="scroll-down" class="fa-solid fa-angle-down"></i>
        </a>

    </div>
    <section id="introduction" class="wrapper">
        <div id="introduction-heading-container">
            <h2>Whatever you're into, we've got <br> something for you</h2>
        </div>

        <article id="article1">  
            <img src="assets/images/introduction/discover.svg" alt="discover something new image" class="svg" />
            <h3>Discover something new every day</h3>
            <p>At Readily, we're all about discovering something new. With our vast selection of titles and new releases added regularly, there's always something fresh and exciting to explore. Join us today and start your journey of discovery.</p>
        </article>

        <article id="article2">  
            <img src="assets/images/introduction/originals.svg" alt="minimalistic image for original books"class="svg" />
            <h3>Originals you won't find elsewhere</h3>
            <p>At Readily, we pride ourselves on offering a selection of books that you won't find anywhere else. From rare editions to limited releases, we're passionate about bringing you unique and original titles that will inspire and delight you. Join us today and discover the joy of owning a one-of-a-kind book.</p>
        </article>

        <article id="article3">  
            <img src="assets/images/introduction/help.svg" alt="helping with chooseing book image"class="svg" />
            <h3>Help finding your next great read</h3>
            <p>At Readily, we're here to help you find your next favorite book. Whether you're looking for a specific genre, author, or just need some inspiration, our knowledgeable staff are on hand to offer recommendations and advice. With our user-friendly website and personalized service, discovering your next great read has never been easier. Join us today and let us help you find your next literary obsession.</p>
        </article>
    </section>

    <section id="discover">
        <img class="svg" id="discover-img-1" src="assets/images/introduction/door.svg" alt="descriptive image" />
        <img class="svg" id="discover-img-2" src="assets/images/introduction/bed.svg" alt="descriptive image" />

        <div id="discover-container">
            <h2>Read anywhere. Anytime.</h2>
            <p>Discover the best reads on various topics of interest.</p>
            <a href="index.php?page=shop">Explore titles</a>
        </div>
    </section>

    <section id="suggested-books" class="wrapper section-articles">
        <?php if(count($peferedCategories)): ?>
            <h2 class="section-heading">Books Recommended For You</h2>
            <div class="article-container article-book-container" id="sugested-books-articles-container">
                <?php foreach($preferedBooks as $book): ?>
            
                <?=displayBookArticle($book) ?>

                <?php endforeach ?>
            </div>

        <?php endif;?>
    </section>

    <section id="bestselling-books" class="wrapper section-articles">
        <h2 class="section-heading">Bestselling Books</h2>

        <div class="article-container article-book-container" id="bestselling-books-articles-container">
        <?php foreach($bestSellingBooks as $book): ?>
            
            <?=displayBookArticle($book) ?>

        <?php endforeach ?>

        </div>
    </section>

    <section id="popular-categories" class="wrapper section-articles">
        <h2 class="section-heading">Popular Categories</h2>

        <div class="article-container article-category-container" id="popular-categories-articles-container">
            <?php foreach($allCategories as $category): ?>
                
                <?=displayCategoryArticle($category) ?>

            <?php endforeach ?>
        </div>  
    </section>

    <?php if(count($surveyWebsiteExperience)): ?>

    <section id="survey-website-experience-section" class="wrapper">
            
        <h2><?= $surveyWebsiteExperience[0]['name'] ?></h2>

        <form id="website-experience-form">
            <?php foreach($surveyWebsiteExperience as $option): ?>
                <article class="survey-option">
                    <img src="assets/images/options/<?=$option['src'] ?>" alt="<?=$option['choice'] ?>">
                    <p><?=$option['choice'] ?></p>
                    <input type="radio" name="survey-choice" hidden value="<?=$option['id'] ?>">
                    <input type="text" name="survey-id" hidden value="<?=$option['survey_id'] ?>">
                </article>
            <?php endforeach ?>
        </form>

        <div class="server-messages survey-message" style="display: none;">
        </div>
    </section>

    <?php endif ?>

    <?php if(isset($_SESSION['userId'])):?>

        <form class="sign-up-container" id="message-form" >

            <h2>Get in Touch with Us</h2>

            <div class="info-container-grid personal-info-container-grid">

            <label for="subject-input-js" class="input-title first-name-title">Subject</label>
            <input type="text" id="subject-input-js" class="first-name-input" name="subject">
            <p id="first-name-error" class="error-message " style="display: none;">Can't be empty</p>

            <label for="biography-input-js" id="biography-title-js" class="input-title biography-title" >Message</label>
            <textarea name="message-input" id="biography-input-js" class="biography-input"  ></textarea>
            <p id="biography-error" class="error-message " style="display:none">There must be at least 5 words.</p>

            </div>

            <div class="server-messages" style="display:none">
            </div>

            <div class="button-option-container">
                <input type="button" class="safe-option" id="send-message-form" value="Send">
            </div>
        </form>
    <?php endif?>

