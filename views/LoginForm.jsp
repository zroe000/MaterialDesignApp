<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/jquery/toastr.min.css" />


<title>Bootstrap</title>
<style >
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
        height: 380px;
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
    #errorDiv{
        margin-left: 35%;
        width: 400px;
        margin-top: 30px;
    }
    #titleApp{
        font-size:20px;
        color: rgba(0,0,0,0.6);
        text-shadow: 2px 8px 6px rgba(0,0,0,0.2),
        0px -5px 35px rgba(255,255,255,0.3);
    }





</style>

<!--Let browser know website is optimizd for mobile-->


</head>
<body>


<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="/resources/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="/resources/jquery/jquery.BlockUI.js"></script>
<script type="text/javascript" src="/resources/jquery/toastr.min.js"></script>


<%@ include file="/WEB-INF/views/tiles/template/defaultMenu.jsp" %>
<%
    Cookie[] cookies = request.getCookies();
    String username="";
    String password = "";
    if(cookies!=null)
    {
        for(int i=0;i<cookies.length;i++){
            Cookie cookie = cookies[i];
            if(cookie.getName().equals("username-cookie"))
            {
                username= cookie.getValue();
            }
            else if(cookie.getName().equals("password-cookie"))
            {
                password= cookie.getValue();
            }
        }
    }
%>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">

        <div class="alert alert-danger"  id="errorDiv">

                Your login attempt was not successful due to <br/><br/>
                <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>.

        </div>



</c:if>

<div class="container" id="loginForm" >
    <div class="login">
        <h4 id="titleApp">Mine Bug Tracking System</h4>
        <hr>

        <form name='f' action="<c:url value='/j_spring_security_check' />"
              method='POST'>
            <input type="text" class="form-control email" name="username" id="email-input" placeholder="Enter email" value ="<%= username %>" >
            <input type="password" name="password" class="form-control password" id="password-input" placeholder="Password" value="<%= password %>">
            <label class="checkbox-inline">
                <%--Old version of remember me--%>
           <%--     <input type="checkbox" id="remember" name="_spring_security_remember_me" value="true"> Remember me--%>
                <%--New version of remember me--%>
                <input type="checkbox" id="remember" name="RememberMe" value="true"> Remember me
            </label>
            <input class="btn btn-block btn-lg btn-success submit" type="submit" value="Login">
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
        </form>
    </div>
</div>

</body>
</html>
<script type="text/javascript" src="/resources/jquery/jquery.validate.js" ></script>

