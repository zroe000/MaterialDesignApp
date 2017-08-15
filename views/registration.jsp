
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>

    #leftNavBar{
        margin-top:15px;
    }
    #rightNavBar{
        padding-right: 42px;
        margin-top: 15px;
    }
    .navbar {min-height:13px !important;}
    #topNavBar{
        background:#3E5B76 !important;
    }
    #leftNavBar a{
        color:white !important;
    }
    #rightNavBar a{
        color: white !important;
    }
    .navbar-header a{
        color: white !important;
    }
    .inputBottom{
        margin-bottom:5px;
    }
    .navbar{
        margin-bottom: 0px !important;
        border: 0px solid white !important;
        -webkit-border-radius: 0px;
        -moz-border-radius: 0px;
        border-radius: 0px;

    }
    #navbarBottom{
        background: #507AAA !important;
    }
    .navbar-inverse .navbar-nav>li>a {
        color: #c5c3c3;
    }
    .navbar-brand{
        font-size:23px !important;
    }
    .login {
        margin-top: 25px !important;
        padding: 5px;
        width: auto;
        min-width: 320px;
        max-width: 400px;
        height: 300px;
        background-color: #f3f3f3;
        margin:0 auto;
        border-radius: 10px;
        border: 1px solid #c5c5c5;
        text-align: center;
    }
    .register{
        margin-top: 25px !important;
        padding: 5px;
        width: auto;
        min-width: 320px;
        max-width: 400px;
        height: 83% !important;
        background-color: #f3f3f3;
        margin:0 auto;
        border-radius: 10px;
        border: 1px solid #c5c5c5;
        text-align: center;
    }
    .login-inner {
        margin:0 auto;
        max-width: 380px;
        width: auto;
    }

    .register-inner{
        margin:0 auto;
        max-width: 380px;
        width: auto;
    }
    .login>h4 {
        font-size: 20px;
        margin-left: 5px;
        font-weight: 600;
    }


    .email {
        margin-bottom: 5px;
    }
    .password {
        margin-bottom: 5px;
    }
    .submit {
        margin-top: 5px;
    }
    .error {
        color: red; font-weight: bold;
    }
    .row {
        padding-bottom: 0px !important;
    }
    .toast-top-center {
        top: 12px;
        left: 50%;
        margin-left: -150px;
    }
    @media all and (max-width: 240px) {
        .toast-top-center {
            margin-left: -54px;
        }
    }
    @media all and (min-width: 241px) and (max-width: 320px) {
        .toast-top-center {
            margin-left: -64px;
        }
    }
    @media all and (min-width: 321px) and (max-width: 480px) {
        .toast-top-center {
            margin-left: -96px;
        }
    }
    .control-label{
        float:left !important;
    }
    .form-group{
        height:45px !important;
    }
    #btnRegister{
        margin-top:25px !important;
    }




</style>
<%@ include file="/WEB-INF/views/tiles/template/defaultMenu.jsp" %>
<div class="container" id="registrationForm" >
    <div id="error"></div>
    <div id="sucess"></div>
    <div class="register" id="divRegister">
        <h4>Register Account</h4>
        <form:form class="register-inner" id="formRegister" commandName="userForm" method="POST" action="/login/registration">
            <div class="form-group">
                <label class="control-label">Username</label>
                <form:input path="loginName" type="text" class="form-control inputBottom"  placeholder="Login"  />
            </div>
            <div class="form-group">
                <label class="control-label">Password</label>
                <form:input path="password" id="pass1"  type="password" class="form-control inputBottom" placeholder="Password"  />
            </div>
            <div class="form-group">
                <label class="control-label">Confirm Password</label>
                <span id="confirmMessage" class="confirmMessage"></span>
                <input type="password" id="pass2" class="form-control inputBottom" placeholder="Re-enter Password" onkeyup="checkPass(); return false;" />
            </div>
            <div class="form-group">
                <label class="control-label">First Name</label>
                <form:input path="firstName" type="text" class="form-control inputBottom" placeholder="First Name"  />
            </div>
            <div class="form-group">
                <label class="control-label">Last Name</label>
                <form:input path="lastName" type="text" class="form-control inputBottom" placeholder="Last Name"  />
            </div>
            <div class="form-group">
                <label class="control-label">Email</label>
                <form:input  path ="email" type="text" class="form-control inputBottom" placeholder="Email"  />
            </div>
            <div class="form-group">
                <label class="control-label">Nick Name</label>
                <form:input path="nickName" type="text" class="form-control inputBottom" placeholder="Nick Name"  />
            </div>
            <input class="btn btn-block btn-lg btn-success submit" type="submit" value="Register" id="btnRegister">
        </form:form>

    </div>

