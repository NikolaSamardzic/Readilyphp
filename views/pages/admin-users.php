<?php
    require_once "models/global/functions.php";
    require_once "models/user/functions.php";

    if(!isset($_SESSION["userRoleName"]) || ($_SESSION["userRoleName"] != "admin")){
        http_response_code(404);
        redirect('index.php?page=404');
        exit;
    }

    try{
        $userTable = selectAllUsers();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }
?>

<title>Admin Users | Readily</title>
</head>
<body>

<div class="wrapper server-messages " id="admin-users-server-messages">
</div>

<section id="admin-users-section" class="wrapper">
    <h2>Active Users</h2>

    <div class="table-container">
        <table id="table-active-users">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Created At</th>
                    <th>Update</th>
                    <th>Ban</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($userTable->activeUsers as $user): ?>
                    <tr>
                        <td><?php echo $user['username']; ?></td>
                        <td><?php echo $user['email']; ?></td>
                        <td><?php echo $user['name']; ?></td>
                        <td><?php echo $user['created_at']; ?></td>
                        <td><a class="safe-option" href="index.php?page=user-profile&selected-user=<?=$user['id']?>">Change</a></td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$user['id'] ?>" hidden name="userId">
                                <input  class="danger-option ban-user" type="button" value="Ban">
                            </form>
                        </td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$user['id'] ?>" hidden name="userId">
                                <input class="danger-option delete-user" type="button" value="Delete">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
                    
    <h2>Deleted Users</h2>
    <div class="table-container">
        <table id="table-deleted-users">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Created At</th>
                    <th>Deleted At</th>
                    <th>Update</th>
                    <th>Activate</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($userTable->deletedUsers as $user): ?>
                    <tr>
                        <td><?php echo $user['username']; ?></td>
                        <td><?php echo $user['email']; ?></td>
                        <td><?php echo $user['name']; ?></td>
                        <td><?php echo $user['created_at']; ?></td>
                        <td><?php echo $user['deleted_at']; ?></td>
                        <td><a class="safe-option" href="index.php?page=user-profile&selected-user=<?=$user['id']?>">Change</a></td>

                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$user['id'] ?>" hidden name="userId">
                                <input class="safe-option activate-user" type="button" value="Activate">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <h2>Banned Users</h2>
    <div class="table-container">
        <table id="table-banned-users">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Created At</th>
                    <th>Banned At</th>
                    <th>Update</th>
                    <th>Unban</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($userTable->bannedUsers as $user): ?>
                    <tr>
                        <td><?php echo $user['username']; ?></td>
                        <td><?php echo $user['email']; ?></td>
                        <td><?php echo $user['name']; ?></td>
                        <td><?php echo $user['created_at']; ?></td>
                        <td><?php echo $user['banned_at']; ?></td>
                        <td><a class="safe-option" href="index.php?page=user-profile&selected-user=<?=$user['id']?>">Change</a></td>
                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$user['id'] ?>" hidden name="userId">
                                <input class="safe-option unban-user" type="button" value="Unban">
                            </form>
                        </td>

                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</section>
