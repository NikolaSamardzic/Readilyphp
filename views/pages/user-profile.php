<?php
    require_once "models/global/functions.php";
    require_once "models/user/functions.php";

    if(!isset($_SESSION['userRoleName'])){
        http_response_code(401);
        redirect('index.php?page=login');
        exit;
    }

    $userId = $_SESSION['userId'];

    if($_SESSION['userRoleName'] == 'admin'){
        if(isset($_GET['selected-user'])){
            $userId = $_GET['selected-user'];
        }
    }

    try{
        $userInformationObj = getUserInformation($userId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    $userId = $userInformationObj->id;
    $firstName = $userInformationObj->first_name;
    $lastName = $userInformationObj->last_name;
    $username = $userInformationObj->username;
    $email = $userInformationObj->email;
    $phone = $userInformationObj->phone;
    $roleId = $userInformationObj->role_id;
    $roleName = $userInformationObj->role_name;
    $biographyText = $userInformationObj->biography_text;

    $addressLine = isset($userInformationObj->address_line) ? $userInformationObj->address_line : '/';
    $addressNumber =isset($userInformationObj->address_number) ? $userInformationObj->address_number : '/';
    $city =isset($userInformationObj->city) ? $userInformationObj->city : '/';
    $state =isset($userInformationObj->state) ? $userInformationObj->state : '/';
    $zipCode =isset($userInformationObj->zip_code) ? $userInformationObj->zip_code : '/';
    $country =isset($userInformationObj->country) ? $userInformationObj->country : '/';

    $avatarId = isset($userInformationObj->avatar_id) ? $userInformationObj->avatar_id : '/' ;
    $avatarSrc = isset($userInformationObj->avatar_src) ? $userInformationObj->avatar_src : 'default-avatar.jpg' ;

    setUserInformationInCookie();
?>

<title>Profile | Readily</title>
</head>
<body>

<section id="user-profile-section">

    <div id="user-data" class="sign-up-container">
        <h2>Personal info</h2>

        <div id="user-avatar-placeholder-js" class="user-avatar-placeholder">
            <img src="assets/images/avatars/<?=$avatarSrc ?>" alt="user avatar">
        </div>

        <div class="info-container-grid personal-info-container-grid">

            <p  class="input-title first-name-title">Fisrt Name</p>
            <p  class="first-name-input user-information" ><?=$firstName ?></p>
            
            <p class="input-title last-name-title">Last Name</p>
            <p class="last-name-input user-information"><?=$lastName ?></p>
           
            <p class="input-title username-title">Username</p>
            <p class="username-input user-information"><?=$username ?></p>
            
            <p class="input-title email-title">Email</p>
            <p class="email-input user-information"><?=$email ?></p>
            
            <p class="input-title phone-title">Phone</p>
            <p class="phone-input user-information"><?=$phone ?></p>
            
            <p class="input-title role-title">Role</p>
            <p class="role-input user-information"><?=ucfirst($roleName) ?></p>
            
            <p class="input-title biography-title" <?php if(!isset($biographyText)) echo 'style="display:none;"' ?> >Biography</p>
            <p class="user-information biography-input"  <?php if(!isset($biographyText)) echo 'style="display:none;"' ?> ><?=$biographyText ?></p>
            
        </div>

        <h2>Address info</h2>

        <div  class="info-container-grid address-info-container-grid">

            <p  class="input-title address-line-title">Address line</p>
            <p  class="address-line-input user-information" ><?=$addressLine ?></p>
           

            <p  class="input-title number-title">Number</p>
            <p  class="number-input user-information"><?=$addressNumber ?></p>
           

            <p  class="input-title city-title">City</p>
            <p  class="city-input user-information" ><?=$city ?></p>
            

            <p  class="input-title state-title">State</p>
            <p  class="state-input user-information" ><?=$state ?></p>
            

            <p  class="input-title zip-code-title">Zip-code</p>
            <p  class="zip-code-input user-information"><?=$zipCode ?></p>
            

            <p class="input-title country-title">Country</p>
            <p class="user-information country-input" ><?=$country ?></p>
        </div>

        <div class="server-messages success-server-messages">
        </div>

        <div class="button-option-container">
        <input type="button" class="danger-option" id="delete-account-button" value="Delete">
        <input type="button" class="safe-option" id="update-account-button" value="Update">
        </div>
    </div>

    <?php
        $addressLine = isset($userInformationObj->address_line) ? $userInformationObj->address_line : '';
        $addressNumber =isset($userInformationObj->address_number) ? $userInformationObj->address_number : '';
        $city =isset($userInformationObj->city) ? $userInformationObj->city : '';
        $state =isset($userInformationObj->state) ? $userInformationObj->state : '';
        $zipCode =isset($userInformationObj->zip_code) ? $userInformationObj->zip_code : '';
        $country =isset($userInformationObj->country) ? $userInformationObj->country : '';
    ?>

    <form style="display:none;" class="sign-up-container" id="update-user-form" enctype="multipart/form-data" name="signup-form" action="" method="post">
   
    <!-- password stoji tu samo kako bi funkcija koja brise errore radila kako treba -->
    <p id="password-error" style="display: none;"></p>
    <input type="text"  name="role-input" hidden id="role-input" value="<?=$roleId ?>">
    <input type="text" name="user-id" hidden id="user-id" value="<?=$userId ?>">
    <input type="text" name="previous-address" hidden value="<?=$addressLine ?>">
    <input type="text" name="role-name" hidden value="<?=$roleName ?>">
    
    <h2>Personal info</h2>

    <div id="user-avatar-placeholder-js" class="user-avatar-placeholder">
        <img src="assets/images/avatars/<?=$avatarSrc ?>" id="user-avatar-img" alt="user avatar">
    </div>
    <p class="upload-avatar-text">upload avatar</p>

    <input type="file" id="user-avatar-js" name="user-avatar" class="user-avatar"/>
    <p  id="avatar-error"  class="error-message " style="display:none">Please upload an image with a maximum size of 700KB and in one of the following formats: jpg, jpeg, or png for your avatar.</p>

    <div class="info-container-grid personal-info-container-grid">

        <label for="first-name-input-js" class="input-title first-name-title">Fisrt Name</label>
        <input type="text" id="first-name-input-js" class="first-name-input" value="<?=$firstName ?>" name="first-name-input">
        <p id="first-name-error" class="error-message " style="display: none;">Incorrect format (ex. Jhon)</p>

        <label for="last-name-input-js"  class="input-title last-name-title">Last Name</label>
        <input type="text" id="last-name-input-js" class="last-name-input" value="<?=$lastName ?>" name="last-name-input">
        <p id="last-name-error" class="error-message " style="display: none;">Incorrect format (ex. Smith)</p>

        <label for="username-input-js" class="input-title username-title">Username</label>
        <input type="text" id="username-input-js" class="username-input" value="<?=$username ?>" name="username-input">
        <p id="username-error"  class="error-message " style="display: none;">Your username must be at least 5 characters long and can only contain letters, numbers, periods, parentheses, forward slashes, hyphens, and underscores.</p>


        <label for="email-input-js" class="input-title email-title">Email</label>
        <input type="email" id="email-input-js" class="email-input" value="<?=$email ?>"  name="email-input">
        <p id="email-error" class="error-message " style="display: none;">Incorrect format (ex. jhonsmith@gmail.com)</p>

        <label for="phone-input-js" class="input-title phone-title">Phone</label>
        <input type="number" id="phone-input-js" class="phone-input" value="<?=$phone ?>" name="phone-input">
        <p id="phone-error" class="error-message " style="display: none;">Incorrect format (ex. 0611234567)</p>

        <p class="input-title role-title">Role</p>
        <p id="role-input-js"  class="role-input user-information"><?=ucfirst($roleName) ?></p>


        <label for="biography-input-js" id="biography-title-js" class="input-title biography-title" <?php if(!isset($biographyText)) echo 'style="display:none;"'?>>Biography</label>
        <textarea name="biography-input" id="biography-input-js" class="biography-input" <?php if(!isset($biographyText)) echo 'style="display:none;"' ?> ><?=$biographyText ?></textarea>
        <p id="biography-error" class="error-message " style="display: none;">There must be at least 5 words.</p>
    </div>

    <h2>Address info <br /><span>(optional)<span></h2>

    <div  class="info-container-grid address-info-container-grid">

        <label for="address-line-input-js" class="input-title address-line-title">Address line</label>
        <input type="text" id="address-line-input-js" class="address-line-input" value="<?=$addressLine ?>" name="address-line-input">
        <p id="address-line-error" class="error-message " style="display: none;">Please enter a valid address line.</p>

        <label for="number-input-js" class="input-title number-title">Number</label>
        <input type="text" id="number-input-js" class="number-input" value="<?=$addressNumber ?>" name="number-input">
        <p id="number-error" class="error-message " style="display: none;">Please enter a valid address number.</p>

        <label for="city-input-js"  class="input-title city-title">City</label>
        <input type="text" id="city-input-js" class="city-input" value="<?=$city ?>" name="city-input">
        <p id="city-error"  class="error-message " style="display: none;">Incorrect format (ex.  Los Angeles)</p>

        <label for="state-input-js"  class="input-title state-title">State</label>
        <input type="text" id="state-input-js" class="state-input" value="<?=$state ?>" name="state-input">
        <p id="state-error" class="error-message " style="display: none;">Incorrect format (ex.  California)</p>

        <label for="zip-code-input-js"  class="input-title zip-code-title">Zip-code</label>
        <input type="text" id="zip-code-input-js" class="zip-code-input" value="<?=$zipCode ?>" name="zip-code-input">
        <p id="zip-code-error" class="error-message " style="display: none;">Incorrect format (ex.  90001)</p>

        <label for="country-input-js"  class="input-title country-title">Country</label>
        <input type="text" id="country-input-js" class="country-input" value="<?=$country ?>" name="country-input">
        <p id="country-error"  class="error-message " style="display: none;">Incorrect format (ex.  United States)</p>
    </div>

    <div class="server-messages error-server-messages">
    </div>

    <div class="button-option-container">
        <input type="button" class="danger-option" id="cancel-account-button" value="Cancel">
        <input type="button" class="safe-option" id="save-account-button" value="Save">
    </div>

    </form>
</section>
<?php if($roleName=='writer'): ?>
    <div id="writter-option-wrapper">
        <div class="admin-option-container">
            <div class="admin-option">
                <a href="index.php?page=writer-books&writer-id=<?=$userId?>"></a>
                <div class="option-name-container">
                    <p>Books</p>
                </div>
                <div class="option-icon-container">
                    <img src="assets/images/admin/books.svg" alt="database icon" />
                </div>
            </div>
        </div>
    </div>
<?php endif ?>
