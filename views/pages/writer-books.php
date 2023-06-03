<?php
    require_once "config/connection.php";
    require_once "models/global/functions.php";
    require_once "models/writer/functions.php";

    if(!isset($_SESSION["userRoleName"]) || (($_SESSION["userRoleName"] != "admin") && $_SESSION["userRoleName"] != "writer") ){
        http_response_code(401);
        redirect("index.php?page=login");
        exit;
    }

    $writerId = $_GET['writer-id'];

    try{
        $booksTable = selectAllWriterBooksForTable($writerId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }
?>

<title>Writer Books | Readily</title>
</head>
<body>

<section id="writer-books-section" class="wrapper">
	
    <h2>Active Books</h2>

    <div class="table-container">
        <table id="table-active-books">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Release Date</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($booksTable->activeBooks as $book): ?>
                    <tr>
                        <td class="td-image"><img src="assets/images/books/small/<?=$book['src'] ?>" alt="<?=$book['alt'] ?>"></td>
                        <td><?=$book['name']?></td>
                        <td>$<?=$book['price']?>.00</td>
                        <td><?=$book['release_date']?></td>
                        <td><a class="safe-option change-links" href="index.php?page=update-book&book-id=<?=$book['id'] ?>">Change</a></td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$book['id'] ?>" hidden name="book-id">
                                <input type="text" value="<?=$book['writer_id'] ?>" hidden name="writer-id">
                                <input class="danger-option delete-book" type="button" value="Delete">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>
	<div class="add-button-container add-buttons-container" >
        <a class="safe-option" href="index.php?page=insert-book&writer-id=<?=$writerId?>">Add Book</a>
	</div>

	<h2>Deleted Books</h2>

	<div class="table-container">
        <table id="table-deleted-books">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Deleted At</th>
                    <th>Update</th>
                    <th>Activate</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($booksTable->deletedBooks as $book): ?>
                    <tr>
                        <td class="td-image"><img src="assets/images/books/small/<?=$book['src'] ?>" alt="<?=$book['alt'] ?>"></td>
                        <td><?=$book['name']?></td>
                        <td>$<?=$book['price']?>.00</td>
                        <td><?=$book['release_date']?></td>
                        <td><a class="safe-option change-links" href="index.php?page=update-book&book-id=<?=$book['id'] ?>">Change</a></td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$book['id'] ?>" hidden name="book-id">
                                <input type="text" value="<?=$book['writer_id'] ?>" hidden name="writer-id">
                                <input class="safe-option activate-book" type="button" value="Activate">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>
</section>