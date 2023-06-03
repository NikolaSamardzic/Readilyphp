<?php
    require_once "models/category/functions.php";

    try{
        $allCategories = selectAllActiveCategories(null);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    $categoryId = 0;

    if(isset($_GET['category-id'])){
        $categoryId = $_GET['category-id'];
    }
?>

<title>Shop | Readily</title>
</head>
<body>

<section id="section-container" class="wrapper">

    <form id="filter-sort-section">
        <div id="input-search-container">
            <input type="text" placeholder="Search" name="input-search" id="input-search">
            <i class="fa-solid fa-magnifying-glass"></i>
        </div>

        <h3 id="heading-price">Price</h3>
        <div id="price-container">
            <input type="number" min="0" placeholder="Min" id="price-min" name="price-min">
            <input type="number" min="0" placeholder="Max" id="price-max" name="price-max">
        </div>

        <h3 id="heading-categories">Categories</h3>
        <ul class="book-category-input" id="book-category-input-js  categories-option">
            <?php foreach($allCategories as $category): ?>
                <li class="category-parent"><p><i class="fa-solid fa-angle-down"></i><?=$category['name']?></p>
                    <?=displayCategoriesMenu($category['id'],$categoryId)?>
                </li>
            <?php endforeach ?>
        </ul>
        
        <h3 id="heading-sort">Sort</h3>
        <select name="sort" id="sort">
            <option class="option-tag" value="popular">Most Popular</option>
            <option class="option-tag" value="newest">Newest</option>
            <option class="option-tag" value="price-asc">Price Asc</option>
            <option class="option-tag" value="price-desc">Price Desc</option>
            <option class="option-tag" value="name-asc">Name A-Z</option>
            <option class="option-tag" value="name-desc">Name Z-A</option>
        </select>

    </form>
    
    <section id="section-articles">
        <ul id="articles-container-ul">

        </ul>

        <nav class="pagination-container" aria-label="Page navigation">
            <ul class="pagination" id="pagination-ul">
            </ul>
        </nav>

        <div class="server-messages">
        </div>
    </section>


</section>

