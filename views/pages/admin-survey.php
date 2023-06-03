<?php
    require_once "models/global/functions.php";
    require_once "models/survey/functions.php";

    if(!isset($_SESSION["userRoleName"]) || ($_SESSION["userRoleName"] != "admin")){
        http_response_code(404);
        redirect('index.php?page=404');
        exit;
    }

    try{
        $surveyTable = selectAllSurveys();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }
?>

<title>Admin Survey | Readily</title>
</head>
<body>

<section id="admin-survey-section" class="wrapper">

    <h2>Active Surveys</h2>

    <div class="table-container">
        <table id="table-active-surveys">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Created At</th>
                    <th class="survey-table-options">Option 1</th>
                    <th class="survey-table-options">Option 2</th>
                    <th class="survey-table-options">Option 3</th>
                    <th class="survey-table-options">Option 4</th>
                    <th class="survey-table-options">Option 5</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($surveyTable->activeSurveys as $survey): ?>
                    <tr>
                        <td><?php echo $survey['name']; ?></td>
                        <td><?=$survey['created_at'] ?></td>

                        <?php foreach($survey['options'] as $optionName => $optionValue): ?>
                            <td class="survey-table-options">
                                <p><?=$optionName ?></p>
                                <p><?=$optionValue ?></p>
                            </td>
                        <?php endforeach ?>

                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$survey['id'] ?>" hidden name="survey-id">
                                <input class="danger-option delete-survey" type="button" value="Delete">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>


    <h2>Finished Surveys</h2>

    <div class="table-container">
        <table id="table-deleted-surveys">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Finished At</th>
                    <th class="survey-table-options">Option 1</th>
                    <th class="survey-table-options">Option 2</th>
                    <th class="survey-table-options">Option 3</th>
                    <th class="survey-table-options">Option 4</th>
                    <th class="survey-table-options">Option 5</th>
                    <th>Activate</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($surveyTable->deletedSurveys as $survey): ?>
                    <tr>
                        <td><?php echo $survey['name']; ?></td>
                        <td><?=$survey['finished_at'] ?></td>

                        <?php foreach($survey['options'] as $optionName => $optionValue): ?>
                            <td class="survey-table-options">
                                <p><?=$optionName ?></p>
                                <p><?=$optionValue ?></p>
                            </td>
                        <?php endforeach ?>

                        <td>
                            <form method="post" name="delivery-form" >
                                <input type="text" value="<?=$survey['id'] ?>" hidden name="survey-id">
                                <input class="safe-option activate-survey" type="button" value="Activate">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>	
    </div>
</section>