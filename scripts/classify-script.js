const siteId = "479"
const apiKey = "UZHL4jF7Ar8vgsG3V8C1u7yaX3vfeMw1GxLh64ib"

function setContentTracking(element){
    element.setAttribute("custom-attribute" , "include-content-tracking")
}

function setFormAttributes(form){
    form.setAttribute("custom-attribute" , "include-form-tracking")
    form.addEventListener('submit', handleSubmit);
}

function setContentAttributes(element){
    setContentTracking(element)
    setContentListener(element)
}

function setContentListener(element){
    element.addEventListener('input', handleChange);
}

function handleChange(){
    console.log("== Tracking ==");
}

function setButtonAttributes(button){
    button.setAttribute("custom-attribute" , "form-submit")
    button.addEventListener('submit', handleSubmit);
}

function handleSubmit(event){
    event.preventDefault()
    setTimeout(() => {
        event.target.submit()
    }, 100);
}

function initApi(){
    const your_site_id = siteId;
    const your_api_key = apiKey ;
    initXC(your_site_id, your_api_key);
}



function loginForm(){
    let loginForm = document.querySelector('form[data-testid="sign-in-form"]');
    let usernameInput = document.getElementById("user_login")
    let button = document.querySelector('button[data-testid="sign-in-button"]');

    function initLoginForm(){
        setFormAttributes(loginForm )
        setContentAttributes(usernameInput )
        setButtonAttributes(button)

        const inputElement = document.createElement('input');
        inputElement.type = 'hidden';
        inputElement.name = 'username';
        inputElement.value = ' ';
        setContentTracking(inputElement)
        loginForm.appendChild(inputElement);

    }
    
    initLoginForm()
}


function signupForm(){
    const form = document.getElementById("new_new_user")
    const emailInput = document.getElementById("new_user_email")
    const usernameInput = document.getElementById("new_user_username")
    const button = document.querySelector('button[data-testid="new-user-register-button"]');

    function initSignupForm(){
        setFormAttributes(form )
        setContentAttributes(emailInput  )
        setContentAttributes(usernameInput  )
        setButtonAttributes(button)
    }

    initSignupForm()

}


window.onload = function() {
    console.log('%c⚡️ Secured by CrossClassify ⚡️', 'font-size: 20px; color : #333;');

    
    let page = document.body.getAttribute("data-page")
    
    initApi()

    if(page == "sessions:new")
    loginForm()

    if(page == "registrations:new")
    signupForm()


};  