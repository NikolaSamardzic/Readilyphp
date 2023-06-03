var url = window.location.search;
var prefersDarkScheme;

console.log(url);

window.onload =function(){
    setThemeClass();
    setHeader();

    if(url.includes("page=signup")){

        console.log("signup stranica")

        setSignupForm();
    }

    if(url.includes("page=login")){

        console.log("login stranica")

        setLoginForm();
    }

    if(url.includes("page=user-profile")){

        console.log("user-profile stranica")

        setUserAccount();
        setUpdateUserForm();
    }

    if(url.includes("page=admin-users")){

        console.log("admin-users stranica")

        setTableZebra();
        setEventsForUserTable();
    }

    if(url.includes("page=admin-publishers")){

        console.log("admin-publishers stranica")

        setEventsForPublisherPage();
        setTableZebra();
        setEventsForPublisherTable();
    }

    if(url.includes("page=admin-survey")){

        console.log("admin-survey stranica")

        setTableZebra();
        setEventsForSurveyTable();
    }

    if(url.includes("page=admin-categories")){

        console.log("admin-categories stranica")

        setEventsForCategoriesPage();
        setTableZebra();
        setEventsForCategoriesTable();
    }

    if(url.includes("page=admin-messages")){

        console.log("admin-messages stranica")
        
        setTableZebra();
    }

    if(url.includes("page=admin-orders")){

        console.log("admin-orders stranica")

        setTableZebra();
    }

    if(url.includes("page=admin-delivery-options")){

        console.log("admin-delivery-options stranica")

        setEventsForDeliveryTypesPage();
        setTableZebra();
        setEventsForDeliveryTypesTable();
    }
    
    if(url.includes("page=writer-books")){

        console.log("writer-books stranica")

        setEventsForWriterBooksPage();
        setTableZebra();
    }

    if(url.includes("page=insert-book")){

        console.log("insert-book stranica")

        setInsertBookForm();
    }

    if(url.includes("page=update-book")){

        console.log("update-book stranica")

        selectBookCategories();
        setUpdateBookForm();
    }

    if(url.includes("page=book")){

        console.log("book stranica")

        createAngleFunctionality('related-categories-container','.article-category','book-related-categories-section','category');
        createAngleFunctionality('div-info-section','.article-info-container','div-info-container','category')
        createAngleFunctionality('related-books','#related-books-articles-container','related-books-articles-container','books')
        createAngleFunctionality('authors-books','#autors-books-articles-container','autors-books-articles-container','books')

        let formReview = document.getElementById('star-rating-form');

        if(formReview){
            let starsContainer = document.querySelectorAll('.star-icon-container');

            starsContainer.forEach(star=>{
                star.addEventListener('click',()=>{
                    let radioBtn = star.querySelector('input[type="radio"]');
                    radioBtn.checked = true;    
                    let rating = radioBtn.value;

                    let stars = document.querySelectorAll('.book-rating-star');

                    for(let i=0;i<stars.length;i++){
                        if(rating>=i){
                            stars[i].classList.remove('fa-regular');
                            stars[i].classList.add('fa-solid');

                        }
                        else{
                            stars[i].classList.remove('fa-solid');
                            stars[i].classList.add('fa-regular');
                        }
                    }

                    let formData = new FormData(formReview);

                    $.ajax({
                        url: 'models/book/book-rating.php',
                        type: 'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: function(response) {
                
                            displayServerMessages('server-messages',response,'success-message');
                        },
                        error: function(xhr, status, errorThrown) {
                            console.log('neuspeh')
                            let messages = JSON.parse(xhr.responseText);
                            displayServerMessages('server-messages',messages,'error-message');
                
                            console.log(messages)
                            console.log(xhr);
                            console.log(status, errorThrown);
                        }
                    });
                })
            })
        }

        let formComment = document.getElementById('form-comment');

        if(formComment){

            $(document).on('blur','#biography-input-js',checkBiography);

            let inputTag = document.querySelector('.comment-image');
            commentImageInput(inputTag);

            $(document).on('click','#comment-button',sendCommentForm);


        }
    }

    if(url.includes('page=home') || !url.includes("page=")){

        console.log("home stranica")

        setMessageForm();

        createAngleFunctionality('bestselling-books','.article-book','bestselling-books-articles-container','books');
        createAngleFunctionality('popular-categories','.article-category','popular-categories-articles-container','category');

        let surveyContainer = document.getElementById('survey-website-experience-section');

        if(surveyContainer){
            $('.survey-option').on('click', function() {
                var closestRadio = $(this).closest('.survey-option').find('input[type=radio]');
                closestRadio.prop('checked', true);
                
                sendSurvey('website-experience-form');
            });

        }

        let cookie = document.cookie.split(';');
        for(let i=0; i<cookie.length;i++){
        
            let name = cookie[i].trim().split('=')[0];
            let value = decodeURIComponent(cookie[i].trim().split('=')[1]);

            if(name == 'hasPreferedCategories'){
                createAngleFunctionality('suggested-books','#suggested-books','sugested-books-articles-container','books');
            }

        }

        window.addEventListener("scroll",()=>{
            let element = document.getElementById("position");
            let scrollPosition = window.scrollY;

            let positionOffset = element.getBoundingClientRect().top + scrollPosition;

            if(scrollPosition < positionOffset){
                return;
            }


            let cookie = document.cookie.split(';');

            
            let hasPreferedCategories = false;
            let isLoggedIn = false;

            for(let i=0; i<cookie.length;i++){
        
                let name = cookie[i].trim().split('=')[0];
                let value = decodeURIComponent(cookie[i].trim().split('=')[1]);

                switch(name){
                    case 'hasPreferedCategories':
                        hasPreferedCategories = value;
                        break;
                    case 'isLoggedIn':
                        isLoggedIn = value;
                        break;
                }
            }

            if(hasPreferedCategories || !isLoggedIn){
                return;
            }


            let exist = document.querySelector(".choosing-categories-section");
            if(exist != undefined){
                return;
            }

            $("body").addClass("pre-loader");
            let body = document.querySelector("body");
            
            let bodyChildren = body.children;
            for(let i=0;i<bodyChildren.length;i++){
                bodyChildren[i].classList.add("blur");
            }

            let titleTag = document.createElement("h2");
            titleTag.innerText = "Select 3 categories that match your interests"

            let choosingCategoriesSection = document.createElement("section");
            let choosingCategoriesContainer = document.createElement("form");
            choosingCategoriesContainer.setAttribute('id','user-prefered-categories-form');

            choosingCategoriesContainer.appendChild(titleTag);

            choosingCategoriesSection.classList.add("choosing-categories-section");
            choosingCategoriesContainer.classList.add("choosing-categories-container");

            displayChoosingCategories(choosingCategoriesContainer);

            choosingCategoriesSection.appendChild(choosingCategoriesContainer);
            body.appendChild(choosingCategoriesSection);
        })
    }

    if(url.includes("page=writer&id")){
        console.log("writer stranica")

        createAngleFunctionality('writer-books','.article-book','writer-books-articles-container','books');
        createAngleFunctionality('other-writers','.article-writer','other-writers-articles-container','author');

        $(document).on('click','#show-more',()=>{
            let short = document.querySelector(".short-info");
            let long = document.querySelector(".long-info");
    
            short.style.display = "none";
            long.style.display = "block";
        })

        $(document).on('click','#show-less',()=>{
            let short = document.querySelector(".short-info");
            let long = document.querySelector(".long-info");
    
            long.style.display = "none";
            short.style.display = "block";
        })
    }

    if(url.includes("page=shop")){

        console.log("shop stranica")

        setFilterSortForm();
        sendFilterSortForm();
    }

    if(url.includes("page=checkout")){

        console.log("checkout stranica")

        setTableZebra();

        setCheckoutTableEvents();
        setCheckoutForm();
    }

    if(url.includes("page=admin-logged-in-users")){
        setTableZebra();
    }

    if(url.includes("page=admin-visitors")){
        setTableZebra();
    }

    let cartTag = document.querySelectorAll('.fa-cart-shopping');

    cartTag.forEach(element=>{
        element.addEventListener('click',()=>{
            let string = element.getAttribute('id');
            let id = parseInt(string.match(/\d+$/)[0]);
            addToCart(id);

        })
    })
}

