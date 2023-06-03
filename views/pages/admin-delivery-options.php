<?php
    require_once "models/global/functions.php";
    require_once "models/delivery/functions.php";

    if(!isset($_SESSION["userRoleName"]) || ($_SESSION["userRoleName"] != "admin")){
        http_response_code(404);
        redirect('index.php?page=404');
        exit;
    }

    try{
        $deliveryTypeTable = selectAllDeliveryTypes();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }
?>



<title>Admin Delivery Types | Readily</title>
</head>
<body>

<section id="admin-publishers-section" class="wrapper">
	

	<form class="insert-update-row-form" id="delivery-type-form" style="display: none;">
		<label for="delivery-type-name" >Name</label>
		<input type="text" name="delivery-type-id" id="delivery-type-id" value="0" hidden>
		<input type="text" id="delivery-type-name" name="delivery-type-name">
		<p id="delivery-type-name-error" class="error-message"  style="display: none;">Incorrect format</p>
		<div class="button-option-container">
			<input type="button" class="danger-option" id="cancel-button" value="Cancel">
			<input type="button" class="safe-option" id="save-button" value="Save">
		</div>
	</form>

	<div class="server-messages" style="display:none"></div>

    <h2>Active Delivery Types</h2>


    <div class="table-container">
        <table id="table-active-delivery-types">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Orders Count</th>
                    <th>Created At</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($deliveryTypeTable->activeDeliveryTypes as $deliveryType): ?>
                    <tr>
                        <td><?php echo $deliveryType['name']; ?></td>
                        <td><?php echo $deliveryType['order_count']; ?></td>
                        <td><?php echo $deliveryType['created_at']; ?></td>
                        <td><a data-delivery-type-id="<?=$deliveryType['id']?>" data-delivery-type-name="<?=$deliveryType['name']?>" class="safe-option change-links" href="#">Change</a></td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$deliveryType['id'] ?>" hidden name="delivery-type-id">
                                <input class="danger-option delete-delivery-type" type="button" value="Delete">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>
				
	<div class="add-button-container add-buttons-container" >
		<input class="safe-option" id="add-delivery-type-button" type="button" value="Add Delivery Type">
	</div>

	<h2>Deleted Delivery Types</h2>

	<div class="table-container">
        <table id="table-deleted-delivery-types">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Orders Count</th>
                    <th>Deleted At</th>
                    <th>Update</th>
                    <th>Activate</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($deliveryTypeTable->deletedDeliveryTypes as $deliveryType): ?>
                    <tr>
                        <td><?php echo $deliveryType['name']; ?></td>
                        <td><?php echo $deliveryType['order_count']; ?></td>
                        <td><?php echo $deliveryType['deleted_at']; ?></td>
                        <td><a data-delivery-type-id="<?=$deliveryType['id']?>" data-delivery-type-name="<?=$deliveryType['name']?>" class="safe-option change-links" href="#">Change</a></td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$deliveryType['id'] ?>" hidden name="delivery-type-id">
                                <input class="safe-option activate-delivery-type" type="button" value="Activate">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>
</section>