</div>
<script type="text/javascript" src="/resources/jquery/jquery.validate.js" ></script>
<script type="text/javascript">
    function checkPass(){
        var pass1= document.getElementById("pass1");
        var pass2= document.getElementById("pass2");
        var confirmMessage=document.getElementById("confirmMessage");
        var goodColor="#66cc66";
        var badColor="#ff6666";
        if(pass1.value == pass2.value){
            pass2.style.backgroundColor = goodColor;
            confirmMessage.style.color = goodColor;
            confirmMessage.innerHTML = "Passwords Match!"
        }else{
            pass2.style.backgroundColor=badColor;
            confirmMessage.style.color=badColor;
            confirmMessage.innerHTML = "Password Do not Match"
        }
    }

    $(document).ready(function() {

        $('#formRegister').submit(function (e) {

            var frm = $('#formRegister');
            e.preventDefault();

            var data = {}
            var Form = this;
            $.each(this, function(i, v){
                var input = $(v);

                data[input.attr("name")] = input.val();

                delete data["undefined"];
            });

            $.ajax({

                contentType: 'application/json; charset=utf-8',
                type: frm.attr('method'),
                url: frm.attr('action'),
                dataType: 'json',
                data: JSON.stringify(data),


                success: function (response) {

                    $("#error").html("");
                    $("#loginName").val("");
                    $("#firstName").val("");
                    $("#lastName").val("");
                    $("#password").val("");
                    $("#nickName").val("");
                    $("#email").val("");

                    userInfo = "";
                    if (response.status == "SUCCESS") {
                        var email = response.result.email;

                        $("#error").removeClass('border');
                        $("#error").html("");
                        toastr.success('You have sucessfully created a user', 'Sucess', {timeOut: 5000})
                        toastr.options.positionClass = 'toast-top-center'
                    } else {
                        $("#error").html("");
                        $("#error").removeClass('border');
                        var loginName = response.result.loginName;
                        var firstName = response.result.firstName;
                        var lastName = response.result.lastName;
                        var email = response.result.email;
                        var nickName = response.result.nickName;
                        var password = response.result.password;

                        if(email.length <= 9 && email.length !=0){
                            userInfo +="<br><b>Email must be atleast 10 characters</b> : "
                        }

                        if(password.length <= 9 && password.length!=0){
                            userInfo +="<br><b>Password must be atleast 10 characters</b> : "
                        }
                        if(loginName.length ==0){

                            userInfo += "<br><b>Login Name must not be empty</b> : "
                        }
                        if(firstName.length ==0){
                            userInfo +="<br><b>First Name must not be empty</b> : "
                        }
                        if(lastName.length ==0){
                            userInfo +="<br><b>Last Name must not be empty</b> : "
                        }
                        if(email.length ==0){
                            userInfo +="<br><b>Email must not be empty</b> : "
                        }
                        if(nickName.length ==0){
                            userInfo +="<br><b>Nick Name must not be empty</b> : "
                        }
                        if(password.length==0){
                            userInfo +="<br><b>Password must not be empty</b> : "
                        }

                        $('#error').css({
                            'border' : '2px solid red',
                            'height' : 'auto',
                            'width' : '400px',
                            'background' : 'rgba(255, 0, 0, 0.24)',
                            'margin-left' : '32%',
                            'margin-top' : '5px',
                            'border-radius' : '4%',
                            'text-align' : 'center'

                        });
                        $('#error').append(userInfo);
                    }


                },
                error: function () {

                    $(this).html("Error!");
                }
            });


        });

    });







</script>