function sendCommentForm(){
    let errorCount = 0;

    errorCount += checkBiography();

    errorCount += checkCommentImages();
    if(errorCount){
        return;
    }

    let form = document.getElementById('form-comment');
    let formData = new FormData(form);

    $.ajax({
        url: 'models/book/insert-comment.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {

            document.getElementById('biography-input-js').value = "";

            let commentImages = document.querySelectorAll('.comment-image');
            let commentImagesArray = Array.prototype.slice.call(commentImages, 1);

            commentImages.forEach((elem) => {
                elem.value = ''; 
            });

            commentImagesArray.forEach((elem) => {
            elem.remove();
            });


            displayServerMessages('comment-server-error',response,'success-message');
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            displayServerMessages('comment-server-error',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function checkCommentImages(){
    let commentImages = document.querySelectorAll('.comment-image');
    let errorMessage = document.getElementById('comment-images-error');

    let totalSize = 0;

    let isValid = true;

    Array.from(commentImages).forEach(image => {

    if (image.files.length > 0) {
        let file = image.files[0];
        let fileType = file.type.split('/')[1];
        let fileSize = file.size / (1024 * 1024); 



        if (fileType !== 'jpg' && fileType !== 'jpeg' && fileType !== 'png') {
            isValid = false
        }

        totalSize += fileSize;

        if (totalSize > 2) {
            isValid = false
        }
    }
    });


    if(isValid){
        errorMessage.style.display = "none";
        return 0;
    }

    errorMessage.style.display = "block";
    return 0;
}

function commentImageInput(element){

    element.addEventListener('change',()=>{
        let commentImagesContainer = document.querySelector('#comment-images-container');
        let commentImages = document.querySelectorAll('.comment-image');
    
        let uploadedImages = Array.from(commentImages).filter(image => image.files.length > 0);
        checkCommentImages();
        if (element.files.length > 0 &&  commentImages.length < 3 ){
            let newInput = document.createElement('input');
            newInput.type = 'file';
            newInput.name = 'comment-image[]';
            newInput.classList.add('comment-image');
            commentImageInput(newInput);
    
            commentImagesContainer.appendChild(newInput);
        }else if(element.files.length == 0 &&  uploadedImages.length <2){
            if (commentImages.length > 1) {
                element.remove();
            }
        }
    })


}

function setMessageForm(){
    $(document).on('blur','#biography-input-js',checkBiography);

    $(document).on('blur','#subject-input-js',()=>{
        let subject = document.getElementById('subject-input-js').value;
        errorMessage = document.getElementById('first-name-error');

        if(!subject.length){
            errorMessage.style.display = 'block';
            return 1;
        }
    
        errorMessage.style.display = 'none';
        return 0;
    });

    $(document).on('click','#send-message-form',sendMessageForm);
}

function sendMessageForm(){
    let errorCount = 0;

    let subject = document.getElementById('subject-input-js').value;
    errorMessage = document.getElementById('first-name-error');

    if(!subject.length){
        errorMessage.style.display = 'block';
        errorCount++;
    }
    errorCount += checkBiography();

    if(errorCount){
        return;
    }

    let form = document.getElementById('message-form');

    let formData = new FormData(form);

    $.ajax({
        url: 'models/message/send-message.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            console.log('uspeh')
            clearAllInputValuesMessage();

            displayServerMessages('server-messages',response,'success-message');
        },
        error: function(xhr, status, errorThrown) {
            console.log('neuspeh')
            let messages = JSON.parse(xhr.responseText);
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function clearAllInputValuesMessage(){
    console.log('radi')
    document.getElementById('subject-input-js').value = "";
    document.getElementById('biography-input-js').value = "";
}

function setCheckoutForm(){
    $(document).on('blur','#address-line-input-js',()=>{
        checkInputElementWithRegex(/^[a-zšđžćčA-ZŠĐŽĆČ0-9\s\.\-\#\\/\,]+$/,'address-line-input-js','address-line-error');
    });
    $(document).on('blur','#number-input-js',()=>{
        checkInputElementWithRegex(/^\d+[a-zA-Z]?$/,'number-input-js','number-error');
    });
    $(document).on('blur','#city-input-js',()=>{
        checkInputElementWithRegex(/^([A-ZŠĐŽĆČ][a-zšđžćč]{2,}\s?)+$/,'city-input-js','city-error');
    });
    $(document).on('blur','#state-input-js',()=>{
        checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'state-input-js','state-error');
    });
    $(document).on('blur','#country-input-js',()=>{
        checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'country-input-js','country-error');
    });
    $(document).on('blur','#zip-code-input-js',()=>{
        checkInputElementWithRegex(/^\d{5,15}$/,'zip-code-input-js','zip-code-error');
    });

    $(document).on('click','.checkout-button',sendCheckoutData);
}

function sendCheckoutData(){
    let errorCount = 0;

    errorCount += checkInputElementWithRegex(/^[a-zšđžćčA-ZŠĐŽĆČ0-9\s\.\-\#\\/\,]+$/,'address-line-input-js','address-line-error');
    errorCount += checkInputElementWithRegex(/^\d+[a-zA-Z]?$/,'number-input-js','number-error');
    errorCount += checkInputElementWithRegex(/^([A-ZŠĐŽĆČ][a-zšđžćč]{2,}\s?)+$/,'city-input-js','city-error');
    errorCount += checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'state-input-js','state-error');
    errorCount += checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'country-input-js','country-error');
    errorCount += checkInputElementWithRegex(/^\d{5,15}$/,'zip-code-input-js','zip-code-error');

    let cookieValue = document.cookie.replace(/(?:(?:^|.*;\s*)cart\s*\=\s*([^;]*).*$)|^.*$/, "$1");
    cookieValue = decodeURIComponent(cookieValue.replace(/\+/g, ' '));
    let cart = JSON.parse(cookieValue);

    if(!cart.length){
        errorCount++;
        let message = ['Your cart is empty. Please add a book to proceed with the purchase.'];
        displayServerMessages('server-messages',message,'error-message');

    }

    if(errorCount){
        return;
    }


    let form = document.getElementById('delivery-form');
    let formData = new FormData(form);

    $.ajax({
        url: 'models/order/order-logic.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            clearAllInputValuesCheckout();
            clearAllInputErrorsCheckout();

            displayServerMessages('server-messages',response,'success-message');
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function clearAllInputErrorsCheckout(){
    document.getElementById('address-line-error').style.display = 'none';
    document.getElementById('number-error').style.display = 'none';
    document.getElementById('delivery-error').style.display = 'none';
    document.getElementById('city-error').style.display = 'none';
    document.getElementById('state-error').style.display = 'none';
    document.getElementById('zip-code-error').style.display = 'none';
    document.getElementById('country-error').style.display = 'none';

    let messagesContainer = document.querySelector('.server-messages');
    while(messagesContainer.firstChild)messagesContainer.removeChild(messagesContainer.firstChild);
}

function clearAllInputValuesCheckout(){
    displayUserCartTable([]);

    document.getElementById('address-line-input-js').value = '';
    document.getElementById('number-input-js').value = '';
    document.getElementById('city-input-js').value = '';
    document.getElementById('state-input-js').value = '';
    document.getElementById('zip-code-input-js').value = '';
    document.getElementById('country-input-js').value = '';
}

function setCheckoutTableEvents(){
    let removeTags = document.querySelectorAll('.fa-xmark');

    removeTags.forEach(tag=>{
        tag.addEventListener('click',()=>{
            let tagId = tag.getAttribute('id')
            let idBook = parseInt(tagId.match(/\d+$/)[0]);
            console.log(idBook)


            let cookieValue = document.cookie.replace(/(?:(?:^|.*;\s*)cart\s*\=\s*([^;]*).*$)|^.*$/, "$1");
            cookieValue = decodeURIComponent(cookieValue.replace(/\+/g, ' '));
            let cart = JSON.parse(cookieValue);

            for(let i=0;i<cart.length;i++){
                if(cart[i].id == idBook){
                    cart.splice(i,1);
                }
            }

            let jsonString = JSON.stringify(cart);
            document.cookie = `cart=${jsonString};path=/;`;



            $.ajax({
                url: 'models/cart/cart-logic.php',
                type: 'POST',
                data: {},
                contentType: false,
                processData: false,
                success: function(response) {
                    displayUserCartTable(response);
                    setCheckoutTableEvents();
                    setTableZebra();
                    console.log(" ")
                    console.log("PHP:")
                    console.log(response);
                },
                error: function(xhr, status, errorThrown) {
                    let messages = JSON.parse(xhr.responseText);
        
                    console.log(messages)
                    console.log(xhr);
                    console.log(status, errorThrown);
                }
            });
        })
    })

    let inputTags = document.querySelectorAll('.input-qunatity');

    inputTags.forEach(tag=>{
        tag.addEventListener('change',()=>{
            let tagId = tag.getAttribute('id')
            console.log('id ' + tagId)
            let idBook = parseInt(tagId.match(/\d+$/)[0]);
            let quantityValue = document.getElementById(`quantity-${idBook}`).value;


            let cookieValue = document.cookie.replace(/(?:(?:^|.*;\s*)cart\s*\=\s*([^;]*).*$)|^.*$/, "$1");
            cookieValue = decodeURIComponent(cookieValue.replace(/\+/g, ' '));
            let cart = JSON.parse(cookieValue);

            for(let i=0;i<cart.length;i++){
                if(cart[i].id == idBook){
                    if(Number(quantityValue) != 0){
                        cart[i].quantity = quantityValue;
                    }else{
                        cart.splice(i,1);
                    }
                }

            }


            let jsonString = JSON.stringify(cart);
            document.cookie = `cart=${jsonString};path=/;`;


            $.ajax({
                url: 'models/cart/cart-logic.php',
                type: 'POST',
                data: {},
                contentType: false,
                processData: false,
                success: function(response) {
                    displayUserCartTable(response);
                    setCheckoutTableEvents();
                    setTableZebra();
                    console.log(" ")
                    console.log("PHP:")
                    console.log(response);
                },
                error: function(xhr, status, errorThrown) {
                    let messages = JSON.parse(xhr.responseText);
        
                    console.log(messages)
                    console.log(xhr);
                    console.log(status, errorThrown);
                }
            });
        })
    })

}

function displayUserCartTable(books){
    let tbodyElement = document.getElementById('tbody-checkout');

    while(tbodyElement.firstChild)tbodyElement.removeChild(tbodyElement.firstChild);


    if(books.length == 0){
        let trEmptyTag = document.getElementById("empty");
        trEmptyTag.style.display = "block"
    }else{
        
        let trEmptyTag = document.getElementById("empty");
        //console.log(trEmptyTag);
        trEmptyTag.style.display = "none";
    }

    let totalPrice = 0;

    for(let i=0;i<books.length;i++){
        let book = books[i];
        let trTag = document.createElement("tr");
        trTag.setAttribute("id",`tr-${book.id}`);

        let imgTag = document.createElement("img");
        imgTag.classList.add("set-brightness");
        imgTag.src = `assets/images/books/small/${book.src}`;
        imgTag.alt = book.title;

        let tdTagImg = document.createElement("td")
        tdTagImg.classList.add("td-image");
        tdTagImg.appendChild(imgTag);

        let titleTag = document.createElement("p");
        titleTag.innerText = book.title;

        let titleContainer = document.createElement("div");
        titleContainer.appendChild(titleTag);

        let tdTitle = document.createElement("td");
        tdTitle.classList.add("td-title")
        tdTitle.appendChild(titleContainer)

        let unitPriceTag = document.createElement("p");
        unitPriceTag.innerText = `$${book.price}.00`;
        
        let tdUnitPriceTag = document.createElement("td");
        tdUnitPriceTag.classList.add("td-unit-price")
        tdUnitPriceTag.appendChild(unitPriceTag);

        let quantityTag = document.createElement("input");
        quantityTag.classList.add('input-qunatity');
        quantityTag.setAttribute("min","0");
        quantityTag.type = "number";
        quantityTag.setAttribute("id",`quantity-${book.id}`);
        quantityTag.value = `${book.quantity}`;



        let quantityTagContainer = document.createElement("div");
        quantityTagContainer.appendChild(quantityTag);

        let tdQuantity = document.createElement("td");
        tdQuantity.classList.add("td-quantity");
        tdQuantity.appendChild(quantityTagContainer)


        let priceTag = document.createElement("p");
        priceTag.setAttribute("id",`price-${book.id}`);
        priceTag.innerText = "$ " + (book.price *book.quantity).toFixed(2);
        totalPrice += book.price *book.quantity;

        let tdPrice = document.createElement("td");
        tdPrice.classList.add("td-price");
        tdPrice.appendChild(priceTag)

        let removeTag = document.createElement("i");
        removeTag.classList.add("fa-solid","fa-xmark");
        removeTag.setAttribute("id",`remove-${book.id}`);

        let removeTagContainer = document.createElement("div");
        removeTagContainer.appendChild(removeTag);

        let tdRemove = document.createElement("td");
        tdRemove.classList.add("td-remove");

        tdRemove.appendChild(removeTagContainer);

        trTag.appendChild(tdTagImg);
        trTag.appendChild(tdTitle);
        trTag.appendChild(tdUnitPriceTag);
        trTag.appendChild(tdQuantity);
        trTag.appendChild(tdPrice);
        trTag.appendChild(tdRemove);

        tbodyElement.appendChild(trTag);


    }

    let totalPriceTag = document.getElementById('total-price');
    totalPriceTag.textContent = `$${totalPrice}.00`;
}

function sendFilterSortForm(activePage = 1){
    let form = document.getElementById('filter-sort-section');

    let formData = new FormData(form);
    formData.append('activePage',activePage);

    $.ajax({
        url: 'models/shop/shop.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            displayShopBooks(response[2]);
            createPageNumbers(response[0],response[1]);

            if(!(response[2].length)){
                element.style.display = 'block';
                element.innerHTML = `<p class="error-message">We're sorry, but we couldn't find any books that match your interests.</p>`;
            }
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });

}

function createPageNumbers(pageCount,activePage){
    let ulTag = document.getElementById('pagination-ul');

    while(ulTag.firstChild)ulTag.removeChild(ulTag.firstChild);

    for(let i=1;i<=pageCount;i++){
        let liTag = document.createElement('li');
        liTag.classList.add('page-item','number');

        if(i == activePage){
            liTag.classList.add('active');
        }

        let aTag =  document.createElement('a');
        aTag.setAttribute('href','#');
        aTag.classList.add('page-link');
        aTag.textContent = i;

        aTag.addEventListener('click',(i)=>{
            sendFilterSortForm(aTag.textContent)
        })

        liTag.appendChild(aTag);
        ulTag.appendChild(liTag);
    }
}

function displayShopBooks(books){

    let ulTag = document.getElementById('articles-container-ul');
    while(ulTag.firstChild)ulTag.removeChild(ulTag.firstChild);

    books.forEach(book=>{
        let liTag = document.createElement('li');
        liTag.classList.add('li-tag-article-container')
        let article = bookArticleGenerator(book,"",true);
        liTag.appendChild(article);
        ulTag.appendChild(liTag);
    })
}

function setFilterSortForm(){

    let parentCategories = document.querySelectorAll('.category-parent ul');

    parentCategories.forEach(parentCat=>{
        parentCat.style.display = 'none';
    })


    $('.category-parent').on('click', function() {
        let nestedUl = $(this).find('ul');
        nestedUl.toggle();
    });

    $('.book-category-cb').on('click', function(event) {
        event.stopPropagation();
    }); 

    $('.book-category-li label').on('click', function(event) {
        event.stopPropagation();
    }); 


    $(document).on('blur','#input-search',()=>{
        sendFilterSortForm();
    })

    $(document).on('blur','#price-min',()=>{
        sendFilterSortForm();
    })

    $(document).on('blur','#price-max',()=>{
        sendFilterSortForm();
    })

    $(document).on('change','#sort',()=>{
        sendFilterSortForm();
    })

    let cbElements = document.querySelectorAll('.book-category-cb');

    cbElements.forEach(element=>{
        element.addEventListener('change',()=>{
            sendFilterSortForm();
        })
    })
}

function setEventsForSurveyTable(){
    let deleteSurveys = document.querySelectorAll('.delete-survey');
    deleteSurveys.forEach(deleteSurvey => {
        deleteSurvey.addEventListener('click', () => {
            let form = deleteSurvey.closest('form');
            sendDeleteSurveyForm(form);
        });
    });

    let activatePublishers = document.querySelectorAll('.activate-survey');
    activatePublishers.forEach(activatePublisher => {
        activatePublisher.addEventListener('click', () => {
            let form = activatePublisher.closest('form');
            sendActivateSurveyForm(form);
        });
    });
}

function sendActivateSurveyForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/survey/activate-survey.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            populateSurveyTables(response);
        },
        error: function(xhr, status, errorThrown) {

            let messages = JSON.parse(xhr.responseText);

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function sendDeleteSurveyForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/survey/delete-survey.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            populateSurveyTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function populateSurveyTables(surveys){
    let activeSurveys = surveys[0].activeSurveys;
    let deletedSurveys = surveys[0].deletedSurveys;

    let aciteSurveysTable = document.querySelector('#table-active-surveys tbody');
    let deletedSurveysTable = document.querySelector('#table-deleted-surveys tbody');

    while(aciteSurveysTable.firstChild)aciteSurveysTable.removeChild(aciteSurveysTable.firstChild);
    while(deletedSurveysTable.firstChild)deletedSurveysTable.removeChild(deletedSurveysTable.firstChild);


    for(let property in activeSurveys){
        let trTag = document.createElement('tr');

        let tdTagName = document.createElement('td');
        let tdTagCreatedAt = document.createElement('td');
        let tdTagDelete = document.createElement('td');

        tdTagName.textContent = activeSurveys[property].name;
        tdTagCreatedAt.textContent = activeSurveys[property].created_at;


        let formDelete = document.createElement('form');

        let inputSurveyIdDelete = document.createElement('input');
        inputSurveyIdDelete.setAttribute('type','text');
        inputSurveyIdDelete.setAttribute('name','survey-id');
        inputSurveyIdDelete.style.display = 'none';
        inputSurveyIdDelete.value = activeSurveys[property].id;

        let inputButtonDelete = document.createElement('input');
        inputButtonDelete.setAttribute('type','button');
        inputButtonDelete.classList.add('danger-option','delete-survey');
        inputButtonDelete.value = 'Delete';

        formDelete.appendChild(inputSurveyIdDelete);
        formDelete.appendChild(inputButtonDelete);
        tdTagDelete.appendChild(formDelete);


        trTag.appendChild(tdTagName);
        trTag.appendChild(tdTagCreatedAt);

        for(let option in activeSurveys[property].options){
            tdTagOption = document.createElement('td');
            tdTagOption.classList.add('survey-table-options');

            nameTag = document.createElement('p');
            valueTag = document.createElement('p');

            nameTag.textContent = option;
            valueTag.textContent = activeSurveys[property].options[option]

            tdTagOption.appendChild(nameTag);
            tdTagOption.appendChild(valueTag);

            trTag.appendChild(tdTagOption)
        }

        trTag.appendChild(tdTagDelete);

        aciteSurveysTable.appendChild(trTag);
    }


    for(let property in deletedSurveys){
        let trTag = document.createElement('tr');

        let tdTagName = document.createElement('td');
        let tdTagFinishedAt = document.createElement('td');
        let tdTagDelete = document.createElement('td');

        tdTagName.textContent = deletedSurveys[property].name;
        tdTagFinishedAt.textContent = deletedSurveys[property].finished_at;


        let formDelete = document.createElement('form');

        let inputSurveyIdDelete = document.createElement('input');
        inputSurveyIdDelete.setAttribute('type','text');
        inputSurveyIdDelete.setAttribute('name','survey-id');
        inputSurveyIdDelete.style.display = 'none';
        inputSurveyIdDelete.value = deletedSurveys[property].id;

        let inputButtonDelete = document.createElement('input');
        inputButtonDelete.setAttribute('type','button');
        inputButtonDelete.classList.add('safe-option','activate-survey');
        inputButtonDelete.value = 'Activate';

        formDelete.appendChild(inputSurveyIdDelete);
        formDelete.appendChild(inputButtonDelete);
        tdTagDelete.appendChild(formDelete);


        trTag.appendChild(tdTagName);
        trTag.appendChild(tdTagFinishedAt);

        for(let option in deletedSurveys[property].options){
            tdTagOption = document.createElement('td');
            tdTagOption.classList.add('survey-table-options');

            nameTag = document.createElement('p');
            valueTag = document.createElement('p');

            nameTag.textContent = option;
            valueTag.textContent = deletedSurveys[property].options[option]

            tdTagOption.appendChild(nameTag);
            tdTagOption.appendChild(valueTag);

            trTag.appendChild(tdTagOption)
        }

        trTag.appendChild(tdTagDelete);

        deletedSurveysTable.appendChild(trTag);
    }

    setTableZebra();
    setEventsForSurveyTable();
}

function sendSurvey(idForm){
    let form = document.getElementById(idForm);

    let formData = new FormData(form);

    $.ajax({
        url: 'models/survey/insert-survey-webisite-experience-data.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            $('#website-experience-form').animate({
                height: 0
            }, 200);

            let element = document.querySelector('.survey-message');
            element.style.display = 'block';
            displayServerMessages('survey-message',response,'success-message');
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            let element = document.querySelector('.survey-message');
            element.style.display = 'block';
            displayServerMessages('survey-message',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function getCategories(){

}

function displayChoosingCategories(element){
    
    $.ajax({
        url: 'models/category/get-active-categories.php',
        type: 'POST',
        dataType: 'json',
        success:function(allCategories){
            console.log(allCategories);
            for(let i=0;i<allCategories.length;i++){
                let article = categoryArticleGenerator(allCategories[i]);
        
                let checkbox = document.createElement("input");
                checkbox.type = "checkbox";
                checkbox.name = "checkbox-prefered-categories[]"
                checkbox.value = allCategories[i].category_id;
                checkbox.classList.add("category-checkbox-choose");
                checkbox.setAttribute("id",`prefered-category-${allCategories[i].category_id}`)
        
                $(document).on("change",`#prefered-category-${allCategories[i].category_id}`,settingUserPreferedCategories);
        
                article.appendChild(checkbox);
                element.appendChild(article);
        
            }
        
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    })
}

function categoryArticleGenerator(category){
    let article = document.createElement("article");

    let name = category.category_name;

    let nameTag = document.createElement('p');
    nameTag.innerText = name;

    let imgTag = document.createElement("img");
    imgTag.src = `assets/images/books/small/${category.src}`;
    imgTag.alt = category.name;

    imgTag.classList.add("set-brightness");

    let link = document.createElement("a");
    link.href =`index.php?page=shop&id=${category.category_id}`;

    article.classList.add("article-category");
    article.appendChild(link);
    article.appendChild(nameTag);
    article.appendChild(imgTag);

    article.classList.add("article-category");

    return article
}

function bookArticleGenerator(book,label,image){

    let writer_id = book.writer_id;

    let article = document.createElement("article");
    article.classList.add("article-book");

    let divImgContainer = document.createElement("div");

    let lastDigit = book.id.toString().slice(-1);
    divImgContainer.classList.add(`bg-article-color-${lastDigit}`);
    divImgContainer.classList.add('article-div-img-container');

    let bookImg = document.createElement("img");
    bookImg.setAttribute("data-id",`${book.id}`);
    bookImg.classList.add("set-brightness");

    if(image){
        bookImg.src = `assets/images/books/small/${book.src}`;
    }
    bookImg.alt = book.title;

    let divTextConatiner = document.createElement("div");
    divTextConatiner.classList.add("article-books-text-container");

    let divTitleAndAuthor = document.createElement("div");
    divTitleAndAuthor.classList.add("title-and-author");

    let titleTag = document.createElement("h3");
    let authorTag = document.createElement("a");
    authorTag.classList.add("author-link");
    authorTag.href =`index.php?page=writer&id=${writer_id}`;
    authorTag.innerText = book.writer;

    if(book.title.length >33){
        titleTag.innerText = book.title.substring(0,30) + " ...";
    }else{
        titleTag.innerText = book.title;
    }

    divTitleAndAuthor.appendChild(titleTag);
    divTitleAndAuthor.appendChild(authorTag);

    let divStarsAndCart = document.createElement("div");
    divStarsAndCart.classList.add("stars-and-cart-container");

    let cartTag = document.createElement("i");
    cartTag.classList.add('fa-solid','fa-cart-shopping','shopping-cart');
    cartTag.setAttribute("id",'book-id-'+book.id);

    cartTag.addEventListener("click",()=>{
        addToCart(book.id);
    })


    let divStarsContainer = document.createElement("div");
    divStarsContainer.classList.add("stars-container");
    for(let i=0;i<5;i++){
        if(book.review >i){
            divStarsContainer.innerHTML +='<i class="fa-solid fa-star"></i>'
        }else{
            divStarsContainer.innerHTML +='<i class="fa-regular fa-star"></i>'
        }
    }

    let rewievNumber = document.createElement("p");
    rewievNumber.classList.add("rating-text")
    if(book.review>0){
        rewievNumber.innerText=`${book.review}/5`
    }else{
        rewievNumber.innerText= "0 ratings";
    }

    divStarsAndCart.appendChild(cartTag);
    divStarsAndCart.appendChild(divStarsContainer);
    divStarsAndCart.appendChild(rewievNumber);

    divTextConatiner.appendChild(divTitleAndAuthor);
    divTextConatiner.appendChild(divStarsAndCart);

    let linkToABookTag = document.createElement("a");
    linkToABookTag.classList.add("link-to-single-a-book");
    linkToABookTag.href =`index.php?page=book&id=${book.id}`;

    divImgContainer.appendChild(bookImg);
    article.appendChild(divImgContainer);
    article.appendChild(divTextConatiner);
    article.appendChild(linkToABookTag);

    return article;
}

function settingUserPreferedCategories(){
    let checkBoxes = document.querySelectorAll(".category-checkbox-choose");

    let prefered = [];
    checkBoxes.forEach(function(checkbox){
        if (checkbox.checked) {
            prefered.push(checkbox.value);
          }
    })

    if(prefered.length == 3){
        setItemToLocalStorage("hasPreferedCategories",true);
        let bodyChildren = document.querySelectorAll(".blur");
        for(let i=0;i<bodyChildren.length;i++){
            bodyChildren[i].classList.remove("blur");
            bodyChildren[i].classList.add("un-blur");
        }

        let body = document.querySelector("body");
        body.classList.remove("pre-loader")

        let section = document.querySelector(".choosing-categories-section");
        section.style.display = "none";
        displaySuggestions(prefered);

    }
}

function displaySuggestions(){
    let form = document.getElementById('user-prefered-categories-form');

    let formData = new FormData(form);

    $.ajax({
        url: 'models/book/get-suggested-books.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success:function(books){
            sectionGenerator("suggested-books","sugested-books-articles-container","Books Recommended For You",bookArticleGenerator,books,"books")
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    })
}

function addToCart(id){

    let cookieValue = document.cookie.replace(/(?:(?:^|.*;\s*)cart\s*\=\s*([^;]*).*$)|^.*$/, "$1");
    cookieValue = decodeURIComponent(cookieValue.replace(/\+/g, ' '));

    if(!cookieValue){
        window.location.href = `index.php?page=login`;
        return;
    }

    let cart = JSON.parse(cookieValue);
    console.log(" ");
    console.log("JS:");
    cart.forEach(car=>{
        console.log(car);
    })

    let item = cart.find(x=>x.id == id);

    if(item == null){
        item = {
            id : id,
            quantity:1
        }
        cart.push(item);
    }else{
        item.quantity++;
    }
    
    let jsonString = JSON.stringify(cart);
    document.cookie = `cart=${jsonString};path=/;`;

    $.ajax({
        url: 'models/cart/cart-logic.php',
        type: 'POST',
        data: {},
        contentType: false,
        processData: false,
        success: function(response) {
            console.log(" ")
            console.log("PHP:")
            console.log(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function sectionGenerator(locationId,setId,heading,callback,data,typeOfArticle){

    let articleWidth;
    let articleGap;

    let section = document.getElementById(locationId);



    let headingTag = document.createElement("h2");
    headingTag.innerText = heading;
    headingTag.classList.add("section-heading");



    let articleContainerTag = document.createElement("div");
    articleContainerTag.classList.add("article-container");
    articleContainerTag.setAttribute("id",setId);

    for(let i=0; i<data.length;i++){
        let article;

        if(typeOfArticle == "books"){
           article = callback(data[i],false,true);
           articleWidth = 180;
           articleGap = 40;
           articleContainerTag.classList.add("article-book-container");
        }else if(typeOfArticle == "category"){
           article = callback(data[i].id);
           articleWidth = 250;
           articleGap = 20;
           articleContainerTag.classList.add("article-category-container");
        }else if(typeOfArticle == "info"){
            article = callback(data[i]);
            articleWidth = 220;
            articleGap = 20;
            articleContainerTag.classList.add("article-info-container");
        }
        else{

            let parametar = window.location.href.split('?');
            let nameAndValue = parametar[1].split('=');
            let idSkip = nameAndValue[1];
        
            if(data[i].id == idSkip)continue;

            article = callback(data[i].id);
            articleWidth = 180;
            articleGap = 40;
            articleContainerTag.classList.add("article-author-container");
        }


        articleContainerTag.appendChild(article);
    }

    section.appendChild(headingTag);
    section.appendChild(articleContainerTag);

    // Adding scrolling functionality

    // Creating left and right angle container
    let leftAngleDiv = document.createElement("div");
    let rightAngleDiv = document.createElement("div");
    
    leftAngleDiv.setAttribute("id",setId + "-left-angle-container");
    rightAngleDiv.setAttribute("id",setId + "-right-angle-container");

    leftAngleDiv.classList.add("angle-container");
    rightAngleDiv.classList.add("angle-container");

    // Addiing left and right angle icons
    leftAngleDiv.innerHTML = '<i class="fa-solid fa-angle-left"></i>';
    rightAngleDiv.innerHTML = '<i class="fa-solid fa-angle-right"></i>';

    leftAngleDiv.style.left = '-20px';
    rightAngleDiv.style.right = '-20px';

    leftAngleDiv.style.bottom = (articleContainerTag.offsetHeight/2 -20) + "px";
    rightAngleDiv.style.bottom = (articleContainerTag.offsetHeight/2 -20) + "px";



    section.appendChild(leftAngleDiv);
    section.appendChild(rightAngleDiv);

    checkAngleVisibility(setId,`${setId}-left-angle-container`,`${setId}-right-angle-container`);



    $(document).on("click",`#${setId}-left-angle-container`,()=>{
        scrollLeft(setId,articleWidth,articleGap,`${setId}-left-angle-container`,`${setId}-right-angle-container`);
    });
    $(document).on("click",`#${setId}-right-angle-container`,()=>{
        scrollRight(setId,articleWidth,articleGap,`${setId}-left-angle-container`,`${setId}-right-angle-container`);
        
    });

    $(document).on("wheel",`#${setId}`,()=>{
        checkAngleVisibility(setId,`${setId}-left-angle-container`,`${setId}-right-angle-container`);
    })

    window.addEventListener("resize",()=>{
        checkAngleVisibility(setId,`${setId}-left-angle-container`,`${setId}-right-angle-container`);
    })
}

function createAngleFunctionality(locationId,articleClass, setId, typeOfArticle){
    let section = document.getElementById(locationId);
    articleContainerTag = document.querySelector(articleClass);

    let articleWidth;
    let articleGap;

    switch (typeOfArticle){
        case 'books':
            articleWidth = 180;
            articleGap = 40;
            break;
        case 'category':
            articleWidth = 250;
            articleGap = 20;
            break;
        case 'info':
            articleWidth = 220;
            articleGap = 20;
            break;
        case 'author':
            articleWidth = 180;
            articleGap = 40;
            break;
    }


    let leftAngleDiv = document.createElement("div");
    let rightAngleDiv = document.createElement("div");

    leftAngleDiv.setAttribute("id",setId + "-left-angle-container");
    rightAngleDiv.setAttribute("id",setId + "-right-angle-container");

    leftAngleDiv.classList.add("angle-container");
    rightAngleDiv.classList.add("angle-container");

    leftAngleDiv.innerHTML = '<i class="fa-solid fa-angle-left"></i>';
    rightAngleDiv.innerHTML = '<i class="fa-solid fa-angle-right"></i>';

    leftAngleDiv.style.left = '-20px';
    rightAngleDiv.style.right = '-20px';

    leftAngleDiv.style.bottom = (articleContainerTag.offsetHeight/2 -20) + "px";
    rightAngleDiv.style.bottom = (articleContainerTag.offsetHeight/2 -20) + "px";

    section.appendChild(leftAngleDiv);
    section.appendChild(rightAngleDiv);

    checkAngleVisibility(setId,`${setId}-left-angle-container`,`${setId}-right-angle-container`);

    $(document).on("click",`#${setId}-left-angle-container`,()=>{
        scrollLeft(setId,articleWidth,articleGap,`${setId}-left-angle-container`,`${setId}-right-angle-container`);
    });
    $(document).on("click",`#${setId}-right-angle-container`,()=>{
        scrollRight(setId,articleWidth,articleGap,`${setId}-left-angle-container`,`${setId}-right-angle-container`);
    });

    $(document).on("wheel",`#${setId}`,()=>{
        checkAngleVisibility(setId,`${setId}-left-angle-container`,`${setId}-right-angle-container`);
    })

    window.addEventListener("resize",()=>{
        checkAngleVisibility(setId,`${setId}-left-angle-container`,`${setId}-right-angle-container`);
    })
    
}

function scrollRight(id,articleWidth,gap,idLeft,idRight){
    let container = document.getElementById(id);
    let widthOfAnArticle = articleWidth + gap;
    
    let widthScrolled = Math.ceil(container.scrollLeft/widthOfAnArticle) * widthOfAnArticle;
    let articlesThatCanFit = Math.floor(container.clientWidth/widthOfAnArticle) * widthOfAnArticle;

    container.scrollLeft = widthScrolled+ articlesThatCanFit;

    let leftAngle = document.getElementById(idLeft);
    leftAngle.style.display = "grid";
    let rightAngle = document.getElementById(idRight);
    if((container.scrollWidth-container.clientWidth) <= widthScrolled+ articlesThatCanFit){
        rightAngle.style.display = "none";
    }else{
        rightAngle.style.display = "grid";
    }


}

function scrollLeft(id,articleWidth,gap,idLeft,idRight){
    let container = document.getElementById(id);
    let widthOfAnArticle = articleWidth + gap;

    let scrollRightWidth = container.scrollWidth - container.scrollLeft - container.clientWidth;

    let articlesThatCanFit = Math.floor(container.clientWidth/widthOfAnArticle) * widthOfAnArticle;
    let rightWidthScrolled = Math.ceil(scrollRightWidth/widthOfAnArticle) * widthOfAnArticle;


    container.scrollLeft =container.scrollWidth - (rightWidthScrolled + articlesThatCanFit + container.clientWidth) ;

    let rightAngle = document.getElementById(idRight);
    rightAngle.style.display = "grid";
    let leftAngle = document.getElementById(idLeft);
    
    if((container.scrollWidth - (rightWidthScrolled + articlesThatCanFit + container.clientWidth))<=0){
        leftAngle.style.display = "none";
    }else{
        leftAngle.style.display = "grid";
    }
}

function checkAngleVisibility(idElement,idLeft,idRight){
    let container = document.getElementById(idElement);

    let leftAngle = document.getElementById(idLeft);
    let rightAngle = document.getElementById(idRight);

    if(container.scrollLeft == 0){
        leftAngle.style.display = "none";
    }else{
        leftAngle.style.display = "grid";
    }

    if((container.scrollWidth - (container.scrollLeft + container.clientWidth)) >0 ){
        rightAngle.style.display = "grid";
    }else{
        rightAngle.style.display = "none";
    }
}

function setEventsForWriterBooksPage(){
    let deleteBooks = document.querySelectorAll('.delete-book');
    deleteBooks.forEach(book => {
        book.addEventListener('click', () => {
            let form = book.closest('form');
            sendDeleteBookFormWrter(form);
        });
    });

    let activateBooks = document.querySelectorAll('.activate-book');
    activateBooks.forEach(book => {
        book.addEventListener('click', () => {
            let form = book.closest('form');
            sendActivateBookFormWriter(form);
        });
    });

}

function populateWriterBooksTables(books){
    console.log(books);
    let activeBooks = books[0].activeBooks;
    let deletedBooks = books[0].deletedBooks;

    let activeBooksTable = document.querySelector('#table-active-books tbody');
    let deletedBooksTable = document.querySelector('#table-deleted-books tbody');

    while(activeBooksTable.firstChild)activeBooksTable.removeChild(activeBooksTable.firstChild);
    while(deletedBooksTable.firstChild)deletedBooksTable.removeChild(deletedBooksTable.firstChild);

    activeBooks.forEach(book=>{
        let trTag = document.createElement('tr');

        let tdTagImg = document.createElement('td');
        let tdTagTitle = document.createElement('td');
        let tdTagPrice = document.createElement('td');
        let tdTagReleaseDate = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagDelete = document.createElement('td');

        tdTagImg.classList.add('td-image');

        imgTag = document.createElement('img');
        imgTag.setAttribute('src',`assets/images/books/small/${book.src}`);
        imgTag.setAttribute('alt',`${book.name}`);

        tdTagImg.appendChild(imgTag);

        tdTagTitle.textContent = book.name;
        tdTagPrice.textContent = '$' + book.price + '.00';
        tdTagReleaseDate.textContent = book.release_date;

        let aTag = document.createElement('a');
        aTag.classList.add('safe-option','change-links');
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`index.php?page=update-book&book-id=${book.id}`);
        tdTagChange.appendChild(aTag);

        let formDelete = document.createElement('form');

        let inputBookIdDelete = document.createElement('input');
        inputBookIdDelete.setAttribute('type','text');
        inputBookIdDelete.setAttribute('name','book-id');
        inputBookIdDelete.style.display = 'none';
        inputBookIdDelete.value = book.id;

        let inputWriterIdDelete = document.createElement('input');
        inputWriterIdDelete.setAttribute('type','text');
        inputWriterIdDelete.setAttribute('name','writer-id');
        inputWriterIdDelete.setAttribute('value',`${book.writer_id}`);
        inputWriterIdDelete.style.display = 'none';
        inputWriterIdDelete.value = book.writer_id;


        let inputButtonDelete = document.createElement('input');
        inputButtonDelete.setAttribute('type','button');
        inputButtonDelete.classList.add('danger-option','delete-book');
        inputButtonDelete.setAttribute('value',`${book.book_id}`);
        inputButtonDelete.value = 'Delete';

        formDelete.appendChild(inputBookIdDelete);
        formDelete.appendChild(inputWriterIdDelete);
        formDelete.appendChild(inputButtonDelete);
        tdTagDelete.appendChild(formDelete);

        trTag.appendChild(tdTagImg);
        trTag.appendChild(tdTagTitle);
        trTag.appendChild(tdTagPrice);
        trTag.appendChild(tdTagReleaseDate);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagDelete);

        activeBooksTable.appendChild(trTag);
    })


    deletedBooks.forEach(book=>{
        let trTag = document.createElement('tr');

        let tdTagImg = document.createElement('td');
        let tdTagTitle = document.createElement('td');
        let tdTagPrice = document.createElement('td');
        let tdTagReleaseDate = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagActivate = document.createElement('td');

        tdTagImg.classList.add('td-image');

        imgTag = document.createElement('img');
        imgTag.setAttribute('src',`assets/images/books/small/${book.src}`);
        imgTag.setAttribute('alt',`${book.name}`);

        tdTagImg.appendChild(imgTag);

        tdTagTitle.textContent = book.name;
        tdTagPrice.textContent = '$' + book.price + '.00';
        tdTagReleaseDate.textContent = book.release_date;

        let aTag = document.createElement('a');
        aTag.classList.add('safe-option','change-links');
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`index.php?page=update-book&book-id=${book.id}`);
        tdTagChange.appendChild(aTag);

        let formActivate = document.createElement('form');

        let inputBookIdActivate = document.createElement('input');
        inputBookIdActivate.setAttribute('type','text');
        inputBookIdActivate.setAttribute('name','book-id');
        //inputBookIdActivate.setAttribute('value',`${book.id}`);
        inputBookIdActivate.style.display = 'none';
        inputBookIdActivate.value = book.id;

        let inputWriterIdActivate = document.createElement('input');
        inputWriterIdActivate.setAttribute('type','text');
        inputWriterIdActivate.setAttribute('name','writer-id');
        //inputWriterIdActivate.setAttribute('value',`${book.writer_id}`);
        inputWriterIdActivate.style.display = 'none';
        inputWriterIdActivate.value = book.writer_id;


        let inputButtonActivate = document.createElement('input');
        inputButtonActivate.setAttribute('type','button');
        inputButtonActivate.classList.add('safe-option','activate-book');
        inputButtonActivate.value = 'Activate';

        formActivate.appendChild(inputBookIdActivate);
        formActivate.appendChild(inputWriterIdActivate);
        formActivate.appendChild(inputButtonActivate);
        tdTagActivate.appendChild(formActivate);

        trTag.appendChild(tdTagImg);
        trTag.appendChild(tdTagTitle);
        trTag.appendChild(tdTagPrice);
        trTag.appendChild(tdTagReleaseDate);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagActivate);

        deletedBooksTable.appendChild(trTag);
    })

    setTableZebra();
    setEventsForWriterBooksPage();
}

function sendActivateBookFormWriter(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/book/activate-book.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            populateWriterBooksTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function sendDeleteBookFormWrter(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/book/delete-book.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            populateWriterBooksTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function setEventsForDeliveryTypesTable(){
    let deleteDeliveryTypes = document.querySelectorAll('.delete-delivery-type');
    deleteDeliveryTypes.forEach(deleteDeliveryType => {
        deleteDeliveryType.addEventListener('click', () => {
            let form = deleteDeliveryType.closest('form');
            sendDeleteDeliveryTypeForm(form);
        });
    });

    let activateDeliveryTypes = document.querySelectorAll('.activate-delivery-type');
    activateDeliveryTypes.forEach(activateDeliveryType => {
        activateDeliveryType.addEventListener('click', () => {
            let form = activateDeliveryType.closest('form');
            sendActivateDeliveryTypeForm(form);
        });
    });

    let changeLinks = document.querySelectorAll('.change-links');
    changeLinks.forEach(link=>{
        link.addEventListener('click',()=>{
            let deliveryTypeId = link.getAttribute('data-delivery-type-id');
            let deliveryTypeName = link.getAttribute('data-delivery-type-name');

            let inputId = document.getElementById('delivery-type-id');
            let inputName = document.getElementById('delivery-type-name');

            inputId.setAttribute('value',deliveryTypeId);
            inputName.value = deliveryTypeName;
            document.getElementById('delivery-type-form').style.display = 'block';
        })
    })
}

function selectBookCategories(){
    let allCategories = document.querySelectorAll(".book-category-cb");
    let bookId = document.getElementById('book-id-js').value;

    $.ajax({
        url: `models/book/get-book-active-categories.php?book-id=${bookId}`,
        type: 'GET',
        contentType: 'json',
        success: function(response) {
            console.log(response);
            for(let i=0; i<allCategories.length;i++){

                for(let j=0; j<response.length;j++){
                    if(allCategories[i].value == response[j].category_id){
                        allCategories[i].checked = true;
                        break;
                    }
                }
            }
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function setUpdateBookForm(){

    $(document).on('change','#book-image-js',uploadBookImage);

    $(document).on('blur','#book-title-title-js',()=>{
        checkInputElementIfEmpty('book-title-title-js','book-title-error')
    })

    $(document).on('blur','#page-count-input-js',()=>{
        checkInputElementIfEmpty('page-count-input-js','page-count-error')
    })

    $(document).on('blur','#price-input-js',()=>{
        checkInputElementIfEmpty('price-input-js','price-error')
    })

    $(document).on('blur','#book-description-input-js',()=>{
        checkInputElementIfEmpty('book-description-input-js','book-description-error')
    })

    $(document).on('blur','#release-date-input-js',()=>{
        checkInputDate()
    })

    let parentCategories = document.querySelectorAll('.category-parent ul');

    parentCategories.forEach(parentCat=>{
        parentCat.style.display = 'none';
    })


    $('.category-parent').on('click', function() {
        let nestedUl = $(this).find('ul');
        nestedUl.toggle();
    });

    $('.book-category-cb').on('click', function(event) {
        event.stopPropagation();
    }); 

    $('.book-category-li label').on('click', function(event) {
        event.stopPropagation();
    }); 



    $(document).on('click','#update-book',sendUpdateBookData);
}

function sendUpdateBookData(){
    let errorCount = 0;

    let imageUploadInput = document.getElementById('book-image-js');
    if (imageUploadInput.files && imageUploadInput.files[0]){
        errorCount += checkBookImg();
    }

    errorCount += checkInputElementIfEmpty('book-title-title-js','book-title-error')
    errorCount += checkInputElementIfEmpty('page-count-input-js','page-count-error')
    errorCount += checkInputElementIfEmpty('book-description-input-js','book-description-error')
    errorCount += checkInputElementIfEmpty('price-input-js','price-error')
    errorCount += checkInputDate();
    errorCount += checkCategoriesCheckBoxes();


    if(errorCount){
        return;
    }

    let form = document.getElementById('update-book-form');
    let formData = new FormData(form);

    $.ajax({
        url: 'models/book/update-book.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {

            window.location.href = `index.php?page=writer-books&writer-id=${response[0]}`;
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function sendDeleteDeliveryTypeForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/delivery/delete-delivery-type.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            populateDeliveryTypesTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function setEventsForDeliveryTypesPage(){
    $(document).on('blur','#delivery-type-name',()=>{
        checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/,'delivery-type-name','delivery-type-name-error');
    })

    $(document).on('click','#cancel-button',()=>{
        document.getElementById('delivery-type-name-error').style.display = 'none';
        document.getElementById('delivery-type-name').value = '';
        document.getElementById('delivery-type-form').style.display = 'none';
        let inputElement = document.getElementById('delivery-type-id');
        inputElement.setAttribute('value','0');
    });

    $(document).on('click','#add-delivery-type-button',()=>{
        document.getElementById('delivery-type-form').style.display = 'block';
        let inputElement = document.getElementById('delivery-type-id');
        inputElement.setAttribute('value','0');
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    $(document).on('click','#save-button',()=>{
        let form = document.getElementById('delivery-type-form');
        let errorCount = 0;
        errorCount += checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/,'delivery-type-name','delivery-type-name-error');

        if(errorCount){
            return;
        }

        sendDeliveryTypeForm(form);
    });
}

function populateDeliveryTypesTables(deliveryTypes){
    let activeDeliveryTypes = deliveryTypes[0].activeDeliveryTypes;
    let deletedDeliveryTypes = deliveryTypes[0].deletedDeliveryTypes;

    let aciteDeliveryTypesTable = document.querySelector('#table-active-delivery-types tbody');
    let deletedDeliveryTypesTable = document.querySelector('#table-deleted-delivery-types tbody');

    while(aciteDeliveryTypesTable.firstChild)aciteDeliveryTypesTable.removeChild(aciteDeliveryTypesTable.firstChild);
    while(deletedDeliveryTypesTable.firstChild)deletedDeliveryTypesTable.removeChild(deletedDeliveryTypesTable.firstChild);

    
    activeDeliveryTypes.forEach(deliveryType=>{
        let trTag = document.createElement('tr');

        let tdTagName = document.createElement('td');
        let tdTagOrderCount = document.createElement('td');
        let tdTagCreatedAt = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagDelete = document.createElement('td');

        tdTagName.textContent = deliveryType.name;
        tdTagOrderCount.textContent = deliveryType.order_count;
        tdTagCreatedAt.textContent = deliveryType.created_at;

        let aTag = document.createElement('a');
        aTag.classList.add('safe-option','change-links');
        aTag.setAttribute('data-delivery-type-id',deliveryType.id);
        aTag.setAttribute('data-delivery-type-name',deliveryType.name);
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`#`);
        tdTagChange.appendChild(aTag);

        let formDelete = document.createElement('form');

        let inputDeliveryTypeIdDelete = document.createElement('input');
        inputDeliveryTypeIdDelete.setAttribute('type','text');
        inputDeliveryTypeIdDelete.setAttribute('name','delivery-type-id');
        inputDeliveryTypeIdDelete.style.display = 'none';
        inputDeliveryTypeIdDelete.value = deliveryType.id;

        let inputButtonDelete = document.createElement('input');
        inputButtonDelete.setAttribute('type','button');
        inputButtonDelete.classList.add('danger-option','delete-delivery-type');
        inputButtonDelete.value = 'Delete';

        formDelete.appendChild(inputDeliveryTypeIdDelete);
        formDelete.appendChild(inputButtonDelete);
        tdTagDelete.appendChild(formDelete);

        trTag.appendChild(tdTagName);
        trTag.appendChild(tdTagOrderCount);
        trTag.appendChild(tdTagCreatedAt);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagDelete);

        aciteDeliveryTypesTable.appendChild(trTag);
    })


    deletedDeliveryTypes.forEach(deliveryType=>{
        let trTag = document.createElement('tr');

        let tdTagName = document.createElement('td');
        let tdTagOrderCount = document.createElement('td');
        let tdTagDeletedAt = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagActivate = document.createElement('td');

        tdTagName.textContent = deliveryType.name;
        tdTagOrderCount.textContent = deliveryType.order_count;
        tdTagDeletedAt.textContent = deliveryType.deleted_at;

        let aTag = document.createElement('a');
        aTag.setAttribute('data-delivery-type-id',deliveryType.id);
        aTag.setAttribute('data-delivery-type-name',deliveryType.name);
        aTag.classList.add('safe-option','change-links');
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`#`);
        tdTagChange.appendChild(aTag);

        let formActivate = document.createElement('form');

        let inputDeliveryTypeIdActivate = document.createElement('input');
        inputDeliveryTypeIdActivate.setAttribute('type','text');
        inputDeliveryTypeIdActivate.setAttribute('name','delivery-type-id');
        inputDeliveryTypeIdActivate.style.display = 'none';
        inputDeliveryTypeIdActivate.value = deliveryType.id;

        let inputButtonActivate = document.createElement('input');
        inputButtonActivate.setAttribute('type','button');
        inputButtonActivate.classList.add('safe-option','activate-delivery-type');
        inputButtonActivate.value = 'Activate';

        formActivate.appendChild(inputDeliveryTypeIdActivate);
        formActivate.appendChild(inputButtonActivate);
        tdTagActivate.appendChild(formActivate);

        trTag.appendChild(tdTagName);
        trTag.appendChild(tdTagOrderCount);
        trTag.appendChild(tdTagDeletedAt);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagActivate);

        deletedDeliveryTypesTable.appendChild(trTag);
    })

    setEventsForDeliveryTypesTable();
    setTableZebra();
}

function sendActivateDeliveryTypeForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/delivery/activate-delivery-type.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            populateDeliveryTypesTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function sendDeliveryTypeForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/delivery/add-update-delivery-type.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {

            let serverMessagesContainer = document.querySelector('.server-messages');
            serverMessagesContainer.style.display = 'none';
            document.getElementById('delivery-type-name').value = '';
            document.getElementById('delivery-type-form').style.display = 'none';
            let inputElement = document.getElementById('delivery-type-id');
            inputElement.setAttribute('value','0');

            populateDeliveryTypesTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            let serverMessagesContainer = document.querySelector('.server-messages');
            serverMessagesContainer.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function setEventsForCategoriesPage(){
    $(document).on('blur','#category-name',()=>{
        checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž']{2,}( [A-ZŠĐĆČŽ][a-zšđčćž']{2,})*$/,'category-name','category-name-error');
    });


    $(document).on('click','#cancel-button',()=>{
        document.getElementById('category-name-error').style.display = 'none';
        document.getElementById('category-name').value = '';
        document.getElementById('categories-form').style.display = 'none';
        let inputElement = document.getElementById('category-id');
        inputElement.setAttribute('value','0');
    });

    $(document).on('click','#add-subcategory-button',()=>{
        document.getElementById('categories-form').style.display = 'block';
        let inputElement = document.getElementById('category-id');
        inputElement.setAttribute('value','0');
        document.getElementById('select-category-label').style.display = 'block';
        document.getElementById('select-category').style.display = 'block';
        document.getElementById('category-name-error').style.display = 'none';
        let categoryType = document.getElementById('category-type');
        categoryType.setAttribute('value','subcategory');
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });


    $(document).on('click','#add-category-button',()=>{
        document.getElementById('categories-form').style.display = 'block';
        let inputElement = document.getElementById('category-id');
        inputElement.setAttribute('value','0');
        document.getElementById('select-category-label').style.display = 'none';
        document.getElementById('select-category').style.display = 'none';
        document.getElementById('category-name-error').style.display = 'none';

        let categoryType = document.getElementById('category-type');
        categoryType.setAttribute('value','category');
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    $(document).on('click','#save-button',()=>{
        let form = document.getElementById('categories-form');
        let errorCount = 0;
        errorCount += checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž']{2,}( [A-ZŠĐĆČŽ][a-zšđčćž']{2,})*$/,'category-name','category-name-error');

        if(errorCount){
            return;
        }

        sendCategoryForm(form);
    });

}

function sendCategoryForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/category/add-update-categories.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let serverMessagesContainer = document.querySelector('.server-messages');
            serverMessagesContainer.style.display = 'none';
            document.getElementById('category-name').value = '';
            document.getElementById('categories-form').style.display = 'none';
            let inputElement = document.getElementById('category-id');
            inputElement.setAttribute('value','0');

            populateCategoryTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            let serverMessagesContainer = document.querySelector('.server-messages');
            serverMessagesContainer.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function populateCategoryTables(categories){
    let activeCategories = categories[0].activeCategories;
    let deletedCategories = categories[0].deletedCategories;

    let activeCategoriesTable = document.querySelector('#table-active-categories tbody');
    let ddeletedCategoriesTable = document.querySelector('#table-deleted-categories tbody');

    let activeCategoriesSelect = document.querySelector('#select-category');

    while(activeCategoriesSelect.firstChild)activeCategoriesSelect.removeChild(activeCategoriesSelect.firstChild);
    while(activeCategoriesTable.firstChild)activeCategoriesTable.removeChild(activeCategoriesTable.firstChild);
    while(ddeletedCategoriesTable.firstChild)ddeletedCategoriesTable.removeChild(ddeletedCategoriesTable.firstChild);

        
    activeCategories.forEach(category=>{
        let trTag = document.createElement('tr');

        let tdTagName = document.createElement('td');
        let tdTagParentCategory = document.createElement('td');
        let tdTagBookCount = document.createElement('td');
        let tdTagCreatedAt = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagDelete = document.createElement('td');

        tdTagName.textContent = category.name;
        tdTagBookCount.textContent = category.book_count;
        tdTagCreatedAt.textContent = category.created_at;

        tdTagParentCategory.textContent = category.parent ? category.parent : '/';

        let aTag = document.createElement('a');
        aTag.classList.add('safe-option','change-links');
        aTag.setAttribute('data-category-id',category.id);
        aTag.setAttribute('data-category-name',category.name);
        aTag.setAttribute('data-category-type',category.category_id ? 'subcategory' : 'category');
        aTag.setAttribute('data-category-parent-id',category.category_id ? category.category_id : '');
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`#`);
        tdTagChange.appendChild(aTag);

        let formDelete = document.createElement('form');

        let inputCategoryIdDelete = document.createElement('input');
        inputCategoryIdDelete.setAttribute('type','text');
        inputCategoryIdDelete.setAttribute('name','category-id');
        inputCategoryIdDelete.style.display = 'none';
        inputCategoryIdDelete.value = category.id;

        let inputButtonDelete = document.createElement('input');
        inputButtonDelete.setAttribute('type','button');
        inputButtonDelete.classList.add('danger-option','delete-category');
        inputButtonDelete.value = 'Delete';

        formDelete.appendChild(inputCategoryIdDelete);
        formDelete.appendChild(inputButtonDelete);
        tdTagDelete.appendChild(formDelete);

        trTag.appendChild(tdTagName);
        trTag.appendChild(tdTagParentCategory);
        trTag.appendChild(tdTagBookCount);
        trTag.appendChild(tdTagCreatedAt);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagDelete);

        activeCategoriesTable.appendChild(trTag);
    })

    
    deletedCategories.forEach(category=>{
        let trTag = document.createElement('tr');

        let tdTagName = document.createElement('td');
        let tdTagParentCategory = document.createElement('td');
        let tdTagBookCount = document.createElement('td');
        let tdTagDeletedAt = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagActivate = document.createElement('td');

        tdTagName.textContent = category.name;
        tdTagBookCount.textContent = category.book_count;
        tdTagDeletedAt.textContent = category.deleted_at;

        tdTagParentCategory.textContent = category.parent ? category.parent : '/';

        let aTag = document.createElement('a');
        aTag.setAttribute('data-category-id',category.id);
        aTag.setAttribute('data-category-name',category.name);
        aTag.setAttribute('data-category-type',category.category_id ? 'subcategory' : 'category');
        aTag.setAttribute('data-category-parent-id',category.category_id ? category.category_id : '');
        aTag.classList.add('safe-option','change-links');
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`#`);
        tdTagChange.appendChild(aTag);

        let formActivate = document.createElement('form');

        let inputCategoryIdActivate = document.createElement('input');
        inputCategoryIdActivate.setAttribute('type','text');
        inputCategoryIdActivate.setAttribute('name','category-id');
        inputCategoryIdActivate.style.display = 'none';
        inputCategoryIdActivate.value = category.id;

        let inputButtonActivate = document.createElement('input');
        inputButtonActivate.setAttribute('type','button');
        inputButtonActivate.classList.add('safe-option','activate-category');
        inputButtonActivate.value = 'Activate';

        formActivate.appendChild(inputCategoryIdActivate);
        formActivate.appendChild(inputButtonActivate);
        tdTagActivate.appendChild(formActivate);

        trTag.appendChild(tdTagName);
        trTag.appendChild(tdTagParentCategory);
        trTag.appendChild(tdTagBookCount);
        trTag.appendChild(tdTagDeletedAt);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagActivate);

        ddeletedCategoriesTable.appendChild(trTag);
    })

    activeCategories.forEach(category=>{
        if(!category.category_id){
            let option = document.createElement('option');
            option.setAttribute('value',category.id);
            option.textContent = category.name;
            activeCategoriesSelect.appendChild(option);
        }
    })

    setEventsForCategoriesTable();
    setTableZebra();
}

function setEventsForCategoriesTable(){
    let deleteCategories = document.querySelectorAll('.delete-category');
    deleteCategories.forEach(deleteCategory => {
        deleteCategory.addEventListener('click', () => {
            let form = deleteCategory.closest('form');
            sendDeleteCategoryForm(form);
        });
    });

    let activateCategories = document.querySelectorAll('.activate-category');
    activateCategories.forEach(activateCategory => {
        activateCategory.addEventListener('click', () => {
            let form = activateCategory.closest('form');
            sendActivateCategoryForm(form);
        });
    });

    let changeLinks = document.querySelectorAll('.change-links');
    changeLinks.forEach(link=>{
        link.addEventListener('click',()=>{
            let categoryId = link.getAttribute('data-category-id');
            let categoryrName = link.getAttribute('data-category-name');
            let categoryrType = link.getAttribute('data-category-type');
            let categoryParentId = link.getAttribute('data-category-parent-id');

            let inputId = document.getElementById('category-id');
            let inputName = document.getElementById('category-name');
            let inputType = document.getElementById('category-type');

            inputId.setAttribute('value',categoryId);
            inputType.setAttribute('value',categoryrType);
            inputName.value = categoryrName;
            document.getElementById('categories-form').style.display = 'block';

            if(categoryrType == 'subcategory'){
                document.getElementById('select-category').style.display = 'block';
                document.getElementById('select-category').value = Number(categoryParentId) ;
                document.getElementById('select-category-label').style.display = 'block';
            }else{
                document.getElementById('select-category').style.display = 'none';
                document.getElementById('select-category-label').style.display = 'none';
            }
        })
    })
}

function setEventsForPublisherPage(){
    $(document).on('blur','#publisher-name',()=>{
        checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž']{2,}( [A-ZŠĐĆČŽ][a-zšđčćž']{2,})*$/,'publisher-name','publisher-name-error');
    })

    $(document).on('click','#cancel-button',()=>{
        document.getElementById('publisher-name-error').style.display = 'none';
        document.getElementById('publisher-name').value = '';
        document.getElementById('publisher-form').style.display = 'none';
        let inputElement = document.getElementById('publisher-id');
        inputElement.setAttribute('value','0');
    });

    $(document).on('click','#add-publisher-button',()=>{
        document.getElementById('publisher-form').style.display = 'block';
        let inputElement = document.getElementById('publisher-id');
        inputElement.setAttribute('value','0');
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    $(document).on('click','#save-button',()=>{
        let form = document.getElementById('publisher-form');
        let errorCount = 0;
        errorCount += checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž']{2,}( [A-ZŠĐĆČŽ'][a-zšđčćž]{2,})*$/,'publisher-name','publisher-name-error');

        if(errorCount){
            return;
        }

        sendPublisherForm(form);
    });
}

function sendActivateCategoryForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/category/activate-category.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            populateCategoryTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function sendDeleteCategoryForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/category/delete-category.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            populateCategoryTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function setEventsForPublisherTable(){
    let deletePublishers = document.querySelectorAll('.delete-publisher');
    deletePublishers.forEach(deletePublisher => {
        deletePublisher.addEventListener('click', () => {
            let form = deletePublisher.closest('form');
            sendDeletePublisherForm(form);
        });
    });

    let activatePublishers = document.querySelectorAll('.activate-publisher');
    activatePublishers.forEach(activatePublisher => {
        activatePublisher.addEventListener('click', () => {
            let form = activatePublisher.closest('form');
            sendActivatePublisherForm(form);
        });
    });

    let changeLinks = document.querySelectorAll('.change-links');
    changeLinks.forEach(link=>{
        link.addEventListener('click',()=>{
            let publisherId = link.getAttribute('data-publisher-id');
            let publisherName = link.getAttribute('data-publisher-name');

            let inputId = document.getElementById('publisher-id');
            let inputName = document.getElementById('publisher-name');

            inputId.setAttribute('value',publisherId);
            inputName.value = publisherName;
            document.getElementById('publisher-form').style.display = 'block';
        })
    })

}

function sendActivatePublisherForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/publisher/activate-publisher.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            populatePublisherTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function populatePublisherTables(publishers){
    let activePublishers = publishers[0].activePublishers;
    let deletedPublishers = publishers[0].deletedPublishers;

    let acitePublishersTable = document.querySelector('#table-active-publishers tbody');
    let deletedPublishersTable = document.querySelector('#table-deleted-publishers tbody');

    while(acitePublishersTable.firstChild)acitePublishersTable.removeChild(acitePublishersTable.firstChild);
    while(deletedPublishersTable.firstChild)deletedPublishersTable.removeChild(deletedPublishersTable.firstChild);

    activePublishers.forEach(publisher=>{
        let trTag = document.createElement('tr');

        let tdTagName = document.createElement('td');
        let tdTagBookCount = document.createElement('td');
        let tdTagCreatedAt = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagDelete = document.createElement('td');

        tdTagName.textContent = publisher.name;
        tdTagBookCount.textContent = publisher.book_count;
        tdTagCreatedAt.textContent = publisher.created_at;

        let aTag = document.createElement('a');
        aTag.classList.add('safe-option','change-links');
        aTag.setAttribute('data-publisher-id',publisher.id);
        aTag.setAttribute('data-publisher-name',publisher.name);
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`#`);
        tdTagChange.appendChild(aTag);

        let formDelete = document.createElement('form');

        let inputPublisherIdDelete = document.createElement('input');
        inputPublisherIdDelete.setAttribute('type','text');
        inputPublisherIdDelete.setAttribute('name','publisher-id');
        inputPublisherIdDelete.style.display = 'none';
        inputPublisherIdDelete.value = publisher.id;

        let inputButtonDelete = document.createElement('input');
        inputButtonDelete.setAttribute('type','button');
        inputButtonDelete.classList.add('danger-option','delete-publisher');
        inputButtonDelete.value = 'Delete';

        formDelete.appendChild(inputPublisherIdDelete);
        formDelete.appendChild(inputButtonDelete);
        tdTagDelete.appendChild(formDelete);

        trTag.appendChild(tdTagName);
        trTag.appendChild(tdTagBookCount);
        trTag.appendChild(tdTagCreatedAt);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagDelete);

        acitePublishersTable.appendChild(trTag);
    })

    deletedPublishers.forEach(publisher=>{
        let trTag = document.createElement('tr');

        let tdTagName = document.createElement('td');
        let tdTagBookCount = document.createElement('td');
        let tdTagDeletedAt = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagActivate = document.createElement('td');

        tdTagName.textContent = publisher.name;
        tdTagBookCount.textContent = publisher.book_count;
        tdTagDeletedAt.textContent = publisher.deleted_at;

        let aTag = document.createElement('a');
        aTag.setAttribute('data-publisher-id',publisher.id);
        aTag.setAttribute('data-publisher-name',publisher.name);
        aTag.classList.add('safe-option','change-links');
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`#`);
        tdTagChange.appendChild(aTag);

        let formActivate = document.createElement('form');

        let inputPublisherIdActivate = document.createElement('input');
        inputPublisherIdActivate.setAttribute('type','text');
        inputPublisherIdActivate.setAttribute('name','publisher-id');
        inputPublisherIdActivate.style.display = 'none';
        inputPublisherIdActivate.value = publisher.id;

        let inputButtonActivate = document.createElement('input');
        inputButtonActivate.setAttribute('type','button');
        inputButtonActivate.classList.add('safe-option','activate-publisher');
        inputButtonActivate.value = 'Activate';

        formActivate.appendChild(inputPublisherIdActivate);
        formActivate.appendChild(inputButtonActivate);
        tdTagActivate.appendChild(formActivate);

        trTag.appendChild(tdTagName);
        trTag.appendChild(tdTagBookCount);
        trTag.appendChild(tdTagDeletedAt);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagActivate);

        deletedPublishersTable.appendChild(trTag);
    })

    setEventsForPublisherTable();
    setTableZebra();
}

function sendDeletePublisherForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/publisher/delete-publisher.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            populatePublisherTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function sendPublisherForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/publisher/add-update-publisher.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let serverMessagesContainer = document.querySelector('.server-messages');
            serverMessagesContainer.style.display = 'none';
            document.getElementById('publisher-name').value = '';
            document.getElementById('publisher-form').style.display = 'none';
            let inputElement = document.getElementById('publisher-id');
            inputElement.setAttribute('value','0');
            populatePublisherTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            let serverMessagesContainer = document.querySelector('.server-messages');
            serverMessagesContainer.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function setEventsForUserTable(){
    let deleteUsers = document.querySelectorAll('.delete-user');
    deleteUsers.forEach(deleteUser => {
        deleteUser.addEventListener('click', () => {
            let form = deleteUser.closest('form');
            sendDeleteUserForm(form);
        });
    });

    let activateUsers = document.querySelectorAll('.activate-user');
    activateUsers.forEach(activateUser => {
        activateUser.addEventListener('click', () => {
            let form = activateUser.closest('form');
            sendActivateUserForm(form);
        });
    });

    let banUsers = document.querySelectorAll('.ban-user');
    banUsers.forEach(banUser => {
        banUser.addEventListener('click', () => {
            let form = banUser.closest('form');
            sendBanUserForm(form);
        });
    });

    let unbanUsers = document.querySelectorAll('.unban-user');
    unbanUsers.forEach(unbanUser => {
        unbanUser.addEventListener('click', () => {
            let form = unbanUser.closest('form');
            sendUnbanUserForm(form);
        });
    });
}

function populateUserTables(users){
    let activeUsers = users[0].activeUsers;
    let deletedUsers = users[0].deletedUsers;
    let bannedUsers = users[0].bannedUsers;

    let aciteUsersTable = document.querySelector('#table-active-users tbody');
    let deletedUsersTable = document.querySelector('#table-deleted-users tbody');
    let bannedUsersTable = document.querySelector('#table-banned-users tbody');

    while(aciteUsersTable.firstChild)aciteUsersTable.removeChild(aciteUsersTable.firstChild);
    while(deletedUsersTable.firstChild)deletedUsersTable.removeChild(deletedUsersTable.firstChild);
    while(bannedUsersTable.firstChild)bannedUsersTable.removeChild(bannedUsersTable.firstChild);

    activeUsers.forEach(user=>{
        let trTag = document.createElement('tr');

        let tdTagUsername = document.createElement('td');
        let tdTagEmail = document.createElement('td');
        let tdTagRole = document.createElement('td');
        let tdTagCreatedAt = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagBan = document.createElement('td');
        let tdTagDelete = document.createElement('td');

        tdTagUsername.textContent = user.username;
        tdTagEmail.textContent = user.email;
        tdTagRole.textContent = user.name;
        tdTagCreatedAt.textContent = user.created_at;

        let aTag = document.createElement('a');
        aTag.classList.add('safe-option');
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`index.php?page=user-profile&selected-user=${user.id}`);
        tdTagChange.appendChild(aTag);

        let formBan = document.createElement('form');

        let inputUserId = document.createElement('input');
        inputUserId.setAttribute('type','text');
        inputUserId.setAttribute('name','userId');
        inputUserId.style.display = 'none';
        inputUserId.value = user.id;

        let inputButtonBan = document.createElement('input');
        inputButtonBan.setAttribute('type','button');
        inputButtonBan.classList.add('danger-option','ban-user');
        inputButtonBan.value = 'Ban';

        formBan.appendChild(inputUserId);
        formBan.appendChild(inputButtonBan);
        tdTagBan.appendChild(formBan);


        let formBDelete = document.createElement('form');

        let inputUserIdDelete = document.createElement('input');
        inputUserIdDelete.setAttribute('type','text');
        inputUserIdDelete.setAttribute('name','userId');
        inputUserIdDelete.style.display = 'none';
        inputUserIdDelete.value = user.id;

        let inputButtonDelete = document.createElement('input');
        inputButtonDelete.setAttribute('type','button');
        inputButtonDelete.classList.add('danger-option','delete-user');
        inputButtonDelete.value = 'Delete';

        formBDelete.appendChild(inputUserIdDelete);
        formBDelete.appendChild(inputButtonDelete);
        tdTagDelete.appendChild(formBDelete);

        trTag.appendChild(tdTagUsername);
        trTag.appendChild(tdTagEmail);
        trTag.appendChild(tdTagRole);
        trTag.appendChild(tdTagCreatedAt);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagBan);
        trTag.appendChild(tdTagDelete);

        aciteUsersTable.appendChild(trTag);
    })

    deletedUsers.forEach(user=>{
        let trTag = document.createElement('tr');

        let tdTagUsername = document.createElement('td');
        let tdTagEmail = document.createElement('td');
        let tdTagRole = document.createElement('td');
        let tdTagCreatedAt = document.createElement('td');
        let tdTagDeletedAt = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagActivate = document.createElement('td');

        tdTagUsername.textContent = user.username;
        tdTagEmail.textContent = user.email;
        tdTagRole.textContent = user.name;
        tdTagCreatedAt.textContent = user.created_at;
        tdTagDeletedAt.textContent = user.deleted_at;

        let aTag = document.createElement('a');
        aTag.classList.add('safe-option');
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`index.php?page=user-profile&selected-user=${user.id}`);
        tdTagChange.appendChild(aTag);

        let formActivate = document.createElement('form');

        let inputUserId = document.createElement('input');
        inputUserId.setAttribute('type','text');
        inputUserId.setAttribute('name','userId');
        inputUserId.style.display = 'none';
        inputUserId.value = user.id;

        let inputButtonActivate = document.createElement('input');
        inputButtonActivate.setAttribute('type','button');
        inputButtonActivate.classList.add('safe-option','activate-user');
        inputButtonActivate.value = 'Activate';

        formActivate.appendChild(inputUserId);
        formActivate.appendChild(inputButtonActivate);
        tdTagActivate.appendChild(formActivate);


        trTag.appendChild(tdTagUsername);
        trTag.appendChild(tdTagEmail);
        trTag.appendChild(tdTagRole);
        trTag.appendChild(tdTagCreatedAt);
        trTag.appendChild(tdTagDeletedAt);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagActivate);

        deletedUsersTable.appendChild(trTag);
    })


    bannedUsers.forEach(user=>{
        let trTag = document.createElement('tr');

        let tdTagUsername = document.createElement('td');
        let tdTagEmail = document.createElement('td');
        let tdTagRole = document.createElement('td');
        let tdTagCreatedAt = document.createElement('td');
        let tdTagBannedAt = document.createElement('td');
        let tdTagChange = document.createElement('td');
        let tdTagAUnban = document.createElement('td');

        tdTagUsername.textContent = user.username;
        tdTagEmail.textContent = user.email;
        tdTagRole.textContent = user.name;
        tdTagCreatedAt.textContent = user.created_at;
        tdTagBannedAt.textContent = user.banned_at;

        let aTag = document.createElement('a');
        aTag.classList.add('safe-option');
        aTag.textContent = 'Change';
        aTag.setAttribute('href',`index.php?page=user-profile&selected-user=${user.id}`);
        tdTagChange.appendChild(aTag);

        let formUnban = document.createElement('form');

        let inputUserId = document.createElement('input');
        inputUserId.setAttribute('type','text');
        inputUserId.setAttribute('name','userId');
        inputUserId.style.display = 'none';
        inputUserId.value = user.id;

        let inputButtonUnban = document.createElement('input');
        inputButtonUnban.setAttribute('type','button');
        inputButtonUnban.classList.add('safe-option','unban-user');
        inputButtonUnban.value = 'Unban';

        formUnban.appendChild(inputUserId);
        formUnban.appendChild(inputButtonUnban);
        tdTagAUnban.appendChild(formUnban);


        trTag.appendChild(tdTagUsername);
        trTag.appendChild(tdTagEmail);
        trTag.appendChild(tdTagRole);
        trTag.appendChild(tdTagCreatedAt);
        trTag.appendChild(tdTagBannedAt);
        trTag.appendChild(tdTagChange);
        trTag.appendChild(tdTagAUnban);

        bannedUsersTable.appendChild(trTag);
    })


    setEventsForUserTable();
    setTableZebra();
}

function sendUnbanUserForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/user/unban-user.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            populateUserTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function sendBanUserForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/user/ban-user.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            populateUserTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function sendActivateUserForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/user/activate-user.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            populateUserTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function sendDeleteUserForm(form){
    let formData = new FormData(form);

    $.ajax({
        url: 'models/user/delete-user.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            let element = document.querySelector('.server-messages');
            element.style.display = 'none';
            populateUserTables(response);
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            let element = document.querySelector('.server-messages');
            element.style.display = 'block';
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function setTableZebra(){
    $("tbody tr:odd").css("background-color","var(--table-tr-bg)")
}

function setUpdateUserForm(){
    $(document).on('change','#user-avatar-js',uploadAvatar);
    $(document).on('blur','#biography-input-js',checkBiography);

    $(document).on('blur','#first-name-input-js',()=>{
        checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/,'first-name-input-js','first-name-error');
    });
    $(document).on('blur','#last-name-input-js',()=>{
        checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/,'last-name-input-js','last-name-error');
    });
    $(document).on('blur','#username-input-js',()=>{
        checkInputElementWithRegex(/^[a-zA-Z0-9.šđžćčČĆŠĐŽ\(\)\/\-_]{5,}$/,'username-input-js','username-error');
    });
    $(document).on('blur','#email-input-js',()=>{
        checkInputElementWithRegex(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,'email-input-js','email-error');
    });
    $(document).on('blur','#phone-input-js',()=>{
        checkInputElementWithRegex(/^\d{5,15}$/,'phone-input-js','phone-error');
    });
    $(document).on('blur','#address-line-input-js',()=>{
        checkInputElementWithRegex(/^[a-zšđžćčA-ZŠĐŽĆČ0-9\s\.\-\#\\/\,]+$/,'address-line-input-js','address-line-error');
    });
    $(document).on('blur','#number-input-js',()=>{
        checkInputElementWithRegex(/^\d+[a-zA-Z]?$/,'number-input-js','number-error');
    });
    $(document).on('blur','#city-input-js',()=>{
        checkInputElementWithRegex(/^([A-ZŠĐŽĆČ][a-zšđžćč]{2,}\s?)+$/,'city-input-js','city-error');
    });
    $(document).on('blur','#state-input-js',()=>{
        checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'state-input-js','state-error');
    });
    $(document).on('blur','#country-input-js',()=>{
        checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'country-input-js','country-error');
    });
    $(document).on('blur','#zip-code-input-js',()=>{
        checkInputElementWithRegex(/^\d{5,15}$/,'zip-code-input-js','zip-code-error');
    });

    $(document).on('click','#save-account-button',saveUpdatedUserData);
}

function saveUpdatedUserData(){
    let errorCount = 0;

    let addresLine = document.getElementById('address-line-input-js').value;
    let addresNumber = document.getElementById('number-input-js').value;
    let city = document.getElementById('city-input-js').value;
    let state = document.getElementById('state-input-js').value;
    let zipCode = document.getElementById('zip-code-input-js').value;
    let country = document.getElementById('country-input-js').value;
    let role = document.getElementById('role-input').value

    errorCount += checkAvatar();
    errorCount += checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/,'first-name-input-js','first-name-error');
    errorCount += checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/,'last-name-input-js','last-name-error');
    errorCount += checkInputElementWithRegex(/^[a-zA-Z0-9.šđžćčČĆŠĐŽ\(\)\/\-_]{5,}$/,'username-input-js','username-error');
    errorCount += checkInputElementWithRegex(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,'email-input-js','email-error');
    errorCount += checkInputElementWithRegex(/^\d{5,15}$/,'phone-input-js','phone-error');
    if(role == 3){
        errorCount += checkBiography();
    }

    if(addresLine.length || addresNumber.length || city.length || state.length || zipCode.length || country.length){
        errorCount += checkInputElementWithRegex(/^[a-zšđžćčA-ZŠĐŽĆČ0-9\s\.\-\#\\/\,]+$/,'address-line-input-js','address-line-error');
        errorCount += checkInputElementWithRegex(/^\d+[a-zA-Z]?$/,'number-input-js','number-error');
        errorCount += checkInputElementWithRegex(/^([A-ZŠĐŽĆČ][a-zšđžćč]{2,}\s?)+$/,'city-input-js','city-error');
        errorCount += checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'state-input-js','state-error');
        errorCount += checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'country-input-js','country-error');
        errorCount += checkInputElementWithRegex(/^\d{5,15}$/,'zip-code-input-js','zip-code-error');
    }

    if(errorCount){
        return;
    }

    let form = document.getElementById('update-user-form');
    let formData = new FormData(form);

    $.ajax({
        url: 'models/user/update-user-info.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            location.reload();
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            displayServerMessages('error-server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function setUserAccount(){
    $(document).on('click','#update-account-button',()=>{
        document.getElementById('user-data').style.display = 'none';
        document.getElementById('update-user-form').style.display = 'block';

        cleareAllServerMessages('success-server-messages');


        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    $(document).on('click','#cancel-account-button',()=>{
        setUserData();

        document.getElementById('user-data').style.display = 'block';
        document.getElementById('update-user-form').style.display = 'none';


        cleareAllServerMessages('error-server-messages');
        clearAllInputErrors();
    });

    $(document).on('click','#delete-account-button',deleteUser)
}

function deleteUser(){
    if(window.confirm("This account will be permanently deleted.")){
        let userId = document.getElementById('user-id').value;
        let data = {
            userId : userId
        }
        $.ajax({
            url: 'models/user/delete-user.php',
            type: 'POST',
            dataType:'json',
            data: data,
            success: function(response) {
                window.location.href = 'index.php?page=home';
            },
            error: function(xhr, status, errorThrown) {
                let messages = JSON.parse(xhr.responseText);
                displayServerMessages('server-messages',messages,'error-message');
    
                console.log(messages)
                console.log(xhr);
                console.log(status, errorThrown);
            }
        });
    }
}

function setUserData(){

    document.getElementById('user-avatar-js').value = "";

    let avatarImg = document.getElementById('user-avatar-img');
    
    let cookie = document.cookie.split(';');

    for(let i=0; i<cookie.length;i++){

        let name = cookie[i].trim().split('=')[0];
        let value = decodeURIComponent(cookie[i].trim().split('=')[1]);

        switch(name){
            case 'avatarSrc':
                avatarImg.setAttribute('src',`../assets/images/avatars/${value}`);
                break;
            case 'firstName':
                document.getElementById('first-name-input-js').value = value;
                document.querySelector('p.first-name-input').textContent = value;
                break;
            case 'lastName':
                document.getElementById('last-name-input-js').value = value;
                document.querySelector('p.last-name-input').textContent = value;
                break;
            case 'username':
                document.getElementById('username-input-js').value = value;
                document.querySelector('p.username-input').textContent = value;
                break;
            case 'email':
                document.getElementById('email-input-js').value = value;
                document.querySelector('p.email-input').textContent = value;
                break;
            case 'phone':
                document.getElementById('phone-input-js').value = value;
                document.querySelector('p.phone-input').textContent = value;
                break;
            case 'biographyText':
                document.getElementById('biography-input-js').value = value;
                document.querySelector('p.biography-input').textContent = value;
                break;
            case 'addressLine':
                document.getElementById('address-line-input-js').value = value == '/' ? '': value;
                document.querySelector('p.address-line-input').textContent = value;
                break;
            case 'addressNumber':
                document.getElementById('number-input-js').value = value == '/' ? '': value;
                document.querySelector('p.number-input').textContent = value;
                break;
            case 'city':
                document.getElementById('city-input-js').value = value == '/' ? '': value;
                document.querySelector('p.city-input').textContent = value;
                break;
            case 'state':
                document.getElementById('state-input-js').value = value == '/' ? '': value;
                document.querySelector('p.state-input').textContent = value;
                break;
            case 'zipCode':
                document.getElementById('zip-code-input-js').value = value == '/' ? '': value;
                document.querySelector('p.zip-code-input').textContent = value;
                break;
            case 'country':
                document.getElementById('country-input-js').value = value == '/' ? '': value;
                document.querySelector('p.country-input').textContent = value;
                break;

        }
    }
}

function setLoginForm(){
    $(document).on('blur','#username-input-js',()=>{
        checkInputElementWithRegex(/^[a-zA-Z0-9.šđžćčČĆŠĐŽ\(\)\/\-_]{5,}$/,'username-input-js','username-error');
    });
    $(document).on('blur','#password-input-js',()=>{
        checkInputElementWithRegex(/^(?=.*[a-zšđčćž])(?=.*[A-ZČĆŽŠĐ])(?=.*\d)(?=.*[._()/\-])[A-ZŠĐĆŽČa-zšđčćž\d._()/\-]{5,}$/,'password-input-js','password-error');
    });

    $(document).on('click','#log-in-button',sendLoginData);
}

function sendLoginData(){
    let errorCount = 0;

    errorCount += checkInputElementWithRegex(/^[a-zA-Z0-9.šđžćčČĆŠĐŽ\(\)\/\-_]{5,}$/,'username-input-js','username-error');
    errorCount += checkInputElementWithRegex(/^(?=.*[a-zšđčćž])(?=.*[A-ZČĆŽŠĐ])(?=.*\d)(?=.*[._()/\-])[A-ZŠĐĆŽČa-zšđčćž\d._()/\-]{5,}$/,'password-input-js','password-error');

    if(errorCount){
        return;
    }

    let form = document.getElementById('login-form');
    let formData = new FormData(form);

    $.ajax({
        url: 'models/login/login.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            // console.log(response);
         window.location.href = 'index.php?page=home';
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });
}

function checkBookImg(){
    let imageUploadInput = document.getElementById('book-image-js');
    let errorMessage = document.getElementById('book-image-error');

    if (imageUploadInput.files && imageUploadInput.files[0]){

        let file = imageUploadInput.files[0];

        let validExtensions = ["jpg", "jpeg", "png"];
        let fileExtension = file.name.split(".").pop().toLowerCase();

        if (!validExtensions.includes(fileExtension)){
            errorMessage.style.display = "block";
            return 1;
        }

        let fileSizeInKB = file.size / 1024;
        if (fileSizeInKB > 700) {
            errorMessage.style.display = "block";
            return 1;
        }

        let img = new Image();
        img.src = URL.createObjectURL(file);

        img.onload = function(){
            if(img.height/img.width < 200/170){
                errorMessage.style.display = "block";
                return 1;
            }
        }
    }else{
        errorMessage.style.display = "block";
        return 1;
    }

    errorMessage.style.display = "none";
    return 0;
}

function uploadBookImage(){
    let bookImgContainer = document.querySelector('.book-image-container-form');
    let imageUploadInput = document.getElementById('book-image-js');

    if (imageUploadInput.files && imageUploadInput.files[0] && !checkBookImg()){
        while(bookImgContainer.firstChild)bookImgContainer.removeChild(bookImgContainer.firstChild);

        let file = imageUploadInput.files[0];
        let fileURL = URL.createObjectURL(file);

        let imgTag = document.createElement('img');
        imgTag.src = fileURL;

        bookImgContainer.appendChild(imgTag)
    }else{
        while(bookImgContainer.firstChild)bookImgContainer.removeChild(bookImgContainer.firstChild);
    }
}

function checkInputElementIfEmpty(idElement,idError){
    let element = document.getElementById(idElement);
    let error = document.getElementById(idError);

    if(element.value == ""){
        error.style.display = "block";
        return 1;
    }

    error.style.display = "none";
    return 0;
}

function checkInputDate(){
    let today = new Date();

    let input = document.getElementById('release-date-input-js').value;


    if (!input) {
        document.getElementById('release-date-error').style.display = 'block'
        return 1;
    }


    let inputDate = new Date(input);

    if (inputDate > today) {

        document.getElementById('release-date-error').style.display = 'block'
        return 1;
    }

    document.getElementById('release-date-error').style.display = 'none'
    return 0;
}

function checkCategoriesCheckBoxes(){
    let checkboxes = document.querySelectorAll('.book-category-cb');

    let isChecked = false;

    checkboxes.forEach((checkbox) => {
      if (checkbox.checked) {
        isChecked = true;
      }
    });

    if(isChecked){
        document.getElementById('book-category-error').style.display = 'none';
        return 0;
    }

    document.getElementById('book-category-error').style.display = 'block';
    return 1;
}

function setInsertBookForm(){

    $(document).on('change','#book-image-js',uploadBookImage);

    $(document).on('blur','#book-title-title-js',()=>{
        checkInputElementIfEmpty('book-title-title-js','book-title-error')
    })

    $(document).on('blur','#page-count-input-js',()=>{
        checkInputElementIfEmpty('page-count-input-js','page-count-error')
    })

    $(document).on('blur','#price-input-js',()=>{
        checkInputElementIfEmpty('price-input-js','price-error')
    })

    $(document).on('blur','#book-description-input-js',()=>{
        checkInputElementIfEmpty('book-description-input-js','book-description-error')
    })

    $(document).on('blur','#release-date-input-js',()=>{
        checkInputDate()
    })

    let parentCategories = document.querySelectorAll('.category-parent ul');

    parentCategories.forEach(parentCat=>{
        parentCat.style.display = 'none';
    })


    $('.category-parent').on('click', function() {
        var nestedUl = $(this).find('ul');
        nestedUl.toggle();
    });

    $('.book-category-cb').on('click', function(event) {
        event.stopPropagation();
    }); 

    $('.book-category-li label').on('click', function(event) {
        event.stopPropagation();
    }); 


    $(document).on('click','#insert-new-book',sendInsertBookData);
}

function clearAllInputBookValues(){
    let bookImgContainer = document.querySelector('.book-image-container-form');
    while(bookImgContainer.firstChild)bookImgContainer.removeChild(bookImgContainer.firstChild);

    document.getElementById('book-image-js').value = "";

    document.getElementById('book-title-title-js').value = "";
    document.getElementById('book-description-input-js').value = "";
    document.getElementById('page-count-input-js').value = "";
    document.getElementById('price-input-js').value = "";
    document.getElementById('release-date-input-js').value = "";
    document.getElementById('publisher-input-js').value = 1;

    let checkboxes = document.querySelectorAll('.book-category-cb');

    checkboxes.forEach((checkbox) => {
        checkbox.checked = false;
    });

}

function clearAllInputBookErrors(){
    document.getElementById('book-image-error').style.display = "none";
    document.getElementById('book-title-error').style.display = "none";
    document.getElementById('page-count-error').style.display = "none";
    document.getElementById('price-error').style.display = "none";
    document.getElementById('release-date-error').style.display = "none";
    document.getElementById('publisher-error').style.display = "none";
    document.getElementById('book-category-error').style.display = "none";
    document.getElementById('book-description-error').style.display = "none";

}

function sendInsertBookData(){
    let errorCount = 0;

    errorCount += checkBookImg();
    errorCount += checkInputElementIfEmpty('book-title-title-js','book-title-error')
    errorCount += checkInputElementIfEmpty('page-count-input-js','page-count-error')
    errorCount += checkInputElementIfEmpty('book-description-input-js','book-description-error')
    errorCount += checkInputElementIfEmpty('price-input-js','price-error')
    errorCount += checkInputDate();
    errorCount += checkCategoriesCheckBoxes();


    if(errorCount){
        return;
    }

    let form = document.getElementById('insert-book-form');
    let formData = new FormData(form);

    $.ajax({
        url: 'models/book/add-book.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            clearAllInputBookValues();
            clearAllInputBookErrors();

            displayServerMessages('server-messages',response,'success-message');
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });

}

function setSignupForm(){
    $(document).on('change','#user-avatar-js',uploadAvatar);
    $(document).on('change','#role-input-js',()=>{
        checkRole();
        setBiography();
    });
    $(document).on('blur','#biography-input-js',checkBiography);

    $(document).on('blur','#first-name-input-js',()=>{
        checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/,'first-name-input-js','first-name-error');
    });
    $(document).on('blur','#last-name-input-js',()=>{
        checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/,'last-name-input-js','last-name-error');
    });
    $(document).on('blur','#username-input-js',()=>{
        checkInputElementWithRegex(/^[a-zA-Z0-9.šđžćčČĆŠĐŽ\(\)\/\-_]{5,}$/,'username-input-js','username-error');
    });
    $(document).on('blur','#password-input-js',()=>{
        checkInputElementWithRegex(/^(?=.*[a-zšđčćž])(?=.*[A-ZČĆŽŠĐ])(?=.*\d)(?=.*[._()/\-])[A-ZŠĐĆŽČa-zšđčćž\d._()/\-]{5,}$/,'password-input-js','password-error');
    });
    $(document).on('blur','#email-input-js',()=>{
        checkInputElementWithRegex(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,'email-input-js','email-error');
    });
    $(document).on('blur','#phone-input-js',()=>{
        checkInputElementWithRegex(/^\d{5,15}$/,'phone-input-js','phone-error');
    });
    $(document).on('blur','#address-line-input-js',()=>{
        checkInputElementWithRegex(/^[a-zšđžćčA-ZŠĐŽĆČ0-9\s\.\-\#\\/\,]+$/,'address-line-input-js','address-line-error');
    });
    $(document).on('blur','#number-input-js',()=>{
        checkInputElementWithRegex(/^\d+[a-zA-Z]?$/,'number-input-js','number-error');
    });
    $(document).on('blur','#city-input-js',()=>{
        checkInputElementWithRegex(/^([A-ZŠĐŽĆČ][a-zšđžćč]{2,}\s?)+$/,'city-input-js','city-error');
    });
    $(document).on('blur','#state-input-js',()=>{
        checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'state-input-js','state-error');
    });
    $(document).on('blur','#country-input-js',()=>{
        checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'country-input-js','country-error');
    });
    $(document).on('blur','#zip-code-input-js',()=>{
        checkInputElementWithRegex(/^\d{5,15}$/,'zip-code-input-js','zip-code-error');
    });

    $(document).on('click','#create-account-button',sendSignupData);
}

function sendSignupData(){
    let errorCount = 0;

    let addresLine = document.getElementById('address-line-input-js').value;
    let addresNumber = document.getElementById('number-input-js').value;
    let city = document.getElementById('city-input-js').value;
    let state = document.getElementById('state-input-js').value;
    let zipCode = document.getElementById('zip-code-input-js').value;
    let country = document.getElementById('country-input-js').value;
    let role = document.getElementById('role-input-js').value;

    errorCount += checkAvatar();
    errorCount += checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/,'first-name-input-js','first-name-error');
    errorCount += checkInputElementWithRegex(/^[A-ZŠĐĆČŽ][a-zšđčćž]{2,}( [A-ZŠĐĆČŽ][a-zšđčćž]{2,})*$/,'last-name-input-js','last-name-error');
    errorCount += checkInputElementWithRegex(/^[a-zA-Z0-9.šđžćčČĆŠĐŽ\(\)\/\-_]{5,}$/,'username-input-js','username-error');
    errorCount += checkInputElementWithRegex(/^(?=.*[a-zšđčćž])(?=.*[A-ZČĆŽŠĐ])(?=.*\d)(?=.*[._()/\-])[A-ZŠĐĆŽČa-zšđčćž\d._()/\-]{5,}$/,'password-input-js','password-error');
    errorCount += checkInputElementWithRegex(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,'email-input-js','email-error');
    errorCount += checkInputElementWithRegex(/^\d{5,15}$/,'phone-input-js','phone-error');
    errorCount += checkRole();
    if(role == 3){
        errorCount += checkBiography();
    }

    if(addresLine.length || addresNumber.length || city.length || state.length || zipCode.length || country.length){
        errorCount += checkInputElementWithRegex(/^[a-zšđžćčA-ZŠĐŽĆČ0-9\s\.\-\#\\/\,]+$/,'address-line-input-js','address-line-error');
        errorCount += checkInputElementWithRegex(/^\d+[a-zA-Z]?$/,'number-input-js','number-error');
        errorCount += checkInputElementWithRegex(/^([A-ZŠĐŽĆČ][a-zšđžćč]{2,}\s?)+$/,'city-input-js','city-error');
        errorCount += checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'state-input-js','state-error');
        errorCount += checkInputElementWithRegex(/^([A-ZŠĐČĆŽ][a-zšđčćž]{2,}\s?)+$/,'country-input-js','country-error');
        errorCount += checkInputElementWithRegex(/^\d{5,15}$/,'zip-code-input-js','zip-code-error');
    }

    if(errorCount){
        return;
    }


    let form = document.getElementById('sign-up-form');
    let formData = new FormData(form);

    $.ajax({
        url: 'models/signup/signup.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            clearAllInputValues();
            clearAllInputErrors();

            displayServerMessages('server-messages',response,'success-message');
        },
        error: function(xhr, status, errorThrown) {
            let messages = JSON.parse(xhr.responseText);
            displayServerMessages('server-messages',messages,'error-message');

            console.log(messages)
            console.log(xhr);
            console.log(status, errorThrown);
        }
    });


}

function cleareAllServerMessages(container){
    let serverMessagesDiv = document.querySelector(`.${container}`);

    while(serverMessagesDiv.firstChild)serverMessagesDiv.removeChild(serverMessagesDiv.firstChild);
}

function clearAllInputErrors(){
    document.getElementById('avatar-error').style.display = "none";
    document.getElementById('first-name-error').style.display = "none";
    document.getElementById('last-name-error').style.display = "none";
    document.getElementById('username-error').style.display = "none";
    document.getElementById('password-error').style.display = "none";
    document.getElementById('email-error').style.display = "none";
    document.getElementById('phone-error').style.display = "none";
    document.getElementById('biography-error').style.display = "none";

    document.getElementById('address-line-error').style.display = "none";
    document.getElementById('number-error').style.display = "none";
    document.getElementById('city-error').style.display = "none";
    document.getElementById('state-error').style.display = "none";
    document.getElementById('zip-code-error').style.display = "none";
    document.getElementById('country-error').style.display = "none";
}

function clearAllInputValues(){
    document.getElementById('user-avatar-js').value = "";

    let avatarImg = document.getElementById('user-avatar-img');
    avatarImg.setAttribute('src','assets/images/avatars/default-avatar.jpg');

    document.getElementById('first-name-input-js').value = "";
    document.getElementById('last-name-input-js').value = "";
    document.getElementById('username-input-js').value = "";
    document.getElementById('password-input-js').value = "";
    document.getElementById('email-input-js').value = "";
    document.getElementById('phone-input-js').value = "";
    document.getElementById('biography-input-js').value = "";

    document.getElementById('address-line-input-js').value = "";
    document.getElementById('number-input-js').value = "";
    document.getElementById('city-input-js').value = "";
    document.getElementById('state-input-js').value = "";
    document.getElementById('zip-code-input-js').value = "";
    document.getElementById('country-input-js').value = "";
}

function displayServerMessages(container,messages,className){
    let serverMessagesDiv = document.querySelector(`.${container}`);
    serverMessagesDiv.style.display = 'block';

    while(serverMessagesDiv.firstChild)serverMessagesDiv.removeChild(serverMessagesDiv.firstChild);

    let ulTag = document.createElement('ul');

    messages.forEach(message => {
        let liTag = document.createElement('li');
        let pTag = document.createElement('p');
        pTag.classList.add(`${className}`);

        pTag.textContent = message;

        liTag.appendChild(pTag);
        ulTag.appendChild(liTag);
    });

    serverMessagesDiv.appendChild(ulTag);
}

function checkInputElementWithRegex(regex,idElement,idErrorElement){
    let element = document.getElementById(`${idElement}`).value;
    let errorMessage = document.getElementById(`${idErrorElement}`);

    if(!regex.test(element)){
        errorMessage.style.display = 'block';
        return 1;
    }

    errorMessage.style.display = 'none';
    return 0;
}

function setBiography(){
    let role = document.getElementById('role-input-js').value;

    let title = document.getElementById('biography-title-js');
    let textarea = document.getElementById('biography-input-js');
    let errorMessage = document.getElementById('biography-error');

    if(role == 3){
        title.style.display = 'block';
        textarea.style.display = 'block';
        textarea.value = " ";
        errorMessage.style.display = 'none';
        return;
    }

    title.style.display = 'none';
    textarea.style.display = 'none';
    errorMessage.style.display = 'none';
}

function uploadAvatar(){

    let userAvatarImg = document.getElementById('user-avatar-img');
    let imageUploadInput = document.getElementById('user-avatar-js');

    if (imageUploadInput.files && imageUploadInput.files[0] && !checkAvatar()){
    
        let file = imageUploadInput.files[0];
        let fileURL = URL.createObjectURL(file);

        userAvatarImg.src = fileURL;
    }else{
        userAvatarImg.setAttribute('src','../assets/images/avatars/default-avatar.jpg');
    }
}

function checkBiography(){
    let biographyRegex = /(\s.*){4,}/;

    let biography = document.getElementById('biography-input-js').value;
    let errorMessage = document.getElementById('biography-error');

    if(!biographyRegex.test(biography)){
        errorMessage.style.display = 'block';
        return 1;
    }

    errorMessage.style.display = 'none';
    return 0;
}

function checkRole(){
    let role = document.getElementById('role-input-js').value;
    if(role == 3 || role == 2){
        return 0;
    }else{
        return 1;
    }
}

function checkAvatar(){

    let imageUploadInput = document.getElementById('user-avatar-js');
    let errorMessage = document.getElementById('avatar-error');

    if (imageUploadInput.files && imageUploadInput.files[0]){

        let file = imageUploadInput.files[0];

        let validExtensions = ["jpg", "jpeg", "png"];
        let fileExtension = file.name.split(".").pop().toLowerCase();

        if (!validExtensions.includes(fileExtension)){
            errorMessage.style.display = "block";
            return 1;
        }

        let fileSizeInKB = file.size / 1024;
        if (fileSizeInKB > 700) {
            errorMessage.style.display = "block";
            return 1;
        }
    }

    errorMessage.style.display = "none";
    return 0;
}

function setHeader(){
    $(document).on("click","#menu-icon-open",openPhoneNavigation);
    $(document).on("click","#menu-icon-close",closePhoneNavigation);
    $(document).on("click","#dark-mode-icon",toggleTheme);
    $(document).on("click","#light-mode-icon",toggleTheme);

    toggleThemeIcon();
}

function closePhoneNavigation(){

    let phoneNav = document.querySelector(".phone-nav");
    phoneNav.classList.remove("nav-entering");
    phoneNav.classList.add("nav-leaving");


    setTimeout(() => {
        $("body").removeClass("pre-loader");
        phoneNav.classList.remove("display-phone-nav");

    }, 450);
}

function toggleThemeIcon(){
    let light = document.getElementById("light-mode-icon");
    let dark = document.getElementById("dark-mode-icon");

    if(document.body.classList.contains("light-mode")){
        dark.style.display= "block";
        light.style.display = "none";
    }else{
        light.style.display= "block";
        dark.style.display = "none";
    }

}

function openPhoneNavigation(){
    let phoneNav = document.querySelector(".phone-nav");

    $("body").addClass("pre-loader");

    phoneNav.classList.add("display-phone-nav");
    phoneNav.classList.add("nav-entering");
    phoneNav.classList.remove("nav-leaving");
}

function toggleThemeIcon(){
    let light = document.getElementById("light-mode-icon");
    let dark = document.getElementById("dark-mode-icon");

    if(document.body.classList.contains("light-mode")){
        dark.style.display= "block";
        light.style.display = "none";
    }else{
        light.style.display= "block";
        dark.style.display = "none";
    }

}

function toggleTheme(){
    let theme;

    if(document.body.classList.contains("light-mode")){
        document.body.classList.remove("light-mode");
        document.body.classList.add("dark-mode");
        toggleThemeIcon()
        theme = "dark";
    }else{
        document.body.classList.add("light-mode");
        document.body.classList.remove("dark-mode");
        toggleThemeIcon()
        theme = "light"
    }

    setItemToLocalStorage("theme", theme);
}

function setThemeClass(){
    prefersDarkScheme = window.matchMedia("(prefers-color-scheme: dark)");
    let currentTheme = getItemFromLocalStorage("theme");

    if (currentTheme == "dark") 
    {
        document.body.classList.toggle("dark-mode");
    } 
    else if (currentTheme == "light") 
    {
        document.body.classList.toggle("light-mode");
    }
    else if(prefersDarkScheme.matches){
        document.body.classList.toggle("dark-mode");
    }else{
        document.body.classList.toggle("light-mode");
    }
}

function getItemFromLocalStorage(name){
    let item =JSON.parse(localStorage.getItem(name));
    return item;
}

function setItemToLocalStorage(name,value){
    localStorage.setItem(name,JSON.stringify(value));
}

function ajaxCallback(file,method,data,result,error){

    if(method == 'GET'){
        $.ajax({
            ulr:file,
            method:'GET',
            dataType:'json',
            success:result,
            error:error
        })
    }

    if(method == 'POST'){
        $.ajax({
            ulr:file,
            method:'POST',
            dataType:'json',
            contentType: false,
            processData: false,
            data:data,
            success:result,
            error:error
        })
    }
}