<?php
    require_once "models/global/functions.php";
    require_once "models/order/functions.php";

    if(!isset($_SESSION["userRoleName"]) || ($_SESSION["userRoleName"] != "admin")){
        http_response_code(404);
        redirect('index.php?page=404');
        exit;
    }

    try{
        $userOrders = getUserOrders();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }
?>

<title>Admin Orders | Readily</title>
</head>
<body>

<section id="admin-messages-section" class="wrapper">

    <h2>User Orders</h2>

    <div class="table-container">
        <table id="table-active-publishers">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Finished At</th>
                    <th>Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($userOrders as $order): ?>
                    <tr>
                        <td><?=$order['username']; ?></td>
                        <td><?=$order['email'] ?></td>
                        <td><?=$order['finished_at']; ?></td>
                        <td>$ <?=$order['total_price'] ?>.00</td>
                        <td><?=$order['name'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>

</section>