<%@taglib prefix="sec"
          uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
    #heading{
        border-bottom:1px solid #f5f5f5;
    }
    #headingMenu{
        margin-top:20px;
        height:30px;
        border-bottom:1px solid #f5f5f5;
    }
    #btnOk{
        margin-right:25px;
        display:inline;
    }
    #btnClear{
        margin-right:25px;
        display:inline;
    }

    #lblapply{
        color:black !important;
        margin-left:15px;

    }
    #lblclear{
        color:black !important;

    }
    #containerSrcBox{
        border-bottom:1px solid #f5f5f5;
    }
    #jpgCalendar{
        width:50px;
        height:30px;
        margin-left: 93px;
        margin-top: -6px
    }
    #divOption{
        margin-left: -7%;
        margin-top: -17px;
    }
    #divArrowDown{
        margin-left: 1%;
    }
    #divNextPrev{
        margin-top: 5%;
        margin-left: 2%;
    }
    #divSortSelectedColumns{
        margin-top: 5%;
        margin-left: 2%;
    }
    /*----- Accordion -----*/
    .accordion, .accordion * {
        float: left;
    }
    .accordion{
        width: 100%;
    }

    .flip-black{
        cursor:pointer;
        text-decoration: none !important;
        color: black !important;
    }
</style>
<%@ include file="/WEB-INF/views/tiles/template/defaultMenu.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/jquery/dataTables.min.css" />

<div class="panel-heading" id="heading">
    <div class="row">
        <div class="col-md-9">
            <h4 style="font-weight:bold">Issues</h4>
            <a class="glyphicon glyphicon-arrow-down" ></a>
        </div>
        <div class="col-md-3"  id="divSearch">
            <div class="row">
                <div class="col-md-5">
                    <h5 style="font-weight:bold;">Add Filter</h5>
                </div>
                <div class="col-md-7 data-offset-2" style="margin-top:3%;margin-left:-50px;">
                    <select style="width:150px;"  id="searchCategory" onchange="displayPanelFilter();">
                        <option>Tracker</option>
                        <option>Parent Task</option>
                        <option>Status</option>
                        <option>Priority</option>
                        <option>Subject</option>
                        <option>Done</option>
                        <option>File Commited</option>
                        <option>Estimated Time</option>
                        <option>Start Date</option>
                        <option>Due Date</option>
                        <option>Actual Start</option>
                        <option>Actual Completion</option>
                        <option>Complexity</option>
                        <option>Revision Number</option>
                        <option>Created Date</option>
                        <option>Assignee</option>
                    </select>

                </div>
            </div>

        </div>
    </div>

</div>


