<%@taglib prefix="sec"
          uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        table tr.even {
            background: #CCC;
        }
        .odd{
            background-color:red;
        }
        .even{
            background-color:blue;
        }
        .menu{
            background-color:#ccc;
            list-style: none;
            margin:0;
            padding:0;
            width:10em;
        }
        .menu li {
            margin: 0;
            padding: 5px;
        }
        .menu a {
            color: #333;
        }
        .menuHover {
            background-color: #999;
        }
        #myDiv{
            width:100px;
            height:30px;
            padding:10px;
            border:1px;
        }
        #accordionWrapper {
            margin: 10px;
        }
        #accordionWrapper h3 a {
            text-indent: -9999px;
            height: 150px;
            width: 50px;
            float: left;
        }
        #accordionWrapper .red {
            background: #c00 url(images/red.png) no-repeat;
        }
        #accordionWrapper .green {
            background: #0c0 url(images/green.png) no-repeat;
        }
        #accordionWrapper .blue {
            background: #00c url(images/blue.png) no-repeat;
        }
        #accordionWrapper div.box {
            float: left;
            height: 150px;
            width: 150px;
            border: 0;
            margin: 0;
            /* to cancel the image from .red, etc */
            background-image: none;
        }
        div.question {
            padding: 1em;
        }
        div.errorMessage {
            display: none;
        }
        div.showErrorMessage {
            display: block;
            color: #f00;
            font-weight: bold;
            font-style: italic;
        }
        label.error {
            color: #f00;
            font-style: italic;
        }


    </style>
</head>
<body id="the_offset_parent">
<script type="text/javascript" src="/resources/jquery/jquery-1.2.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js" ></script>
<%@ include file="/WEB-INF/views/tiles/template/defaultMenu.jsp" %>


<h2 style="margin-left:30px">Activity</h2>
<div class="panel" style="margin-left:30px;">
    <div class="row" style="margin-left:30px">
        <div style="display:inline-block">
            <joda:parseDateTime var="parsed" pattern="yy/M/d" value="" />
            <joda:format value="${parsed}" style="L-" />
        </div>
        <div style="display:inline-block">
            <label>-</label>
        </div>
        <div style="display:inline-block">
            <joda:parseDateTime var="parsed" pattern="yy/M/d" value="" />
            <joda:format value="${parsed}" style="L-" />
        </div>
    </div>
    <h3>Date</h3>

</div>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String message="Username is : "+ username + "<br/> Password is :" + password ;
    String rememberMe=  request.getParameter("rememberMe");
    if(rememberMe!=null)
    {
        Cookie usernameCookie = new Cookie("username-cookie", username);
        Cookie passwordCookie = new Cookie("password-cookie", username);
        usernameCookie.setMaxAge(24*60*60);
        passwordCookie.setMaxAge(24*60*60);
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
    }
%>
<strong>
    <%= message %>
</strong>

</body>

</html>
<script type="text/javascript">

</script>