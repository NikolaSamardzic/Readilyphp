<?php

function selectAllUsers(){

    global $conn;

    $query = 'SELECT user.id AS id, user.username AS username, user.email AS email, user.created_at AS created_at,
    user.deleted_at AS deleted_at, user.banned_at AS banned_at, user.is_active AS is_active, user.is_banned AS is_banned,
    role.name AS name
    FROM user JOIN role ON role.id = user.role_id';
    $statement = $conn->prepare($query);

    $statement->execute();

    $allUsers = $statement->fetchAll();

    $activeUsers = array();
    $deletedUsers = array();
    $bannedUsers = array();

    foreach ($allUsers as $user) {
        if ($user['is_active'] == 1) {
            $activeUsers[] = $user;
        } elseif ($user['is_active'] == 0 && $user['is_banned'] == 0) {
            $deletedUsers[] = $user;
        } elseif ($user['is_banned'] == 1) {
            $bannedUsers[] = $user;
        }
    }

    $userTable = new stdClass();
    $userTable->activeUsers = $activeUsers;
    $userTable->deletedUsers = $deletedUsers;
    $userTable->bannedUsers = $bannedUsers;

    return $userTable;
}


function getUserInformation($userId){
    global $conn;

    $query = 
    'SELECT user.id AS id, user.first_name AS first_name, user.last_name AS last_name, user.username AS username,
    user.email AS email, user.phone AS phone,avatar.id AS avatar_id, avatar.src AS avatar_src,role.id AS role_id, role.name AS role_name,
    biography.biography_text AS biography_text, address.address_line AS address_line,
    address.address_number AS address_number, address.city AS city, address.state AS state,
    address.zip_code AS zip_code, address.country AS country
    FROM user JOIN role ON user.role_id = role.id LEFT JOIN avatar ON avatar.user_id = user.id
    LEFT JOIN biography ON user.id = biography.user_id LEFT JOIN address ON address.id = user.address_id
    WHERE user.id = :user_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':user_id',$userId);
    $statement->execute();

    $result = $statement->fetch(PDO::FETCH_OBJ);

    return $result;
}

function setUserInformationInCookie(){
    global $avatarId;
    global $avatarSrc;

    global $userId;
    global $firstName;
    global $lastName;
    global $username;
    global $email;
    global $phone;
    global $roleId;
    global $roleName;
    global $biographyText;

    global $addressLine;
    global $addressNumber;
    global $city;
    global $state;
    global $zipCode;
    global $country;

    setcookie("avatarId", $avatarId);
    setcookie("avatarSrc", $avatarSrc);

    setcookie("userId", $userId);
    setcookie("firstName", $firstName);
    setcookie("lastName", $lastName);
    setcookie("username", $username);
    setcookie("email", $email);
    setcookie("phone", $phone);
    setcookie("roleId", $roleId);

    if($roleName == 'writer'){
        setcookie("biographyText", $biographyText);
    }


    setcookie("addressLine", $addressLine);
    setcookie("addressNumber", $addressNumber);
    setcookie("city", $city);
    setcookie("state", $state);
    setcookie("zipCode", $zipCode);
    setcookie("country", $country);

}

function deleteUser($userId){
    global $conn;

    $query = 'UPDATE user SET is_active = 0, deleted_at = NOW() WHERE id = :user_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':user_id',$userId);

    $statement->execute();
}

function activateDeletedUser($userId){
    global $conn;

    $query = 'UPDATE user SET is_active = 1 WHERE id = :user_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':user_id',$userId);

    $statement->execute();
}

function unbanUser($userId){
    global $conn;

    $query = 'UPDATE user SET is_banned = 0,is_active=1, banned_at = NOW() WHERE id = :user_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':user_id',$userId);

    $statement->execute();
}

function banUser($userId){
    global $conn;

    $query = 'UPDATE user SET is_banned = 1,is_active=0, banned_at = NOW() WHERE id = :user_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':user_id',$userId);

    $statement->execute();
}

function checkAvatar($size,$type,&$errorMessagesArray){
    $allowedTypes = array('jpg', 'jpeg', 'png');

    if(!in_array($type, $allowedTypes)) {
        $errorMessagesArray[] = 'File type not allowed. Only JPG, JPEG, and PNG files are allowed.';
        return;
    }

    if($size > 700 * 1024) {
        $errorMessagesArray[] = 'File size exceeds 700KB limit.';
        return;
    }
}

function doesAvatarAlreadyExists($userId){
    global $conn;

    $query = 'SELECT id, src FROM avatar WHERE user_id = :user_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':user_id',$userId);
    $statement->execute();

    return $statement->fetch(PDO::FETCH_OBJ);
}

function doesAddressAlreadyExists($addressLine,$addressNumber,$city,$state,$zipCode,$country){
    global $conn;

    $query = 'SELECT id FROM address WHERE address_line = :address_line AND address_number = :address_number 
    AND city = :city AND state = :state AND zip_code = :zip_code AND country = :country';
    $statement = $conn->prepare($query);

    $statement->bindParam(":address_line",$addressLine);
    $statement->bindParam(":address_number",$addressNumber);
    $statement->bindParam(":city",$city);
    $statement->bindParam(":state",$state);
    $statement->bindParam(":zip_code",$zipCode);
    $statement->bindParam(":country",$country);

    $statement->execute();
    $result = $statement->fetch(PDO::FETCH_OBJ);

    return $result;
}