<div class="container pull-left" id="containerSrcBox">
    <div class="content-panel">
        <div class="row" style="margin-bottom:1%; display:none;" id="rowTracker">
            <div class="col-md-1" >
                <label for="txtTracker">Tracker</label>
            </div>
            <div class="col-md-1">
                <input id="cbTracker" type="checkbox" value="Tracker"  />
            </div>
            <div class="col-md-2" style="display:none;">
                <select id="criteriaTracker">
                    <option>is</option>
                    <option>is not</option>
                </select>
            </div>
            <div class="col-md-3" style="display:none;">
                <select id="trackerlist">
                    <option>Requirement</option>
                    <option>New Feature</option>
                    <option>Feature Enhancement</option>
                    <option>Feature Issue</option>
                    <option>ASRF</option>
                    <option>Data Defect</option>
                    <option>Development Task</option>
                    <option>Development Requirement</option>
                    <option>General Task</option>
                </select>
                <span class="glyphicon glyphicon-plus" id="expandTrackerListSel" style="position:absolute !important"></span>

            </div>
        </div>
        <div class="row" style="margin-bottom:1%; display:none;" id="rowStatus">
            <div class="col-md-1">
                <label for="txtStatus">Status</label>
            </div>
            <div class="col-md-1">
                <input id="cbStatus" type="checkbox" value="Status"  />
            </div>
            <div class="col-md-2" style="display:none;">
                <select id="statusCriteria">
                    <option>is</option>
                    <option>is not</option>
                </select>
            </div>
            <div class="col-md-3" style="display:none;">
                <select id="statuslist">
                    <option>ASSIGNED</option>
                    <option>Closed</option>
                    <option>Feedback</option>
                    <option>In Progress</option>
                    <option>New</option>
                    <option>Rejected</option>
                    <option>Resolved</option>
                </select>
                <span class="glyphicon glyphicon-plus" id="expandStatListSel" style="position:absolute !important"></span>
            </div>
        </div>
        <div class="row" style="margin-bottom:1%; display:none;" id="rowSubject">
            <div class="col-md-1">
                <label for="txtSubject">Subject</label>
            </div>
            <div class="col-md-1">
                <input id="cbSubject" type="checkbox" value="Subject"  />
            </div>
            <div class="col-md-2" style="display:none;">
                <select id="subjectCriteria">
                    <option>contains</option>
                    <option>doesn't contain</option>
                    <option>none</option>
                    <option>any</option>
                </select>
                <span class="glyphicon glyphicon-plus" id="expandSubCriteriaListSel" style="position:absolute !important"></span>
            </div>
            <div class="col-md-3" style="display:none;">
                <input type="text" placeholder="Please Type Any. . ." id="txtSubject" style="height:20px;" />
            </div>
        </div>
        <div class="row" style="margin-bottom:1%; display:none" id="rowPriority">
            <div class="col-md-1">
                <label for="txtPriority">Priority</label>
            </div>
            <div class="col-md-1">
                <input id="cbPriority" type="checkbox" value="Priority"  />
            </div>
            <div class="col-md-2" style="display:none;">
                <select id="priorityCriteria">
                    <option>is</option>
                    <option>is not</option>
                    <option>open</option>
                    <option>closed</option>
                </select>
            </div>
            <div class="col-md-3" style="display:none;">
                <select id="priorityList">
                    <option>Low</option>
                    <option>Normal</option>
                    <option>High</option>
                    <option>Urgent</option>
                    <option>Immediate</option>
                </select>
                <span class="glyphicon glyphicon-plus" id="expandPriorityListSel" style="position:absolute !important"></span>
            </div>
        </div>
        <div class="row" style="margin-bottom:1%; display:none;" id="rowStartDate">
            <div class="col-md-1">
                <label for="txtStartDate">Start Date</label>
            </div>
            <div class="col-md-1">
                <input id="cbStartDate" type="checkbox" value="Start Date"  />
            </div>
            <div class="col-md-2" style="display:none;">
                <select id="startDateCriteria">
                    <option>is</option>
                    <option>>=</option>
                    <option><=</option>
                    <option>in less than</option>
                    <option>in more than</option>
                    <option>in the next</option>
                    <option>today</option>
                    <option>yesterday</option>
                    <option>this week</option>
                    <option>last week</option>
                    <option>last two week</option>
                    <option>this month</option>
                    <option>less than days ago</option>
                    <option>more than days ago</option>
                    <option>in the past</option>
                    <option>days ago</option>
                    <option>none</option>
                    <option>any</option>
                </select>
                <span class="glyphicon glyphicon-plus" id="expandStartDateCriterialList" style="position:absolute !important"></span>
            </div>
            <div class="col-md-3" style="display:none;">
                <div class="col-sm-4">
                    <input  type="text" id="startDate" style="height:20px;" />
                </div>
                <div class="col-sm-2">
                    <a href="" id="stDate">
                        <img id="jpgCalendar" src="/resources/images/calendar.jpg" />
                    </a>
                </div>
            </div>

        </div>
        <div class="row" style="margin-bottom:1%; display:none;" id="rowEndDate">
            <div class="col-md-1">
                <label for="txtEndDate">End Date</label>
            </div>
            <div class="col-md-1">
                <input id="cbEndDate" type="checkbox" value="End Date"  />
            </div>
            <div class="col-md-2" style="display:none;">
                <select id="endDateCriteria">
                    <option>is</option>
                    <option>>=</option>
                    <option><=</option>
                    <option>in less than</option>
                    <option>in more than</option>
                    <option>in the next</option>
                    <option>today</option>
                    <option>yesterday</option>
                    <option>this week</option>
                    <option>last week</option>
                    <option>last two week</option>
                    <option>this month</option>
                    <option>less than days ago</option>
                    <option>more than days ago</option>
                    <option>in the past</option>
                    <option>days ago</option>
                    <option>none</option>
                    <option>any</option>
                </select>
                <span class="glyphicon glyphicon-plus" id="expandEndDateCriteriaList" style="position:absolute !important"></span>
            </div>
            <div class="col-md-3" style="display:none;">
                <div class="col-sm-4">
                    <input  type="text" id="endDate" style="height:20px;" />
                </div>
                <div class="col-sm-2">
                    <a href="" id="edDate">
                        <img id="jpgCalendar" src="/resources/images/calendar.jpg" />
                    </a>
                </div>
            </div>

        </div>
        <div class="row" style="margin-bottom:1%; display:none;" id="rowActualStart">
            <div class="col-md-1">
                <label for="txtActualStart">Actual Start</label>
            </div>
            <div class="col-md-1">
                <input id="cbActualStart" type="checkbox" value="Actual Start"  />
            </div>
            <div class="col-md-2" style="display:none;">
                <select id="actualStartCriteria">
                    <option>is</option>
                    <option>>=</option>
                    <option><=</option>
                    <option>in less than</option>
                    <option>in more than</option>
                    <option>in the next</option>
                    <option>today</option>
                    <option>yesterday</option>
                    <option>this week</option>
                    <option>last week</option>
                    <option>last two week</option>
                    <option>this month</option>
                    <option>less than days ago</option>
                    <option>more than days ago</option>
                    <option>in the past</option>
                    <option>days ago</option>
                    <option>none</option>
                    <option>any</option>
                </select>
                <span class="glyphicon glyphicon-plus" id="expandActualStartCriteria" style="position:absolute !important"></span>
            </div>
            <div class="col-md-3" style="display:none;">
                <div class="col-sm-4">
                    <input  type="text" id="actualStart" style="height:20px;" />
                </div>
                <div class="col-sm-2">
                    <a href="" id="actStart">
                        <img id="jpgCalendar" src="/resources/images/calendar.jpg" />
                    </a>
                </div>
            </div>

        </div>
        <div class="row" style="margin-bottom:1%; display:none;" id="rowActualCompletion">
            <div class="col-md-1">
                <label for="txtActualCompletion">Actual Completion</label>
            </div>
            <div class="col-md-1">
                <input id="cbActualCompletion" type="checkbox" value="Actual Completion"  />
            </div>
            <div class="col-md-2" style="display:none;">
                <select id="actualCompletionCriteria">
                    <option>is</option>
                    <option>>=</option>
                    <option><=</option>
                    <option>in less than</option>
                    <option>in more than</option>
                    <option>in the next</option>
                    <option>today</option>
                    <option>yesterday</option>
                    <option>this week</option>
                    <option>last week</option>
                    <option>last two week</option>
                    <option>this month</option>
                    <option>less than days ago</option>
                    <option>more than days ago</option>
                    <option>in the past</option>
                    <option>days ago</option>
                    <option>none</option>
                    <option>any</option>
                </select>
                <span class="glyphicon glyphicon-plus" id="expandActualCompletionCriteriaList" style="position:absolute !important"></span>
            </div>
            <div class="col-md-3" style="display:none;">
                <div class="col-sm-4">
                    <input  type="text" id="actualCompletion" style="height:20px;" />
                </div>
                <div class="col-sm-2">
                    <a href="" id="actCompletion">
                        <img id="jpgCalendar" src="/resources/images/calendar.jpg" />
                    </a>
                </div>
            </div>

        </div>
        <div class="row" style="margin-bottom:1%; display:none;" id="rowComplexity">
            <div class="col-md-1">
                <label for="txtComplexity">Complexity</label>
            </div>
            <div class="col-md-1">
                <input id="cbComplexity" type="checkbox" value="Complexity"  />
            </div>
            <div class="col-md-2" style="display:none;">
                <select id="criteriaComplexity">
                    <option>is</option>
                    <option>is not</option>
                </select>
            </div>
            <div class="col-md-3" style="display:none;">
                <select id="typeComplexity">
                    <option>Low</option>
                    <option>Mid</option>
                    <option>High</option>
                </select>
                <span class="glyphicon glyphicon-plus" id="expandTypeComplexityList" style="position:absolute !important"></span>
            </div>
        </div>
        <div class="row" style="margin-bottom:1%; display:none;" id="rowDone">
            <div class="col-md-1">
                <label for="txtDone">Done</label>
            </div>
            <div class="col-md-1">
                <input type="checkbox" id="cbDone" value="Done" />
            </div>
            <div class="col-md-2" style="display:none;">
                <select id="criteriaDone">
                    <option>is</option>
                    <option>is not</option>
                </select>

            </div>
            <div class="col-md-3" style="display:none;">
                <select id="selectPercentDone">
                    <option>10%</option>
                    <option>20%</option>
                    <option>30%</option>
                    <option>40%</option>
                    <option>50%</option>
                    <option>60%</option>
                    <option>70%</option>
                    <option>80%</option>
                    <option>90%</option>
                    <option>100%</option>
                </select>
                <span class="glyphicon glyphicon-plus" id="expandSelectPercentDoneList" style="position:absolute !important"></span>
            </div>
        </div>
        <div class="row" style="margin-bottom:1%; display:none;" id="rowAssignee">
           <div class="col-md-1">
                <label for="txtAssignee">Assignee</label>
           </div>
           <div class="col-md-1">
               <input type="checkbox" id="assignee" value="Assignee">
           </div>
           <div class="col-md-2" style="display:none;">
                <select id="criterialAssignee">
                    <option>is</option>
                    <option>is not</option>
                    <option>none</option>
                    <option>any</option>
                </select>
           </div>
           <div class="col-md-3" style="display:none;">
                <select id="assignedTo"></select>
               <span class="glyphicon glyphicon-plus" id="expandAssignedToList" style="position:absolute !important"></span>
           </div>
        </div>

    </div>

