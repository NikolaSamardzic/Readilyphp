<?php 
    require_once "models/global/functions.php";
    require_once "models/user/functions.php";

    if(!isset($_SESSION["userRoleName"]) || ($_SESSION["userRoleName"] != "admin")){
        http_response_code(404);
        redirect('index.php?page=404');
        exit;
    }

    $loggedInUsers = getLoggedInUsers();
?>

<title>Admin Logged-in Users | Readily</title>
</head>
<body>

<section id="admin-users-section" class="wrapper">
    <h2>Logged-in Users</h2>

    <div class="table-container">
        <table id="table-active-users">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($loggedInUsers as $user): ?>
                    <tr>
                        <td><?=$user['username'] ?></td>
                        <td><?=$user['email'] ?></td>
                        <td><?=$user['role'] ?></td>
                        <td><?=$user['date'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

</section>