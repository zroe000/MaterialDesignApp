<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/jquery/toastr.min.css" />






</head>
<body>


<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="/resources/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="/resources/jquery/jquery.BlockUI.js"></script>
<script type="text/javascript" src="/resources/jquery/toastr.min.js"></script>


<header>
    <tiles:insertAttribute name="header" />
</header>

<section>
    <tiles:insertAttribute name="menu" />
</section>

<section>
    <tiles:insertAttribute name="body" />
</section>

<footer>
    <tiles:insertAttribute name="footer" />
</footer>



</body>
</html>