</div>

<div class="accordion">
    <div class="accordion-section">
        <a id="flip" class="flip-black">Options &#8883;</a>
        <div id="panel">
            <div class="row">
                <div class="col-md-2">
                    <label style="padding:43%;">Columns</label>
                </div>
                <div class="col-md-1">
                    <label>Available columns</label>
                    </br>
                    <select multiple style="height:130px;">
                        <option value="tracker">Tracker</option>
                        <option value="parenttask">Parent Task</option>
                        <option value="priority">Priority</option>
                        <option value="subject">Subject</option>
                        <option value="assignedTo">Assigned To</option>
                        <option value="done">Done</option>
                        <option value="fCommited">Files Commited</option>
                        <option value="estimatedTime">Estimated Time</option>
                        <option value="sStartDate">Start Date</option>
                        <option value="dDueDate">Due Date</option>
                        <option value="complexity">Complexity</option>
                        <option value="rNumber">Revision Number</option>
                        <option value="createdDate">Created Date</option>
                    </select>
                </div>
                <div id="divNextPrev" class="col-md-1">
                    <input type="button" value="&#8594"  >
                    </br>
                    <input type="button" value="&#8592" style="margin-top:13px;margin-left:-30px;" >

                </div>
                <div class="col-md-1" style="margin-left:-5%">
                    <label>Selected columns</label>
                    </br>
                    <select multiple style="height:130px;">
                        <option>Tracker</option>
                        <option>Parent Task</option>
                        <option>Priority</option>
                        <option>Subject</option>
                        <option>Assigned To</option>
                        <option>Done</option>
                        <option>Files Commited</option>
                        <option>Estimated Time</option>
                        <option>Start Date</option>
                        <option>Due Date</option>
                        <option>Complexity</option>
                        <option>Revision Number</option>
                        <option>Created Date</option>
                    </select>
                </div>

                <div id="divSortSelectedColumns" class="col-md-1">
                    <input type="button" value="&#8593&#8593" style="width:30px"  >
                    </br>
                    <input type="button" value="&#8593" style="width:30px; margin-top:5px;margin-left:-30px;">
                    </br>
                    <input type="button" value="&#8595" style="width:30px; margin-top:10px;margin-left: -30px;" >
                    </br>
                    <input type="button" value="&#8595&#8595" style="width:30px; margin-top:15px; margin-left: -30px;">
                </div>
            </div>
        </div>


    </div>
