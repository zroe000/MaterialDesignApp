<style>
#test{

    padding: 2px 10px 1px 0px;
    margin: 0 0 10px 0;
    color: #444;
}
#innerPanel{
    width: 89% !important;
    height: auto;
    /* z-index: -1; */
    border: 2px solid #f3e5e5;
    margin-left: 5%;
}
#tracker, #subject, #parentTask, #priority, #status, #assignedTo, #perDone, #complexity{
    height: 24px !important;
    width: 200px;
    margin-left: 3%;
}
.required{
    color: #bb0000;
}
/* ------
bootstrap DatePicker
                 -----*/
.datepicker {
    top: 0;
    left: 0;
    width: 216px;
    height: auto;
    font: 9pt 'Gotham', Arial, Helvetica, Sans-Serif;
    -webkit-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, .5);
    -moz-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, .5);
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, .5);
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
}
/* day title */
.dow {
    border-bottom: 1px solid #bbb;
}
/* bootstrap ddm */
.dropdown-menu {
    border-radius:0px;
    padding:0
}
.datepicker:before {
    content:'';
    display: inline-block;
    border-left: 7px solid transparent;
    border-right: 7px solid transparent;
    border-bottom: 7px solid #ccc;
    border-bottom-color: rgba(0, 0, 0, 0.2);
    position: absolute;
    top: -7px;
    left: 6px;
}
.datepicker:after {
    content:'';
    display: inline-block;
    border-left: 6px solid transparent;
    border-right: 6px solid transparent;
    border-bottom: 6px solid #ffffff;
    position: absolute;
    top: -6px;
    left: 7px;
}


.nav li.active {
    background-color: white;
    color:white;
}
#test{
    color: black;
    margin-left: 80px;
}
#jpgCalendar{
    width:50px;
    height:50px;
    margin-left: 93px;
    margin-top: -14px
}
#btnPreview{
    background-color: #8898b7
}




</style>

<%@ include file="/WEB-INF/views/tiles/template/defaultMenu.jsp" %>
<div>
    <h4 id="test">NEW ISSUE</h4>
</div>


<div class="panel panel-default">
<div class="panel-body">
<div class="panel-body" id="innerPanel">
<form:form id="form-newIssue" commandName="newIssue" method="POST" >
<div class="row" style="margin-left: 10%; padding-bottom: 15px !important">
    <div class="col-sm-1"><label for="tracker">Tracker<span class="required"> *</span></label></div>
    <form:select class="col-sm-2" id="tracker" path="tracker" />
</div>
<div class="row" style="margin-left: 10%; padding-bottom: 15px !important" >
    <div class="col-sm-1">
        <label for="subject">Subject<span class="required">*</span></label>
    </div>
    <div>
        <form:input type="text" class="col-sm-6" id="subject" path="subject" />
    </div>
</div>
<div class="row" style="margin-left: 10%; padding-bottom: 15px !important" >
    <div class="col-sm-1">
        <label for="parentTask">Parent Task<span class="required">*</span></label>
    </div>
    <div>
        <form:input type="text" class="col-sm-3" id="parentTask" path = "parentTask" />
    </div>
</div>
<div class="row" style="margin-left: 10%; padding-bottom: 15px !important">
    <div class="col-sm-1">
        <label>Description</label>
    </div>
    <div class="col-sm-10">

        <form:textarea class="textarea" id="descTxtArea"  placeholder="Enter text ..." style="width: 810px; height: 200px" path="description" rows="2" cols="2"  />
    </div>
</div>
<div class="row" style="margin-left: 17.5%; padding-bottom: 15px !important">
    <div class="col-sm-4">

       <div id="remaining"></div>
    </div>
</div>

<div></div>
<div class="row" style="margin-left: 10%; padding-bottom: 15px !important">
    <div class ="col-sm-6">
        <div class="col-sm-2">
            <label for="status">Status<span class="required">*</span></label>
        </div>
        <div class="col-sm-2">
            <form:select path="status" class="col-sm-2" id="status" />
        </div>
    </div>
    <div class="col-sm-6">
        <div class="col-sm-2">
            <label for="startDate">Start Date</label>
        </div>
        <div class="col-sm-2">
            <form:input  type="text"   id="startDate" path="startDate" />
        </div>
        <div class="col-sm-2">
            <a href="" id="stDate">
                <img id="jpgCalendar" src="/resources/images/calendar.jpg" />
            </a>

        </div>
    </div>
</div>
<div class="row" style="margin-left: 10%; padding-bottom: 15px !important">
    <div class="col-sm-6">
        <div class="col-sm-2">
            <label for="priority">Priority<span class="required">*</span></label>
        </div>
        <div class="col-sm-2">
            <form:select path="priority" class="col-sm-2" id="priority" />
        </div>
    </div>
    <div class="col-sm-6">
        <div class="col-sm-2">
            <label for="endDate">End Date</label>
        </div>
        <div class="col-sm-2">
            <form:input path="dueDate"  type="text"   id="endDate" />
        </div>
        <div class="col-sm-2">
            <a href="" id="etDate">
                <img id="jpgCalendar" src="/resources/images/calendar.jpg" />
            </a>
        </div>
    </div>
