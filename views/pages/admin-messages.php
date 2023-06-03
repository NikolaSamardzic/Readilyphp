<?php
    require_once "models/global/functions.php";
    require_once "models/message/functions.php";

    if(!isset($_SESSION["userRoleName"]) || ($_SESSION["userRoleName"] != "admin")){
        http_response_code(404);
        redirect('index.php?page=404');
        exit;
    }

    try{
        $userMessages = getUserMessages();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }
?>

<title>Admin Messages | Readily</title>
</head>
<body>

<section id="admin-messages-section" class="wrapper">

    <h2>User Messages</h2>

    <div class="table-container">
        <table id="table-active-publishers">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Created At</th>
                    <th>Subject</th>
                    <th>Text</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($userMessages as $message): ?>
                    <tr>
                        <td><?=$message['username']; ?></td>
                        <td><?=$message['email'] ?></td>
                        <td><?=$message['date']; ?></td>
                        <td><?=$message['subject'] ?></td>
                        <td  class="td-text"><?=$message['text'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>

</section>