const form = document.querySelector('form');
const error_box = document.querySelector('#error_box');
const register_button = document.querySelector('#register_button');
const userName = form.username;
const email = form.email;
const password = form.password;
const repassword = form.repassword;

const unamePattern = /^[a-zA-Z][a-zA-Z0-9]{4,29}$/;
const emailPattern = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;

userName.addEventListener("keyup", (e)=>{
    if(unamePattern.test(userName.value) && userName.value.length>4){
        userName.style.borderColor = "green";
    }
    else{
        userName.style.borderColor = "red";
    }
});

email.addEventListener("keyup", (e)=>{
    if(emailPattern.test(email.value)){
        email.style.borderColor = "green";
    }
    else{
        email.style.borderColor = "red";
    }
});

password.addEventListener("keyup", (e)=>{
    if(password.value.length>5){
        password.style.borderColor = "green";
    }
    else{
        password.style.borderColor = "red";
    }
});

repassword.addEventListener("keyup", (e)=>{
    if(repassword.value.length>5 && password.value==repassword.value){
        repassword.style.borderColor = "green";
    }
    else{
        repassword.style.borderColor = "red";
    }
});

let err_arr = new Array();
let i =0;
form.addEventListener('submit',(e)=>{
    let flag = true;
    e.preventDefault();

    if(!unamePattern.test(userName.value)){
		flag = false;
		err_arr[i++] = 'Only alphabet and numeric characters allowed in Username !';
    }
	if(!emailPattern.test(email.value)){
		flag = false;
		err_arr[i++] = 'Invalid email!!';
	}
    if(password.value!=repassword.value){
		flag = false;
		err_arr[i++] = 'password and repassword must match!!';
    }

    let err_msg = "<ul>";
    if(flag)
        form.submit();
    else{
        
        error_box.style.display = 'block';
        err_arr.forEach((emsg)=>{
			err_msg +=  "<li>" + emsg + "</li>";
        });
        err_msg+="</ul>";
        // console.log(err_msg);
        error_box.innerHTML = err_msg;
        error_box.scrollIntoView({behavior:"smooth"});
    }
});

register_button.addEventListener('click',()=>{
    i = 0;
    err_arr.length = 0;
    error_box.innerHTML = "";
    error_box.style.display = 'none';
});

userName.addEventListener('focus', removeMsg)
email.addEventListener('focus', removeMsg)
password.addEventListener('focus', removeMsg)
repassword.addEventListener('focus', removeMsg)

function removeMsg(){
    i = 0;
    err_arr.length = 0;
    error_box.innerHTML = "";
	error_box.style.display = 'none';
}