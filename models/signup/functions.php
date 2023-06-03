<?php 

function generateToken() {
    $bytes = random_bytes(10);
    $token = bin2hex($bytes);
    return $token;
}

function insertNewUser($firstName,$lastName,$username,$password,$email,$phone,$token,$addressId,$role){
    global $conn;

    $query = 'INSERT INTO user (first_name, last_name, username, password, email, phone, token, address_id, role_id) VALUES (:first_name, :last_name, :username, :password, :email, :phone, :token, :address_id, :role)';
    $statement = $conn->prepare($query);

    $statement->bindParam(':first_name', $firstName);
    $statement->bindParam(':last_name', $lastName);
    $statement->bindParam(':username', $username);
    $statement->bindParam(':password', $password);
    $statement->bindParam(':email', $email);
    $statement->bindParam(':phone', $phone);
    $statement->bindParam(':token', $token);
    $statement->bindParam(':address_id', $addressId);
    $statement->bindParam(':role', $role);

    $statement->execute();

    return $conn->lastInsertId();
}

function send_activation_email($toEmail, $activationLink) {
    $subject = "Activate Your Account";
    $message = '
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <title>Activate Your Account</title>
        <style type="text/css">
            body {
                font-family: Arial, sans-serif;
                font-size: 14px;
                line-height: 1.5;
                color: #333;
            }
            h1 {
                font-size: 20px;
                font-weight: bold;
                margin-top: 0;
                margin-bottom: 20px;
            }
            p {
                margin-bottom: 20px;
            }
            a {
                color: #fff !important;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
            .button {
                display: inline-block;
                padding: 8px 16px;
                background-color: #0066cc;
                color: #fff;
                border-radius: 4px;
                text-decoration: none;
            }
            .button:hover {
                background-color: #0052a3;
            }
        </style>
    </head>
    <body>
        <h1>Activate Your Account</h1>
        <p>Hi,</p>
        <p>Thanks for creating an account with us! Please activate your account by clicking on the following link:</p>
        <p><a href="'.$activationLink . '" class="button">Activate Your Account</a></p>
        <p>If you have any questions or concerns, don\'t hesitate to contact us.</p>
        <p>Best regards,<br>Readily</p>
    </body>
    </html>
    ';


    $headers = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
    $headers .= 'From: Readily <pp5104133@gmail.com>' . "\r\n";
    $headers .= "Reply-To: pp5104133@gmail.com\r\n";

    if(mail($toEmail, $subject, $message, $headers)) {
        return true;
    }
    $lastError = error_get_last();
    echo "Error: " . $lastError['message'];

    return false;
}

function activateNewUser($token){
    global $conn;

    $query = 'UPDATE user SET status = 1 WHERE token = :token';
    $statement = $conn->prepare($query);

    $statement->bindParam(':token',$token);
    $statement->execute();
}
?>