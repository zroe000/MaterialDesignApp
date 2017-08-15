<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec"
          uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.datepicker.css" />
    <link rel="stylesheet" type="text/css" href="/resources/jquery/dataTables.bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/jquery/responsive.bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/jquery/toastr.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/wysiwyg/bootstrap-wysihtml5.css" />
    <link rel="stylesheet" type="text/css" href="/resources/wysiwyg/pretify.css" />



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







    </style>

    <!--Let browser know website is optimizd for mobile-->


</head>
<body>


<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="/resources/jquery/jquery-1.2.3.min.js"></script>
<script type="text/javascript" src="/resources/jquery/jquery.BlockUI.js"></script>
<script type="text/javascript" src="/resources/jquery/toastr.min.js"></script>
<script type="text/javascript" src="/resources/wysiwyg/bootstrap-wysihtml5-0.3.0.js"></script>
<script type="text/javascript" src="/resources/wysiwyg/bootstrap-wysihtml5.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/locale.js"></script>
<script type="text/javascript" src="/resources/jquery/dataTables.min.js"></script>


<nav class = "navbar navbar-default" role = "navigation" id="topNavBar">

    <div class = "navbar-header">
        <a class = "navbar-brand" href = "#">Mine</a>
    </div>

    <div class="navbar-left" id="leftNavBar">
        <a href="#" >Home</a>
        <a href="#" >My Page</a>
        <a href="#" >Projects</a>
        <a href="#">Help</a>
    </div>
    <div class="navbar-right" id="rightNavBar">
        <c:choose>
            <c:when test="${username eq null}">
                <a href="${pageContext.request.contextPath}/login.htm" id="signIn">Sign-In&nbsp&nbsp</a>
                <a href="${pageContext.request.contextPath}/registration" id="register">Register</a>

            </c:when>
            <c:otherwise>
                <sec:authorize access="hasRole('ROLE_USER')">
                    <!-- For login user -->
                    <c:url value="/j_spring_security_logout" var="logoutUrl" />
                    <form action="${logoutUrl}" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />
                    </form>
                    <script>
                        function formSubmit() {
                            document.getElementById("logoutForm").submit();
                        }

                    </script>

                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <h4 style="color:white">
                            Welcome : ${pageContext.request.userPrincipal.name} | <a
                                href="javascript:formSubmit()"> Logout</a>
                        </h4>
                    </c:if>


                </sec:authorize>
            </c:otherwise>
        </c:choose>




    </div>

</nav>
</nav>

<nav class="navbar navbar-inverse" id="navbarBottom">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li><a class="active" href="#">Overview</a></li>
            <li><a  href="#">Download</a></li>
            <li><a  href="${pageContext.request.contextPath}/activity/viewActivities">Activity</a></li>
            <li><a  href="#">Roadmap</a></li>
            <li><a  href="/project/issue">Issues</a></li>
            <li><a   href="${pageContext.request.contextPath}/issue/newIssue">New Issues</a></li>
            <li><a  href="#">Wiki</a></li>
            <li><a  href="#">Repository</a></li>
        </ul>
    </div>
</nav>

</body>
</html>
<script type="text/javascript">

</script>


