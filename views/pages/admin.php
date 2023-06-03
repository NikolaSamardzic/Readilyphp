<?php
    require_once "models/global/functions.php";

    if(!isset($_SESSION["userRoleName"]) || ($_SESSION["userRoleName"] != "admin")){
        http_response_code(404);
        redirect('index.php?page=404');
        exit;
    }
?>

<title>Admin | Readily</title>
</head>
<body>

<section id="admin-section" class="wrapper">

    <h2 class="admin-option-title">Tables</h2>
    <div class="admin-option-container">
        <div class="admin-option">
            <a href="index.php?page=admin-users"></a>
            <div class="option-name-container">
                <p>Users</p>
            </div>
            <div class="option-icon-container">
                <img src="assets/images/admin/database.svg" alt="database icon" />
            </div>
        </div>
        <div class="admin-option">
            <a href="index.php?page=admin-categories"></a>
            <div class="option-name-container">
                <p>Categories</p>
            </div>
            <div class="option-icon-container">
                <img src="assets/images/admin/database.svg" alt="database icon" />
            </div>
        </div>
        <div class="admin-option">
        <a href="index.php?page=admin-publishers"></a>
            <div class="option-name-container">
                <p>Publishers</p>
            </div>
            <div class="option-icon-container">
                <img src="assets/images/admin/database.svg" alt="database icon" />
            </div>
        </div>
        <div class="admin-option">
            <a href="index.php?page=admin-delivery-options"></a>
            <div class="option-name-container">
                <p>Delivery Options</p>
            </div>
            <div class="option-icon-container">
                <img src="assets/images/admin/database.svg" alt="database icon" />
            </div>
        </div>
    </div>

    <h2 class="admin-option-title">Surveys</h2>
    <div class="admin-option-container">

        <div class="admin-option">
        <a href="index.php?page=admin-survey"></a>
            <div class="option-name-container">
                <p>Survey Result</p>
            </div>
            <div class="option-icon-container">
                <img src="assets/images/admin/survey.svg" alt="survey icon" />
            </div>
        </div>
    </div>


    <h2 class="admin-option-title">Messages</h2>
    <div class="admin-option-container">

    <div class="admin-option">
            <a href="index.php?page=admin-messages"></a>
            <div class="option-name-container">
                <p>User Messages</p>
            </div>
        <div class="option-icon-container">
            <img src="assets/images/admin/message.svg" alt="message icon" />
        </div>
    </div>
    </div>


    <h2 class="admin-option-title">Statistics</h2>
    <div class="admin-option-container">
    <div class="admin-option">
            <a href="index.php?page=admin-orders"></a>
            <div class="option-name-container">
                <p>Orders</p>
            </div>
        <div class="option-icon-container">
            <img src="assets/images/admin/stats.svg" alt="stats icon" />
        </div>
    </div>

    <div class="admin-option">
            <a href="index.php?page=admin-visitors"></a>
            <div class="option-name-container">
                <p>Visitors</p>
            </div>
        <div class="option-icon-container">
            <img src="assets/images/admin/stats.svg" alt="stats icon" />
        </div>
    </div>

    <div class="admin-option">
            <a href="index.php?page=admin-logged-id-users"></a>
            <div class="option-name-container">
                <p>Logged-in Users</p>
            </div>
        <div class="option-icon-container">
            <img src="assets/images/admin/stats.svg" alt="stats icon" />
        </div>
    </div>

    </div>
</section>