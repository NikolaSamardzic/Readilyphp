<?php 
    require_once "models/global/functions.php";
    require_once "models/user/functions.php";

    if(!isset($_SESSION["userRoleName"]) || ($_SESSION["userRoleName"] != "admin")){
        http_response_code(404);
        redirect('index.php?page=404');
        exit;
    }

    $totalVisits;
    $totalVisitsInPercentage;
    $recentVisits;
    $recentVisitsInPercentage;

    userPageCount($totalVisits, $totalVisitsInPercentage, $recentVisits, $recentVisitsInPercentage);

    global $pages;
?>

<title>Admin Visitors | Readily</title>
</head>
<body>

<div class="wrapper server-messages " id="admin-visitors-server-messages">
</div>

<section id="admin-users-section" class="wrapper">
    <h2>Visits</h2>

    <div class="table-container">
        <table id="table-active-users">
            <thead>
                <tr>
                    <th>Page</th>
                    <th>Total visits</th>
                    <th>Totla visits in %</th>
                    <th>Recent visits</th>
                    <th>Recent visits in %</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($pages as $index=>$page): ?>
                    <tr>
                        <td><?=$pages[$index] ?></td>
                        <td><?=$totalVisits[$index] ?></td>
                        <td><?=round((float)$totalVisitsInPercentage[$index],2) ?>%</td>
                        <td><?=$recentVisits[$index] ?></td>
                        <td><?=round((float)$recentVisitsInPercentage[$index],2) ?>%</td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

</section>