</div>
<div class="row" id="btnSearchDiv">
    <div class="col-md-1">
        <a href="#" id="btnApply">
            <span class="glyphicon glyphicon-ok" style="color:red;"></span>&nbsp;&nbsp;Apply
        </a>
    </div>
    <div class="col-md-1" id="btnClear">
        <a href="#">
            <span class="glyphicon glyphicon-repeat" style="color:green;"></span>&nbsp;&nbsp;Clear
        </a>
    </div>
</div>
<table id="IssueTable" cellspacing="0" width="0" border="0" class="table table-striped table-bordered dt-responsive nowrap">
     <thead>
        <tr>
            <th>#</th>
            <th>Tracker</th>
            <th>Parent Task</th>
            <th>Priority</th>
            <th>Subject</th>
            <th>Assigned To</th>
            <th>Done</th>
            <th>Files Commited</th>
            <th>Estimated Time</th>
            <th>Start Date</th>
            <th>Due Date</th>
            <th>Complexity</th>
            <th>Revision Number</th>
            <th>Created</th>
        </tr>
     </thead>
 </table>
<table id="IssueTableFiltered" cellspacing="0" width="0" border="0" class="table table-striped table-bordered dt-responsive nowrap" style="display:none;">
    <thead>
    <tr>
        <th>#</th>
        <th>Tracker</th>
        <th>Parent Task</th>
        <th>Priority</th>
        <th>Subject</th>
        <th>Assigned To</th>
        <th>Done</th>
        <th>Files Commited</th>
        <th>Estimated Time</th>
        <th>Start Date</th>
        <th>Due Date</th>
        <th>Complexity</th>
        <th>Revision Number</th>
        <th>Created</th>
    </tr>
    </thead>
