<?php
    require_once "models/header/functions.php";
    require_once "models/global/functions.php";

    $role = 'unauthorised';
    if(isset($_SESSION['userRoleName'])){
        $role = $_SESSION['userRoleName'];
        $avatar_src = isset($_SESSION['userAvatarSrc']) ? $_SESSION['userAvatarSrc'] : 'default-avatar.jpg';
    }

    $links = headerLinks($role);
    global $current_page;

    $page = isset($_GET['page']) ? $_GET['page'] : "home";

    recordUserVisit();
?>

<header>
    <div id="header" class="wrapper">
        <a href="index.php?page=home">
            <img src="assets/images/logo.png" alt="logo" />
        </a>
        <ul id="header-navigation">
            <?php foreach($links as $link):?>
                <li><a href="index.php?page=<?=$link['href'] ?>"
                <?php if($page == $link['href'])echo('id="active-link"'); ?>><?=$link['name']?></a></li>
            <?php endforeach?>
        </ul>
        <div id="icons-container">

            <?php if(isset($_SESSION['userId'])){
                echo '
                <div>
                <a href="index.php?page=user-profile">
                    <img src="assets/images/avatars/' . $avatar_src . '" alt="user avatar">
                </a>
                </div>
                ';}
            ?>
        
            <i class="fa-solid fa-moon" id="dark-mode-icon" style="display: none;"></i>
            <i class="fa-solid fa-sun" id="light-mode-icon" style="display: block;"></i>
            <i class="fa-solid fa-bars" id="menu-icon-open"></i>
        </div>
    </div>
</header>


<div class="phone-nav" id="phone-nav-id">
    <ul id="phone-nav-ul">
        <?php foreach($links as $link):?>
            <li><a href="<?=$link['href'] ?>"
            <?php if($page == $link['href'])echo('id="active-link"'); ?>><?=$link['name']?></a></li>
        <?php endforeach?>
    </ul>
    <i id="menu-icon-close" class="fa-solid fa-xmark"></i>
</div>