<?php
    require_once "models/global/functions.php";

    if(isset($_SESSION['userRoleName'])){
        http_response_code(403);
        redirect("index.php?page=home");
        exit;
    }
?>

<title>Sign up | Readily</title>
</head>
<body id="sign-up-body">

<form class="sign-up-container" id="sign-up-form" enctype="multipart/form-data" name="signup-form" action="" method="post">

    <h2>Personal info</h2>

    <div id="user-avatar-placeholder-js" class="user-avatar-placeholder">
        <img src="assets/images/avatars/default-avatar.jpg" id="user-avatar-img" alt="user avatar">
    </div>
    <p class="upload-avatar-text">upload avatar</p>

    <input type="file" id="user-avatar-js" name="user-avatar" class="user-avatar"/>
    <p  id="avatar-error"  class="error-message " style="display:none">Please upload an image with a maximum size of 700KB and in one of the following formats: jpg, jpeg, or png for your avatar.</p>

    <div class="info-container-grid personal-info-container-grid">

        <label for="first-name-input-js" class="input-title first-name-title">Fisrt Name</label>
        <input type="text" id="first-name-input-js" class="first-name-input" name="first-name-input">
        <p id="first-name-error" class="error-message " style="display: none;">Incorrect format (ex. Jhon)</p>

        <label for="last-name-input-js"  class="input-title last-name-title">Last Name</label>
        <input type="text" id="last-name-input-js" class="last-name-input" name="last-name-input">
        <p id="last-name-error" class="error-message " style="display: none;">Incorrect format (ex. Smith)</p>

        <label for="username-input-js" class="input-title username-title">Username</label>
        <input type="text" id="username-input-js" class="username-input" name="username-input">
        <p id="username-error"  class="error-message " style="display: none;">Your username must be at least 5 characters long and can only contain letters, numbers, periods, parentheses, forward slashes, hyphens, and underscores.</p>

        <label for="password-input-js" class="input-title password-title">Password</label>
        <input type="password" id="password-input-js" class="password-input" name="password-input">
        <p id="password-error" class="error-message" style="display: none;">Your password must be at least 5 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character from the set of periods, parentheses, forward slashes, hyphens, and underscores (' . ',  '_', '-',  '/', '()').</p>

        <label for="email-input-js" class="input-title email-title">Email</label>
        <input type="email" id="email-input-js" class="email-input" name="email-input">
        <p id="email-error" class="error-message " style="display: none;">Incorrect format (ex. jhonsmith@gmail.com)</p>

        <label for="phone-input-js" class="input-title phone-title">Phone</label>
        <input type="number" id="phone-input-js" class="phone-input" name="phone-input">
        <p id="phone-error" class="error-message " style="display: none;">Incorrect format (ex. 0611234567)</p>

        <label for="role-input-js"  class="input-title role-title">Role</label>
        <select id="role-input-js" name="role-input" class="role-input">
            <option value="2" selected>Customer</option>
            <option value="3">Writer</option>
        </select>
        <p id="role-error"  class="error-message " style="display: none;">Role doesn't exist</p>

        <label for="biography-input" id="biography-title-js" class="input-title biography-title" style="display:none;">Biography</label>
        <textarea name="biography-input" id="biography-input-js" class="biography-input" style="display:none;" ></textarea>
        <p id="biography-error" class="error-message " style="display: none;">There must be at least 5 words.</p>
    </div>

    <h2>Address info <br /><span>(optional)<span></h2>

    <div  class="info-container-grid address-info-container-grid">

        <label for="address-line-input-js" class="input-title address-line-title">Address line</label>
        <input type="text" id="address-line-input-js" class="address-line-input" name="address-line-input">
        <p id="address-line-error" class="error-message " style="display: none;">Please enter a valid address line.</p>

        <label for="number-input-js" class="input-title number-title">Number</label>
        <input type="text" id="number-input-js" class="number-input" name="number-input">
        <p id="number-error" class="error-message " style="display: none;">Please enter a valid address number.</p>

        <label for="city-input-js"  class="input-title city-title">City</label>
        <input type="text" id="city-input-js" class="city-input" name="city-input">
        <p id="city-error"  class="error-message " style="display: none;">Incorrect format (ex.  Los Angeles)</p>

        <label for="state-input-js"  class="input-title state-title">State</label>
        <input type="text" id="state-input-js" class="state-input" name="state-input">
        <p id="state-error" class="error-message " style="display: none;">Incorrect format (ex.  California)</p>

        <label for="zip-code-input-js"  class="input-title zip-code-title">Zip-code</label>
        <input type="text" id="zip-code-input-js" class="zip-code-input" name="zip-code-input">
        <p id="zip-code-error" class="error-message " style="display: none;">Incorrect format (ex.  90001)</p>

        <label for="country-input-js"  class="input-title country-title">Country</label>
        <input type="text" id="country-input-js" class="country-input" name="country-input">
        <p id="country-error"  class="error-message " style="display: none;">Incorrect format (ex.  United States)</p>
    </div>

    <div class="server-messages">
    </div>

    <input type="button" id="create-account-button" value="Create Account">

</form>