</table>
<script type="text/javascript" src="<c:url value="/resources/jquery/issuetable.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/jquery/issue-search.js"/>"></script>
<script style="text/javascript">
/*Status List Multi Select*/
$('#expandStatListSel').hover(function(){
    $(this).css('cursor', 'pointer');
});
$('#expandStatListSel').click(function(){
    if($('#statuslist').prop("multiple") == true){
       $('#statuslist').removeAttr('multiple');
    }else{
        $('#statuslist').attr('multiple','multiple');
    }
});
/*Tracker List Multi Select*/
$("#expandTrackerListSel").hover(function(){
   $(this).css('cursor', 'pointer');
});
$("#expandTrackerListSel").click(function(){
    if($('#trackerlist').prop("multiple") == true){
        $('#trackerlist').removeAttr('multiple');
    }else{
        $('#trackerlist').attr('multiple', 'multiple');
    }
});
/*Subcriteria List Multi Select*/
$('#expandSubCriteriaListSel').hover(function(){
    $(this).css('cursor', 'pointer');
});
$('#expandSubCriteriaListSel').click(function(){
    if($('#subjectCriteria').prop("multiple") == true){
        $('#subjectCriteria').removeAttr('multiple');
    }else{
        $('#subjectCriteria').attr('multiple', 'multiple');
    }
});
/*Priority List Multi Select*/
$('#expandPriorityListSel').hover(function(){
    $(this).css('cursor', 'pointer');
});
$('#expandPriorityListSel').click(function(){
    if($('#priorityList').prop("multiple") == true){
        $('#priorityList').removeAttr('multiple');
    }else{
        $('#priorityList').attr('multiple', 'multiple');
    }
});
/*Start date Criteria Multi Select*/
$('#expandStartDateCriterialList').hover(function(){
    $(this).css('cursor', 'pointer');
});
$('#expandStartDateCriterialList').click(function(){
    if($('#startDateCriteria').prop("multiple") == true){
        $('#startDateCriteria').removeAttr('multiple');
    }else{
        $('#startDateCriteria').attr('multiple', 'multiple');
    }
});
/*End date criterial multi select*/
$('#expandEndDateCriteriaList').hover(function(){
    $(this).css('cursor', 'pointer');
});
$('#expandEndDateCriteriaList').click(function(){
    if($('#endDateCriteria').prop("multiple") == true){
        $('#endDateCriteria').removeAttr('multiple');
    }else{
        $('#endDateCriteria').attr('multiple', 'multiple');
    }
});
/*Actual Start Criteria List*/
$('#expandActualStartCriteria').hover(function(){
    $(this).css('cursor', 'pointer');
});
$('#expandActualStartCriteria').click(function(){
    if($('#actualStartCriteria').prop("multiple") == true){
        $('#actualStartCriteria').removeAttr('multiple');
    }else{
        $('#actualStartCriteria').attr('multiple', 'multiple');
    }
});
/*Actual Completion Criteria List Multi Select*/
$('#expandActualCompletionCriteriaList').hover(function(){
    $(this).css('cursor', 'pointer');
});
$('#expandActualCompletionCriteriaList').click(function(){
    if($('#actualCompletionCriteria').prop("multiple") == true){
        $('#actualCompletionCriteria').removeAttr('multiple');
    }else{
        $('#actualCompletionCriteria').attr('multiple', 'multiple');
    }
});
/*Expand Type Complexity Criteria List*/
$('#expandTypeComplexityList').hover(function(){
    $(this).css('cursor', 'pointer');
});
$('#expandTypeComplexityList').click(function(){
    if($('#typeComplexity').prop("multiple") == true){
        $('#typeComplexity').removeAttr('multiple');
    }else{
        $('#typeComplexity').attr('multiple', 'multiple');
    }
});
/*Expand Select Percent Done Multi Select*/
$('#expandSelectPercentDoneList').hover(function(){
    $(this).css('cursor', 'pointer');
});
$('#expandSelectPercentDoneList').click(function(){
    if($('#selectPercentDone').prop("multiple") == true){
        $('#selectPercentDone').removeAttr('multiple');
    }else{
        $('#selectPercentDone').attr('multiple', 'multiple');
    }
});
/*Expand Select Assigned to Multi Select */
$('#expandAssignedToList').hover(function(){
    $(this).css('cursor', 'pointer');
});
$('#expandAssignedToList').click(function(){
    if($('#assignedTo').prop("multiple") == true){
        $('#assignedTo').removeAttr('multiple');
    }else{
        $('#assignedTo').attr('multiple', 'multiple');
    }
});


