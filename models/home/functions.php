<?php 

function getSurvey($name,$userId){
    global $conn;

    $query = 
    "SELECT choice.id, choice.name as choice, survey.survey_text as name, choice.src as src, survey.id AS survey_id
    FROM survey 
    JOIN choice_survey ON choice_survey.survey_id = survey.id
    JOIN choice ON choice.id = choice_survey.choice_id
    WHERE survey.name = :name AND survey.status = 1 AND :user_id NOT IN (
        SELECT user_id
        FROM survey_user
        JOIN survey ON survey.id = survey_user.survey_id
        WHERE survey.name = :survey_name
    )";

    $statement = $conn->prepare($query);
    $statement->bindParam(':name',$name);
    $statement->bindParam(':user_id',$userId);
    $statement->bindParam(':survey_name',$name);

    $statement->execute();

    $result = $statement->fetchAll();

    return $result;
}
?>