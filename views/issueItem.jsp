<%@taglib prefix="sec"
          uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        #panelLeftAct{
            margin: 20px 1000px 0 0;
            box-shadow: 1px 1px 1px 1px #888888;
        }
        #contentPanel{
            background: #fff;
            border-right: 2px solid #ddd;
            width: 75%;
            background-color: #fff;
            margin: 0px;
            border-right: 1px solid #ddd;
            padding: 6px 10px 10px 10px;
            z-index: 10;

            /*height:100% !important;
            box-shadow: 1px 1px 1px 1px #888888;*/
        }
        #sidebar{
            float: right;
            width: 22%;
            position: relative;
            z-index: 9;
            padding: 0;
            margin: 0;
        }
        #sidebar h3{
            font-size: 14px;
            margin-top: 14px;
            color: #666;
        }
        #sidebar ul li{
            list-style-type:none;
            margin: 0px 2px 0px 0px;
            padding: 0px 0px 0px 0px;
            display: list-item;
            text-align: -webkit-match-parent;
        }
        .trackerPanelItem{
            background: #ffffdd;
            padding: 6px;
            margin-bottom: 6px;
            border: 1px solid #d7d7d7;
            margin-top:-20%;
        }
        .avatar{
            float: left;
            margin: 0 6px 0 0;
            padding: 5px;
        }
        .div.issue div.subject h3{
            margin:0;
            margin-bottom:0.1em;

        }
        table{
            display: table;
            border-collapse: separate;
            border-spacing: 2px;
            border-color: grey;
        }
        table.attributes{
            width:100%;
        }
        tbody{
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
        }
        tr {
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
        }
        hr {
            width: 100%;
            height: 1px;
            background: #ccc;
            border: 0;
        }

        .progress {
            height: 20px;
            margin-bottom: 20px;
            overflow: hidden;
            background-color: #f5f5f5;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,.1);
            box-shadow: inset 0 1px 2px rgba(0,0,0,.1);
        }
        div.trackerPanelItem table.attributes th {
            width: 22%;
        }
        div.trackerPanelItem table.attributes td {
            width: 28%;
        }
        table.attributes th {
            vertical-align: top;
            text-align: left;
        }
        td, th {
            display: table-cell;
            vertical-align: inherit;
        }



    </style>
</head>
<body id="the_offset_parent">
<script type="text/javascript" src="/resources/jquery/jquery-1.2.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js" ></script>
<%@ include file="/WEB-INF/views/tiles/template/defaultMenu.jsp" %>


<div class="panel panel-default">
    <div id="sidebar">
        <h3>Issues</h3>
        <ul>
            <li><a href="#">View All Issues</a></li>
            <li><a href="#">Summary</a></li>
        </ul>
        <h3>Custom Queries</h3>
        <ul>
            <li><a href="#">Documentation issues</a></li>
            <li><a href="#">Open defects</a></li>
            <li><a href="#">Open features</a></li>
            <li><a href="#">Patch queue</a></li>
            <li><a href="#">Plugin issues</a></li>
            <li><a href="#">Translation patches</a></li>
        </ul>
    </div>
    <div class="panel-body" id="contentPanel">

        <div class="row">
            <div class="col-md-9">
                <h4>Patch# ${tskDetail.id}</h4>
            </div>
            <div class="col-md-3">
                <a href="#">
                    <span class="glyphicon glyphicon-pencil" style="margin-right:10px;">Edit</span>
                </a>
                <a href="#">
                    <span class="glyphicon glyphicon-star" style="margin-right:10px;">Watch</span>
                </a>
                <a href="#">
                    <span class="glyphicon glyphicon-file" style="margin-right:10px;">Copy</span>
                </a>
            </div>
        </div>

        <div class="trackerPanelItem">
                <img src="http://www.gravatar.com/avatar/3c80fe933f2d692f6a950d500f6377b7?rating=PG&size=50&default=" class="avatar" />
                <div class="subject">
                    <div>
                        <h4>${tskDetail.subject}</h4>
                    </div>
                </div>
                <p>Author</p>
                <table class="attributes">
                    <tbody>
                        <tr>
                            <th class="status">Status:  </th><td class="status"><c:out value="${tskDetail.status}"/></td><th class="start-date">Start date:</th><td class="start-date"><fmt:formatDate pattern="yyyy-MMM-dd" value="${tskDetail.startDate}" /></td>
                        </tr>
                        <tr>
                            <th class="priority">Priority:</th><td class="priority"><c:out value="${tskDetail.priority}" /></td><th class="due-date">Due date:</th><td class="due-date"><fmt:formatDate pattern="yyyy-MMM-dd" value="${tskDetail.dueDate}" /></td>
                        </tr>
                        <tr>
                            <th class="assigned-to">Assignee:</th>
                            <td class="assigned-to">-</td>
                            <th>% Done:</th>
                            <td class="progress">


                                <c:set var="donePercent" scope="session" value="${tskDetail.donePercent}"/>
                                <c:if test="${donePercent == 0}">
                                    <p class="percent"><c:out value="${donePercent}" />%</p>
                                </c:if>
                                <c:if test="${donePercent > 0}">
                                    <p class="percent"><c:out value="${donePercent}" />0%</p>
                                </c:if>

                            </td>
                        </tr>
                        <tr>
                            <th class="category">Category:</th>
                            <td class="category"><c:out value="${tskDetail.tracker}" /></td>
                            <th></th>
                            <td></td>
                        </tr>
                        <tr>
                        <tr>
                            <th class="fixed-version">Target version:</th>
                            <td class="fixed-version">-</td>
                        </tr>
                        <tr>
                            <th class="cf_2">Resolution:</th><td class="cf_2">-</td>
                        </tr>
                    </tbody>
                </table>
                <hr>
                <strong>Description</strong>
                <div class="wiki">
                    <p>
                        <c:out value="${tskDetail.description}" />
                    </p>
                </div>
        </div>

    </div>
</div>



</body>

</html>
<script type="text/javascript">

</script>