</div>
<div class="row" style="margin-left: 10%; padding-bottom: 15px !important">
    <div class="col-sm-6">
        <div class="col-sm-2">
            <label for="assignedTo">Assigned To</label>
        </div>
        <div class="col-sm-2">
            <form:select path="assignedTo" class="col-sm-2" id="assignedTo" name="assignedTo" />
        </div>
    </div>
    <div class="col-sm-6">
        <div class="col-sm-3">
            <label for="estimatedTime">Estimated Time</label>
        </div>
        <div class="col-sm-3">
            <form:input path="estimatedTime" style="width:50px !important"   type="text"   id="estimatedTime" /><span>Hours</span>
        </div>
    </div>
</div>
<div class="row" style="margin-left: 10%; padding-bottom: 15px !important" >
    <div class="col-sm-6">

    </div>
    <div class="col-sm-6">
        <div class="col-sm-3">
            <label for="perDone">% Done</label>
        </div>
        <div class="col-sm-3">
            <form:select class="col-sm-2" id="perDone" path="donePercent" />
        </div>
    </div>
</div>
<div class="row" style="margin-left: 10%; padding-bottom: 15px !important">
    <div class="col-sm-6">
        <div class="col-sm-2">
            <label for="actualStart">Actual Start</label>
        </div>
        <div class="col-sm-2">
            <form:input path="actualStart"  type="text"   id="actualStart" />
        </div>
        <div class="col-sm-2">
            <a href="#" id="actStart">
                <img id="jpgCalendar" src="/resources/images/calendar.jpg" />
            </a>

        </div>
    </div>
    <div class="col-sm-6">
        <div class="col-sm-3">
            <label for="complexity">Complexity</label>
        </div>
        <div class="col-sm-3">
            <form:select  id="complexity" path="complexity" />
        </div>
    </div>
</div>
<div class="row" style="margin-left: 10%; padding-bottom: 15px !important">
    <div class="col-sm-6">
        <div class="col-sm-2">
            <label for="actualCompletion">Actual Completion</label>
        </div>
        <div class="col-sm-2">
            <form:input path="actualCompletion"  type="text"   id="actualCompletion" />
        </div>
        <div class="col-sm-2" >
            <a href="" id="actComplete">
                <img id="jpgCalendar" src="/resources/images/calendar.jpg" />
            </a>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="col-sm-3">
            <label for="revisionNum">Revision Number</label>
        </div>
        <div class="col-sm-3">
            <form:input path="revisionNumber"  type="text"   id="revisionNum" />
        </div>
    </div>
</div>
<div class="row" style="margin-left:10%; padding-bottom: 15px !important">
    <div class="col-sm-6">
        <div class="col-sm-2">
            <label for="filesCommited">Files Commited</label>
        </div>
        <div class="col-sm-3">
            <form:textarea path="filesCommited" id="filesCommited" rows="2" cols="40" />


        </div>
    </div>
    <div class="col-sm-6">

    </div>
</div>


<div class="row" style="margin-left:10%; padding-bottom: 15px !important">
    <div class="col-sm-1">
        Watchers
    </div>
    <div class="col-sm-3">
        <c:forEach items="${redmineUsers}" var="redmineUser">
            <input type="checkbox"  name="watchers"  value="${redmineUser.fullName}">${redmineUser.firstName} ${redmineUser.lastName}<br>
        </c:forEach>
    </div>
    <div class="col-sm-4">
        <label>Optional Description:</label>
        <form:input path="description" style="width:300px;" />
    </div>
</div>

</form:form>
<div class="row" style="margin-left:11.5%; padding-bottom:15px !important">
    <div class="col-sm-4">

        <form modelAttribute="myUploadForm" id="submitUploadForm">
            <label>Files</label> <input name="fileDatas" type="file"/><br />
        </form>
    </div>

</div>
<div class="row" style="margin-left:4%">
    <div class="col-sm-1" style="width:6% !important">
        <input type="submit" value="Create" id="continue">
    </div>
    <div class="col-sm-2">
        <input type="submit" value="Create and Continue" id="continueAndSubmit">
    </div>
    <div class="col-sm-1" style="width:6% !important">
        <input type="submit" value="Preview" id="btnPreview">
    </div>
</div>

</div>
</div>
</div>
<script type="text/javascript">


var make_button_active = function()
    {
        //Get item siblings
        var siblings =($(this).siblings());

        //Remove active class on all buttons
        siblings.each(function (index)
                {
                    $(this).removeClass('active');
                }
        )


        //Add the clicked button class
        $(this).addClass('active');
    }

    //Attach events to menu
    $(document).ready(
            function()
            {
                $(".nav li").click(make_button_active);
            }
    )
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
    $('.textarea').wysihtml5();
    $('.textarea').css('margin-right', "50px");
    $('.textarea').css('background-color', "yellow");