function insertNewAddress($addressLine,$addressNumber,$city,$state,$zipCode,$country){
    global $conn;

    $query = 'INSERT INTO address (address_line, address_number, city, state, zip_code, country) VALUES (:address_line, :address_number, :city, :state, :zip_code, :country)';
    $statement = $conn->prepare($query);

    $statement->bindParam(':address_line', $addressLine);
    $statement->bindParam(':address_number', $addressNumber);
    $statement->bindParam(':city', $city);
    $statement->bindParam(':state', $state);
    $statement->bindParam(':zip_code', $zipCode);
    $statement->bindParam(':country', $country);

    $statement->execute();

    return $conn->lastInsertId();;
}

function updateAvatarRowName($avatarId,$avatarType){
    global $conn;

    $src = $avatarId . '.' . $avatarType;

    $query = 'UPDATE avatar SET src = :src WHERE id = :avatar_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(":src",$src);
    $statement->bindParam(":avatar_id",$avatarId);
    $statement->execute();
}

function insertNewBiography($biography,$userId){
    global $conn;

    $query = 'INSERT INTO biography (biography_text, user_id) VALUES (:biography, :user_id)';
    $statement = $conn->prepare($query);

    $statement->bindParam(':biography', $biography);
    $statement->bindParam(':user_id', $userId);

    $statement->execute();
}

function insertNewAvatarRow($userId){
    global $conn;

    $query = "INSERT INTO avatar (src,user_id) VALUES (null,:user_id)";
    $statement = $conn->prepare($query);

    $statement->bindParam(":user_id",$userId);
    $statement->execute();

    $lastInsertId = $conn->lastInsertId();

    return $lastInsertId;
}

function updateUserInformation($userId,$firstName,$lastName,$username,$email,$phone,$addressId){
    global $conn;

    $query = 'UPDATE user SET first_name = :first_name, last_name = :last_name, username = :username,
    email = :email, phone = :phone, address_id = :address_id WHERE id = :user_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':first_name',$firstName);
    $statement->bindParam(':last_name',$lastName);
    $statement->bindParam(':username',$username);
    $statement->bindParam(':email',$email);
    $statement->bindParam(':phone',$phone);
    $statement->bindParam(':address_id',$addressId);
    $statement->bindParam(':user_id',$userId);

    $statement->execute();
}

function updateUserBiography($userId,$biographyText){
    global $conn;

    $query = 'UPDATE biography SET biography_text = :biography_text WHERE user_id = :user_id';
    $statement = $conn->prepare($query);

    $statement->bindParam(':biography_text',$biographyText);
    $statement->bindParam(':user_id',$userId);

    $statement->execute();
}

function insertUsersPreferedCategories($preferedCategories,$userId){
    global $conn;

    for($i=0;$i<count($preferedCategories);$i++){
        $query = "INSERT INTO prefered_categories (user_id, category_id) VALUES (:user_id,:category_id)";
        $statement = $conn->prepare($query);

        $statement->bindParam(':user_id',$userId);
        $statement->bindParam(':category_id',$preferedCategories[$i]);

        $statement->execute();
    }
}

function userPageCount(&$totalVisits, &$totalVisitsInPercentage, &$recentVisits, &$recentVisitsInPercentage){
    global $pages;
    $currentTimestamp = time();

    $file = file(LOG_FILE);

    $length = count($pages);

    $totalVisits = array_fill(0, $length, 0);
    $totalVisitsInPercentage = array_fill(0, $length, 0);
    $recentVisits = array_fill(0, $length, 0);
    $recentVisitsInPercentage = array_fill(0, $length, 0);

    $totalVisitsSum = 0;
    $recentVisitsSum = 0;

    foreach($file as $row){
        list($pageName,$date,$ipAddress) = explode("\t",$row);

        $pageName = trim($pageName);
        $date = trim($date);
        $ipAddress = trim($ipAddress);

        $index = array_search($pageName, $pages);

        $totalVisits[$index]++;
        $totalVisitsSum++;

        $dateTimestamp = strtotime($date);
        $difference = $currentTimestamp - $dateTimestamp;

        if($difference <= 86400){
            $recentVisits[$index]++;
            $recentVisitsSum++;
        }
    }

    $onePercentTotalVisits = $totalVisitsSum/100;
    $onePercentRecentVisits = $recentVisitsSum/100;
    foreach($pages as $index=>$page){
        $totalVisitsInPercentage[$index] = $totalVisits[$index]/$onePercentTotalVisits;
        $recentVisitsInPercentage[$index] = $recentVisits[$index]/$onePercentRecentVisits;
    }
}

function getLoggedInUsers(){
    $file = file(LOGGED_ID_RECORD);

    $currentTimestamp = time();

    $users = [];

    foreach($file as $index=>$row){
        list($username, $email, $role, $date) = explode("\t",$row);
        $username = trim($username);
        $email = trim($email);
        $role = trim($role);

        $dateTimestamp = strtotime($date);
        $difference = $currentTimestamp - $dateTimestamp;

        if($difference <= 86400){
            $user['username'] = $username;
            $user['email'] = $email;
            $user['role'] = $role;
            $user['date'] =  $date;

            $users[] = $user;
        }
    }

    return $users;
}
?>