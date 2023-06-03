<?php
    require_once "models/global/functions.php";
    require_once "models/category/functions.php";

    if(!isset($_SESSION["userRoleName"]) || ($_SESSION["userRoleName"] != "admin")){
        http_response_code(404);
        redirect('index.php?page=404');
        exit;
    }

    try{
        $categoriesTable = selectAllCategories();
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
?>

<title>Admin Categories | Readily</title>
</head>
<body>

<section id="admin-categories-section" class="wrapper">

    <form class="insert-update-row-form" id="categories-form" style="display: none;">

        <label style="display: none;" id="select-category-label" for="select-category">Parent Category</label>
        <select style="display:none" name="select-category" id="select-category">
            <?php foreach ($allParentCategories as $category): ?>  
 
                <option value="<?=$category['id'] ?>"><?=$category['name']?></option>

            <?php endforeach; ?>
        </select>

		<label for="category-name" >Name</label>
        <input type="text" name="category-type" id="category-type" value="subcategory" hidden>
		<input type="text" name="category-id" id="category-id" value="0" hidden>
		<input type="text" id="category-name" name="category-name">

		<p id="category-name-error" class="error-message"  style="display: none;">Incorrect format</p>
		<div class="button-option-container">
			<input type="button" class="danger-option" id="cancel-button" value="Cancel">
			<input type="button" class="safe-option" id="save-button" value="Save">
		</div>
	</form>

	<div class="server-messages" style="display:none"></div>

    <h2>Active Categories</h2>


    <div class="table-container">
        <table id="table-active-categories">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Parent Category</th>
                    <th>Book Count</th>
                    <th>Created At</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($categoriesTable->activeCategories as $category): ?>
                    <tr>
                        <td><?php echo $category['name']; ?></td>
                        <td><?= empty($category['parent']) ? "/" :$category['parent'] ?></td>
                        <td><?=$category['book_count'] ?></td>
                        <td><?php echo $category['created_at']; ?></td>
                        <td><a data-category-parent-id="<?=$category['category_id']?>" data-category-id="<?=$category['id']?>" data-category-type="<?= empty($category['parent']) ? 'category' : 'subcategory' ?>" data-category-name="<?=$category['name']?>" class="safe-option change-links" href="#">Change</a></td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$category['id'] ?>" hidden name="category-id">
                                <input class="danger-option delete-category" type="button" value="Delete">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>

    <div class="add-button-container add-buttons-container" >
        <input class="safe-option" id="add-subcategory-button" type="button" value="Add Subcategory">
		<input class="safe-option" id="add-category-button" type="button" value="Add Category">
	</div>



    <h2>Deleted Publishers</h2>

    <div class="table-container">
        <table id="table-deleted-categories">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Parent Category</th>
                    <th>Book Count</th>
                    <th>Deleted At</th>
                    <th>Update</th>
                    <th>Activate</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($categoriesTable->deletedCategories as $category): ?>
                    <tr>
                        <td><?php echo $category['name']; ?></td>
                        <td><?= empty($category['parent']) ? "/" :$category['parent'] ?></td>
                        <td>3</td>
                        <td><?php echo $category['deleted_at']; ?></td>
                        <td><a data-category-parent-id="<?=$category['category_id']?>" data-category-id="<?=$category['id']?>" data-category-name="<?=$category['name']?>" data-category-type="<?= empty($category['parent']) ? 'category' : 'subcategory' ?>" class="safe-option change-links" href="#">Change</a></td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$category['id'] ?>" hidden name="category-id">
                                <input class="safe-option activate-category" type="button" value="Activate">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>
</section>