/*  $('.count').text($(this).val().length);*/

    $("#actStart").click(function(e){
        /*alert("actual start");*/

        e.preventDefault();
        loadAllDatepickers();
        $("#actualStart").click().focus();

        return false;
    });
    $("#actComplete").click(function(e){
        e.preventDefault();
        loadAllDatepickers();
        $("#actualCompletion").click().focus();
        return false;
    });
    $("#stDate").click(function(e){
        e.preventDefault();
        loadAllDatepickers();
        $("#startDate").click().focus();
        return false;
    });
    $("#etDate").click(function(e){
        e.preventDefault();
        loadAllDatepickers();
        $("#endDate").click().focus();
        return false;
    });
    $("#continue").click(function(){

        uploadFile();
        var selectedWatchers=[];
        $("input:checkbox[name=watchers]:checked").each(function(){
            selectedWatchers.push($(this).val());
        });

        $('#form-newIssue').attr('action', "/saved/newIssue" + "/" + selectedWatchers);
        $('#form-newIssue').submit();


    });
    function uploadFile(){
        $.ajax({
            url: '/uploadOneFile',
            type: "POST",
            data: new FormData(document.getElementById("submitUploadForm")),
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false
        }).done(function(data) {


        }).fail(function(jqXHR, textStatus) {
            //alert(jqXHR.responseText);

        });

    }
    $("#continueAndSubmit").click(function(){


        uploadFile();
        var selectedWatchers=[];
        $("input:checkbox[name=watchers]:checked").each(function(){
            selectedWatchers.push($(this).val());
        });

        $('#form-newIssue').attr('action', "/saved/newIssue" + "/" + selectedWatchers);
        $('#form-newIssue').submit();


    });

    $(document).ready(function () {

        var arrayObj = new Object();
        arrayObj[1] = "Low";
        arrayObj[2] = "Mid";
        arrayObj[3] = "High";
        var elem = document.getElementById('complexity');
        df = document.createDocumentFragment(); // create a document fragment to hold the options while we create them
        for (var i = 1; i <= 3; i++) { // loop, i like 42.
            var option = document.createElement('option'); // create the option element
            option.value = i; // set the value property
            option.appendChild(document.createTextNode(arrayObj[i])); // set the textContent in a safe way.
            df.appendChild(option); // append the option to the document fragment
        }
        elem.appendChild(df); // append the document fragment to the DOM. this is the better way rather than setting innerHTML a bunch of times (or even once with a long string)
        $('#perDone').append($("<option></option>").val(0).html("%0"));
        $('#perDone').append($("<option></option>").val(1).html("%10"));
        $('#perDone').append($("<option></option>").val(2).html("%20"));
        $('#perDone').append($("<option></option>").val(3).html("%30"));
        $('#perDone').append($("<option></option>").val(4).html("%40"));
        $('#perDone').append($("<option></option>").val(5).html("%50"));
        $('#perDone').append($("<option></option>").val(6).html("%60"));
        $('#perDone').append($("<option></option>").val(7).html("%70"));
        $('#perDone').append($("<option></option>").val(8).html("%80"));
        $('#perDone').append($("<option></option>").val(9).html("%90"));
        $('#perDone').append($("<option></option>").val(10).html("%100"));




        var urlStatus = "/populate/status";
        var urlPriority = "/populate/priority";
        var urlTracker = "/populate/tracker";
        var urlAssignedTo= "/populate/assignedTo";

        $.get(urlStatus, null, function (data) {
            /*Populate all constant status status*/
            $.each(data, function(key, value){
                /*add data in the status id*/
                $('#status')
                        .append($("<option></option>")
                                .attr("value",key)
                                .text(value));
            });
        });
        $.get(urlPriority, null, function (data){
            /*Populate all constant priority*/
            $.each(data, function(key, value){
                /*add data in the priority id*/
                $('#priority').append($("<option></option>")
                        .attr("value", key)
                        .text(value));
            });
        });
        $.get(urlTracker, null, function (data){
            var keyTracks=[];
            var valTracks=[];
            $.each(data, function(key, value){
                keyTracks.push(key);
                valTracks.push(value);
                $('#tracker').append($("<option></option>")
                        .attr("value", key)
                        .text(value));
            });

        });
        $.get(urlAssignedTo, null, function (data){
            $.each(data, function(key, value){
                $('#assignedTo').append($("<option></option>")
                        .attr("value", key)
                        .text(value));
            });
        });
        /*Clear all dates input */
        $('#actualStart').val('');
        $('#actualCompletion').val('');
        $('#startDate').val('');
        $('#endDate').val('');
    });


</script>
