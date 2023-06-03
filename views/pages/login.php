<?php
    require_once "models/global/functions.php";

    if(isset($_SESSION['userRoleName'])){
        http_response_code(403);
        redirect('index.php?page=home');
        exit;
    }
?>

<title>Log in | Readily</title>
</head>
<body >

<section id="log-in-section">
    <form name="login-form" id="login-form" action="" method="post">

        <h2>LOG IN</h2>

        <div id="log-in-container">
            <label for="username-input-js" id="username-title" class="input-title">Username</label>
            <input type="text" name="username-input" id="username-input-js" >
            <p id="username-error" class="error-message" style="display: none;">Incorrect format</p>

            <label for="password-input-js" id="password-title"  class="input-title">Password</label>
            <input type="password" name="password-input" id="password-input-js">
            <p id="password-error" class="error-message" style="display: none;">Incorrect format</p>

        </div>

        <div class="server-messages"></div>

        <input type="button" value="Log In" id="log-in-button">

    </form>
</section>