$(document).ready(function() {

    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });


});
$(document).ready(function(){
    $('#IssueTableFiltered_wrapper').css('display', 'none');
});

var urlAssignedTo= "/populate/assignedTo";

$.get(urlAssignedTo, null, function (data) {
    /*Populate all constant status status*/
    $.each(data, function(key, value){
        /*add data in the status id*/
        $('#assignedTo')
                .append($("<option></option>")
                        .attr("value",key)
                        .text(value));
    });
});
        $("#stDate").click(function(e){
            e.preventDefault();
            loadAllDatepickers();
            $("#startDate").click().focus();
            return false;
        });

        $('#edDate').click(function(e){
            e.preventDefault();
            loadAllDatepickers();
            $('#endDate').click().focus();
        });
        $("#actStart").click(function(e){
            e.preventDefault();
            loadAllDatepickers();
            $('#actualStart').click().focus();
        });
        $('#actCompletion').click(function(e){
            e.preventDefault();
            loadAllDatepickers();
            $('#actualCompletion').click().focus();
        });
        function loadAllDatepickers(){
            $('#actualStart').datepicker({

                format: "dd/mm/yyyy"

            });
            $('#actualCompletion').datepicker({
                format: "dd/mm/yyyy"

            });
            $("#startDate").datepicker({
                format: "dd/mm/yyyy"
            });
            $("#endDate").datepicker({
                format: "dd/mm/yyyy"
            });
        }
        $(document).ready(function(){
            $('#btnSearchDiv').css('display', 'none');
            SampleParentObject.loadDataTables();
        });
        $('#heading a').hover(function(){
            $(this).css('cursor', 'pointer');
        });
        $('#lblapply').hover(function(){
           $(this).css('cursor', 'pointer');
        });
        $('#lblclear').hover(function(){
           $(this).css('cursor', 'pointer');
        });


        $("#heading a").click(function(e) {

            $(this).toggleClass("glyphicon glyphicon-arrow-down glyphicon glyphicon-arrow-right");

            $('#divSearch').css('display','block');

            $('#containerSrcBox').slideToggle('slow');

        });
