<?php
    require_once "models/footer/functions.php";

    $role = 'unauthorised';
    if(isset($_SESSION['userRoleName'])){
        $role = $_SESSION['userRoleName'];
    }

    $allLinks = allLinks($role);
?>

<footer>
    <div id="footer" class="wrapper">

        <ul id="docements-links">
            <?php foreach($allLinks->documentsLinks as $link):?>
                <li><a href="<?=$link['href'] ?>"
                target="<?=$link['target'] ?>"><?=$link['name']?></a></li>
            <?php endforeach?>
        </ul>

        <ul id="social-media-links">
            <?php foreach($allLinks->socialMediaLinks as $link):?>
                <li><a href="<?=$link['href'] ?>"
                target="_blank"><?=$link['name']?></a></li>
            <?php endforeach?>
        </ul>

        <ul id="pages-links">
            <?php foreach($allLinks->pageLinks as $link):?>
                <li><a href="index.php?page=<?=$link['href'] ?>"><?=$link['name']?></a></li>
            <?php endforeach?>
        </ul>
    </div>
</footer>

<script  src="assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
</body>