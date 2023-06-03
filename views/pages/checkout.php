<?php
    require_once "models/global/functions.php";
    require_once "models/user/functions.php";
    require_once "models/delivery/functions.php";
    require_once "models/book/functions.php";

    if(!isset($_SESSION['userId'])){
        http_response_code(401);
        redirect("index.php?page=login");
        exit;
    }

    try{
        $allDeliveryTypes = selectAllDeliveryTypes();
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    $deliveryTypes = $allDeliveryTypes->activeDeliveryTypes;

    $userId = $_SESSION['userId'];

    try{
        $userInformationObj = getUserInformation($userId);
    }catch(PDOException $ex){
        http_response_code(500);
        $errorMessageArray[] = 'Server error: ' . $ex->getMessage();
        echo json_encode($errorMessageArray);
    }

    $addressLine = isset($userInformationObj->address_line) ? $userInformationObj->address_line : '';
    $addressNumber =isset($userInformationObj->address_number) ? $userInformationObj->address_number : '';
    $city =isset($userInformationObj->city) ? $userInformationObj->city : '';
    $state =isset($userInformationObj->state) ? $userInformationObj->state : '';
    $zipCode =isset($userInformationObj->zip_code) ? $userInformationObj->zip_code : '';
    $country =isset($userInformationObj->country) ? $userInformationObj->country : '';

    $cart =json_decode($_COOKIE['cart']) ;

    $totalPrice = 0;
?>

<title>Checkout | Readily</title>
</head>
<body>

<section id="cart-items" class="wrapper">
        <div id="table-container">

            <table>
                <thead>
                    <tr>
                        <td class="td-image-checkout">Image</td>
                        <td class="td-title">Title</td>
                        <td class="td-unit-price">Unit Price</td>
                        <td class="td-quantity">Quantity</td>
                        <td class="td-price">Price</td>
                        <td class="td-remove">Remove</td>
                    </tr>
                </thead>
                <tbody id="tbody-checkout">  
                    <?php  foreach($cart as $bookInCart):?>
                        <?php $bookInformation = selectBook($bookInCart->id); ?>

                        <tr id="tr-<?=$bookInCart->id ?>">
                            <td class="td-image">
                                <img class="set-brightness" src="assets/images/books/small/<?=$bookInformation['src'] ?>" alt="<?=$bookInformation['title'] ?>">
                            </td>
                            <td class="td-title">
                                <div>
                                    <p><?=$bookInformation['title'] ?></p>
                                </div>
                            </td>
                            <td class="td-unit-price">
                                <p>$<?=$bookInformation['price'] ?>.00</p>
                            </td>
                            <td class="td-quantity">
                                <div>
                                    <input min="0" type="number" value="<?=$bookInCart->quantity ?>" class="input-qunatity" id="quantity-<?=$bookInCart->id ?>">
                                </div>
                            </td>
                            <td class="td-price">
                                <p id="price-107">$
                                <?php
                                    $price = $bookInformation['price'] * $bookInCart->quantity;
                                    $totalPrice += $price;
                                    echo $price;
                                ?>.00</p>
                            </td>
                            <td class="td-remove">
                                <div>
                                    <i class="fa-solid fa-xmark" id="remove-<?=$bookInCart->id ?>">

                                    </i>
                                </div>
                            </td>
                        </tr>


                    <?php endforeach?>
                </tbody>
            </table>

            <div id="empty" style="display:<?php 
            if(!count($cart)){
                echo 'block';
            }else{
                echo 'none';
            }
            ?>">
                <p>The Cart Is Empty</p>
            </div>

        </div>

        <div id="total-price-container">
            <p id="total-price">Total: $<?=$totalPrice ?>.00</p>
        </div>
    </section>




    <section class="sign-up-container wrapper" id="sign-up-form">

        <form id="delivery-form"  method="post" name="delivery-form" action="form.php">

            <h2>Address info</h2>

            <div id="checkout-address-container"  class="info-container-grid address-info-container-grid">

                <label for="address-line-input-js" class="input-title address-line-title">Address line</label>
                <input type="text" value="<?=$addressLine ?>" id="address-line-input-js" class="address-line-input" name="address-line-input">
                <p id="address-line-error" class="error-message " style="display: none;">Please enter a valid address line.</p>

                <label for="number-input-js" class="input-title number-title">Number</label>
                <input type="text" value="<?=$addressNumber ?>" id="number-input-js" class="number-input" name="number-input">
                <p id="number-error" class="error-message " style="display: none;">Please enter a valid address number.</p>

                <label for="delivery-input"  class="input-title delivery-title">Delivery option</label>
                <select name="delivery-input" id="delivery-input">
                    <?php foreach($deliveryTypes as $deliveryType): ?>
                        <option  value="<?=$deliveryType['id'] ?>"><?=$deliveryType['name'] ?></option>
                    <?php endforeach?>
                </select>
                <p id="delivery-error" class="error-message " style="display: none;">Please enter a valid delivery type option.</p>

                <label for="city-input-js"  class="input-title city-title">City</label>
                <input type="text" value="<?=$city ?>" id="city-input-js" class="city-input" name="city-input">
                <p id="city-error"  class="error-message " style="display: none;">Incorrect format (ex.  Los Angeles)</p>

                <label for="state-input-js"  class="input-title state-title">State</label>
                <input type="text" value="<?=$state ?>" id="state-input-js" class="state-input" name="state-input">
                <p id="state-error" class="error-message " style="display: none;">Incorrect format (ex.  California)</p>

                <label for="zip-code-input-js"  class="input-title zip-code-title">Zip-code</label>
                <input type="text" value="<?=$zipCode ?>" id="zip-code-input-js" class="zip-code-input" name="zip-code-input">
                <p id="zip-code-error" class="error-message " style="display: none;">Incorrect format (ex.  90001)</p>

                <label for="country-input-js"  class="input-title country-title">Country</label>
                <input type="text" value="<?=$country ?>" id="country-input-js" class="country-input" name="country-input">
                <p id="country-error"  class="error-message " style="display: none;">Incorrect format (ex.  United States)</p>
            </div>

            <div class="server-messages">
            </div>

            <input type="button" id="create-account-button" class="checkout-button" value="Submit">

        </form>
    </section>