function displayPanelFilter(){
    $("#searchCategory option:selected").attr('disabled','disabled');
    $('#btnSearchDiv').css('display', 'block');
    var e = document.getElementById("searchCategory");
    var category = e.options[e.selectedIndex].text;
    var txtTracker = $("label[for=txtTracker]").text();
    var txtStatus = $("label[for=txtStatus]").text();
    var txtSubject = $("label[for=txtSubject]").text();
    var txtPriority = $("label[for=txtPriority]").text();
    var txtStartDate = $("label[for=txtStartDate]").text();
    var txtEndDate = $("label[for=txtEndDate]").text();
    var txtDueDate = txtEndDate.replace("End", "Due");
    var txtActualStart = $("label[for=txtActualStart]").text();
    var txtActualCompletion = $("label[for=txtActualCompletion]").text();
    var txtComplexity = $("label[for=txtComplexity]").text();
    var txtDone = $("label[for=txtDone]").text();
    var txtAssignee = $("label[for=txtAssignee]").text();

    switch (category) {
        case txtTracker:

            document.getElementById("rowTracker").style.display = "block";
            console.log("Tracker");
            break;
        case txtStatus:

            document.getElementById("rowStatus").style.display ="block";
            console.log("Status");
            break;
        case txtSubject:
            document.getElementById("rowSubject").style.display = "block";
            console.log("Subject");
            break;
        //txtSubject, txtPriority, txtStartDate, txtEndDate, txtActualStart, txtActualCompletion, txtComplexity, txtDone, txtAssignee
        case txtPriority:
            document.getElementById("rowPriority").style.display = "block";
            console.log("Priority");
            break;
        case txtStartDate:
            document.getElementById("rowStartDate").style.display = "block";
            console.log("Start Date");
            break;
        case txtDueDate:
            document.getElementById("rowEndDate").style.display = "block";
            console.log("End Date");
            break;
        case txtActualStart :
            document.getElementById("rowActualStart").style.display = "block";
            console.log("Actual Start");
            break;
        case txtActualCompletion:
            document.getElementById("rowActualCompletion").style.display = "block";
            console.log("Actual Completion");
            break;
        case txtComplexity:
            document.getElementById("rowComplexity").style.display = "block";
            console.log("Complexity");
            break;
        case txtDone:
            document.getElementById("rowDone").style.display = "block";
            console.log("Done");
            break;
        case txtAssignee:
            document.getElementById("rowAssignee").style.display = "block";
            console.log("Assignee");
    }

}
$('#txtSubject').keypress(function(e){
    if(e.which == 13){
        console.log("Yest it was entered");
        $("input[type=checkbox][checked]").each(
                function() {
                    // Insert code here
                    alert($(this).val());
                }
        );

    }
});
$("#rowStatus input:checkbox").change(function() {
    var ischecked= $(this).is(':checked');
    if(!ischecked){
        $("#rowStatus div:nth-child(3)" ).css('display', 'none');
        $("#rowStatus div:nth-child(4)").css('display', 'none');
    }else{
        $("#rowStatus div:nth-child(3)" ).css('display', 'block');
        $("#rowStatus div:nth-child(4)").css('display', 'block');
    }

});
$("#rowTracker input:checkbox").change(function(){
    var ischecked = $(this).is(':checked');
    if(!ischecked){
        $("#rowTracker div:nth-child(3)" ).css('display', 'none');
        $("#rowTracker div:nth-child(4)").css('display', 'none');
    }else{
        $("#rowTracker div:nth-child(3)" ).css('display', 'block');
        $("#rowTracker div:nth-child(4)").css('display', 'block');
    }
});
$("#rowSubject input:checkbox").change(function(){
    var ischecked = $(this).is(':checked');
    if(!ischecked){
        $("#rowSubject div:nth-child(3)").css('display', 'none');
        $("#rowSubject div:nth-child(4)").css('display', 'none');
    }else{
        $("#rowSubject div:nth-child(3)" ).css('display', 'block');
        $("#rowSubject div:nth-child(4)").css('display', 'block');
    }
});
$("#rowPriority input:checkbox").change(function(){
    var ischecked = $(this).is(':checked');
    if(!ischecked){
        $("#rowPriority div:nth-child(3)").css('display', 'none');
        $("#rowPriority div:nth-child(4)").css('display', 'none');
    }else{
        $("#rowPriority div:nth-child(3)").css('display', 'block');
        $("#rowPriority div:nth-child(4)").css('display', 'block');
    }
});
$("#rowStartDate input:checkbox").change(function(){
    var ischecked = $(this).is(':checked');
    if(!ischecked){
        $("#rowStartDate div:nth-child(3)").css('display', 'none');
        $("#rowStartDate div:nth-child(4)").css('display', 'none');
    }else{
        $("#rowStartDate div:nth-child(3)").css('display', 'block');
        $("#rowStartDate div:nth-child(4)").css('display', 'block');
    }
});
$("#rowEndDate input:checkbox").change(function(){
   var ischecked = $(this).is(':checked');
    if(!ischecked){
        $('#rowEndDate div:nth-child(3)').css('display', 'none');
        $('#rowEndDate div:nth-child(4)').css('display', 'none');
    }else{
        $('#rowEndDate div:nth-child(3)').css('display', 'block');
        $('#rowEndDate div:nth-child(4)').css('display', 'block');
    }
});
$("#rowActualStart input:checkbox").change(function(){
    var ischecked = $(this).is(':checked');
    if(!ischecked){
        $('#rowActualStart div:nth-child(3)').css('display', 'none');
        $('#rowActualStart div:nth-child(4)').css('display', 'none');
    }else{
        $('#rowActualStart div:nth-child(3)').css('display', 'block');
        $('#rowActualStart div:nth-child(4)').css('display', 'block');
    }
});
$("#rowActualCompletion input:checkbox").change(function(){
    var ischecked = $(this).is(':checked');
    if(!ischecked){
        $('#rowActualCompletion div:nth-child(3)').css('display', 'none');
        $('#rowActualCompletion div:nth-child(4)').css('display', 'none');
    }else{
        $('#rowActualCompletion div:nth-child(3)').css('display', 'block');
        $('#rowActualCompletion div:nth-child(4)').css('display', 'block');
    }
});
$("#rowComplexity input:checkbox").change(function(){
    var ischecked = $(this).is(':checked');
    if(!ischecked){
        $('#rowComplexity div:nth-child(3)').css('display', 'none');
        $('#rowComplexity div:nth-child(4)').css('display', 'none');
    }else{
        $('#rowComplexity div:nth-child(3)').css('display', 'block');
        $('#rowComplexity div:nth-child(4)').css('display', 'block');
    }
});
$("#rowDone input:checkbox").change(function(){
    var ischecked = $(this).is(':checked');
    if(!ischecked){
        $('#rowDone div:nth-child(3)').css('display', 'none');
        $('#rowDone div:nth-child(4)').css('display', 'none');
    }else{
        $('#rowDone div:nth-child(3)').css('display', 'block');
        $('#rowDone div:nth-child(4)').css('display', 'block');
    }
});
$("#rowAssignee input:checkbox").change(function(){
    var ischecked = $(this).is(':checked');
    if(!ischecked){
        $('#rowAssignee div:nth-child(3)').css('display', 'none');
        $('#rowAssignee div:nth-child(4)').css('display', 'none');
    }else{
        $('#rowAssignee div:nth-child(3)').css('display', 'block');
        $('#rowAssignee div:nth-child(4)').css('display', 'block');
    }
});
$('#btnApply').click(function(){

    $("#IssueTable").empty();
    $("#IssueTable").remove();

    $(".dataTables_paginate").remove();
    $("#IssueTableFiltered").css('display', 'block');
    SearchIssueObject.loadAllData();


});
$("#btnClear").click(function(){
    window.location.reload();
});


</script>
