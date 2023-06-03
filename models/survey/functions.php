<?php

function selectAllSurveys(){
    global $conn;

    $query = 
    "SELECT survey.name as survey,survey.status as status,
    survey.id as survey_id,survey.finished_at as finished_at,
    survey.created_at as created_at,
    choice.name as choice,
    COUNT(survey_user.user_id) as votes 
    FROM survey_user 
    JOIN survey ON survey.id = survey_user.survey_id 
    JOIN choice ON choice.id = survey_user.choice_id 
    GROUP BY survey_user.survey_id, survey_user.choice_id 
    ORDER BY survey.id ASC, choice.id ASC";

    $statement = $conn->prepare($query);
    $statement->execute();

    $result = $statement->fetchAll();

    $activeSurveys = array();
    $deletedSurveys = array();

    foreach ($result as $survey) {
        if ($survey['status'] == 1) {
            $activeSurveys[] = $survey;
        } elseif ($survey['status'] == 0) {
            $deletedSurveys[] = $survey;
        }
    }

    $surveyResults = [];
    foreach($activeSurveys as $survey){
        $surveyName = $survey['survey'];
        $surveyId = $survey['survey_id'];
        $optionName = $survey['choice'];
        $optionValue = $survey['votes'];
        $createdAt = $survey['created_at'];

        if (!isset($surveyResults[$surveyName])) {
            $surveyResults[$surveyName] = array(
                'name' => $surveyName,
                'id' => $surveyId,
                'created_at'=> $createdAt,
                'options' => array(),
            );
        }

        $surveyResults[$surveyName]['options'][$optionName] = $optionValue;
    }

    unset($activeSurveys);
    $activeSurveys = $surveyResults;

    unset($surveyResults);
    $surveyResults = [];

    foreach($deletedSurveys as $survey){
        $surveyName = $survey['survey'];
        $surveyId = $survey['survey_id'];
        $optionName = $survey['choice'];
        $optionValue = $survey['votes'];
        $finishedAt = $survey['finished_at'];

        if (!isset($surveyResults[$surveyName])) {
            $surveyResults[$surveyName] = array(
                'name' => $surveyName,
                'id' => $surveyId,
                'finished_at'=> $finishedAt,
                'options' => array(),
            );
        }

        $surveyResults[$surveyName]['options'][$optionName] = $optionValue;
    }

    unset($deletedSurveys);

    $deletedSurveys = $surveyResults;

    $surveyTable = new stdClass();
    $surveyTable->activeSurveys = $activeSurveys;
    $surveyTable->deletedSurveys = $deletedSurveys;

    return $surveyTable;
}

function deleteSurvey($surveyId){
    global $conn;

    $query = 'UPDATE survey SET status=0, finished_at = NOW() WHERE id = :survey_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':survey_id',$surveyId);
    
    $statement->execute();
}

function activateDeletedSurvey($surveyId){
    global $conn;

    $query = 'UPDATE survey SET status=1 WHERE id = :survey_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':survey_id',$surveyId);
    
    $statement->execute();
}

function insertSurveyWebsiteExperienceData($surveyId,$optionId,$userId){
    global $conn;

    $query = "INSERT INTO survey_user (survey_id, user_id, choice_id) VALUES (:survey_id, :user_id, :choice_id)";

    $statement = $conn->prepare($query);
    $statement->bindParam(':survey_id',$surveyId);
    $statement->bindParam(':user_id',$userId);
    $statement->bindParam(':choice_id',$optionId);

    $statement->execute();
}
?>