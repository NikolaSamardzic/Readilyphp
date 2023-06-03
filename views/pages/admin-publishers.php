<?php
    require_once "models/global/functions.php";
    require_once "models/publisher/functions.php";

    if(!isset($_SESSION["userRoleName"]) || ($_SESSION["userRoleName"] != "admin")){
        http_response_code(404);
        redirect('index.php?page=404');
        exit;
    }

    try{
        $publisherTable = selectAllPublishers();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }
?>

<title>Admin Publishers | Readily</title>
</head>
<body>

<section id="admin-publishers-section" class="wrapper">
	
	<form class="insert-update-row-form" id="publisher-form" style="display: none;">
		<label for="publisher-name" >Name</label>
		<input type="text" name="publisher-id" id="publisher-id" value="0" hidden>
		<input type="text" id="publisher-name" name="publisher-name">
		<p id="publisher-name-error" class="error-message"  style="display: none;">Incorrect format</p>
		<div class="button-option-container">
			<input type="button" class="danger-option" id="cancel-button" value="Cancel">
			<input type="button" class="safe-option" id="save-button" value="Save">
		</div>
	</form>

	<div class="server-messages" style="display:none"></div>

    <h2>Active Publishers</h2>


    <div class="table-container">
        <table id="table-active-publishers">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Book Count</th>
                    <th>Created At</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($publisherTable->activePublishers as $publisher): ?>
                    <tr>
                        <td><?php echo $publisher['name']; ?></td>
                        <td><?=$publisher['book_count'] ?></td>
                        <td><?php echo $publisher['created_at']; ?></td>
                        <td><a data-publisher-id="<?=$publisher['id']?>" data-publisher-name="<?=$publisher['name']?>" class="safe-option change-links" href="#">Change</a></td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$publisher['id'] ?>" hidden name="publisher-id">
                                <input class="danger-option delete-publisher" type="button" value="Delete">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>
				
	<div class="add-button-container add-buttons-container" >
		<input class="safe-option" id="add-publisher-button" type="button" value="Add Publisher">
	</div>

	<h2>Deleted Publishers</h2>

	<div class="table-container">
        <table id="table-deleted-publishers">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Book Count</th>
                    <th>Deleted At</th>
                    <th>Update</th>
                    <th>Activate</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($publisherTable->deletedPublishers as $publisher): ?>
                    <tr>
                        <td><?php echo $publisher['name']; ?></td>
                        <td><?=$publisher['book_count'] ?></td>
                        <td><?php echo $publisher['deleted_at']; ?></td>
                        <td><a data-publisher-id="<?=$publisher['id']?>" data-publisher-name="<?=$publisher['name']?>" class="safe-option change-links" href="#">Change</a></td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$publisher['id'] ?>" hidden name="publisher-id">
                                <input class="safe-option activate-publisher" type="button" value="Activate">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>
</section>